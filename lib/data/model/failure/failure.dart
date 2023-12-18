class Failure implements Exception {
  late final String message;
  late final int errorCode;
  Failure({this.message = "Undefined Error", this.errorCode = 500});

  @override
  String toString() => "Message: $message, ErrorCode: $errorCode";
}
