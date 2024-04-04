abstract class Failure implements Exception {}

class InvalidCredentials implements Failure {
  final String? message;

  InvalidCredentials(this.message);
}

class InternalError implements Failure {}
