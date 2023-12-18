import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:memorandum_pt/config/config.dart';
import 'package:memorandum_pt/config/dependency_injection/locator.dart';
import 'package:memorandum_pt/data/model/model.dart';
import 'package:memorandum_pt/presentation/utils/app_dimensions.dart';

class BeerDetailsPage extends StatelessWidget {
  final Beer beer;
  const BeerDetailsPage({required this.beer, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beer.name),
        leading: BackButton(
          onPressed: () => locator<NavigationHandler>().goHome(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.main, vertical: AppDimensions.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 180,
                    child: CachedNetworkImage(
                      imageUrl: beer.imageUrl,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.extraLarge),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        beer.shortDescription,
                        style: const TextStyle(
                            fontSize: AppDimensions.large,
                            fontWeight: FontWeight.w600),
                      ),
                      Text('First elaboration: ${beer.firstElaboration}'),
                    ],
                  )
                ],
              ),
              const SizedBox(height: AppDimensions.main),
              Text(beer.description),
              const SizedBox(height: AppDimensions.main),
              const Text(
                'Ingredients',
                style: TextStyle(
                    fontSize: AppDimensions.large, fontWeight: FontWeight.w600),
              ),
              GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: beer.ingredients.map((ingredient) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.xMain),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ingredient.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('Amount: ${ingredient.amount}'),
                          const SizedBox(height: AppDimensions.xSmall),
                          Text('Unit: ${ingredient.unit}'),
                        ],
                      ),
                    );
                  }).toList()),
              const SizedBox(height: AppDimensions.main),
              if (beer.foodPairing != null) ...[
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: beer.foodPairing!.length,
                  itemBuilder: (context, index) {
                    final String foodPairing = beer.foodPairing![index];
                    return Column(
                      children: [
                        Text(
                          foodPairing,
                          style: const TextStyle(
                              fontSize: AppDimensions.main,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: AppDimensions.xMain),
                        const Divider(
                          color: Colors.grey,
                          height: 1,
                        ),
                      ],
                    );
                  },
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
