abstract class ApiException implements Exception {
  String message;

  int statusCode();

  ApiException(this.message);

  @override
  String toString() {
    return statusCode().toString() + ' $message';
  }
}

class ResourceNotFoundException extends ApiException {
  ResourceNotFoundException() : super("Resource not found");

  @override
  int statusCode() => 404;
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException() : super("Internal Server Error");

  @override
  int statusCode() => 500;
}

class InvalidValueException extends ApiException {
  InvalidValueException() : super("OTP is invalid or has expired");

  @override
  int statusCode() => 422;
}

class NoContentException extends ApiException {
  NoContentException() : super("No content");

  @override
  int statusCode() => 204;
}

class AlreadyActivatedPackageException extends ApiException {
  AlreadyActivatedPackageException()
      : super("You already bought an active tariff package.");

  @override
  int statusCode() => 409;
}

class NotEnoughMoneyException extends ApiException {
  NotEnoughMoneyException() : super("not enough money");

  @override
  int statusCode() => 412;
}
