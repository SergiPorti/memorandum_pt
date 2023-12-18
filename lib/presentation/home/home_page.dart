import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorandum_pt/bloc/beer/beer_bloc.dart';
import 'package:memorandum_pt/config/config.dart';
import 'package:memorandum_pt/config/dependency_injection/locator.dart';
import 'package:memorandum_pt/data/model/model.dart';
import 'package:memorandum_pt/presentation/utils/app_dimensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: false,
      body: BlocBuilder<BeerBloc, BeerState>(
        builder: (context, state) {
          if (state is BeerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BeerSucces) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.main,
                  vertical: AppDimensions.extraLarge),
              itemCount: (state).beers.length,
              itemBuilder: (context, index) {
                final Beer beer = (state).beers[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppDimensions.main),
                  child: GestureDetector(
                    onTap: () => locator<NavigationHandler>()
                        .goBeerDetails(context, beer),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              BorderRadius.circular(AppDimensions.xMain)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.large,
                            vertical: AppDimensions.main),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                                imageUrl: beer.imageUrl,
                                height: 50,
                                fit: BoxFit.fitHeight),
                            const SizedBox(width: AppDimensions.large),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  beer.name,
                                  style: const TextStyle(
                                      fontSize: AppDimensions.main,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: AppDimensions.main),
                                Text(beer.shortDescription,
                                    style: const TextStyle(
                                        fontSize: AppDimensions.xMain,
                                        fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          if (state is BeerFailure) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
