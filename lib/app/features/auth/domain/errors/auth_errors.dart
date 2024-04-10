abstract class Failure implements Exception {}

class InvalidCredentials implements Failure {
  final String? message;

  InvalidCredentials(this.message);
}

class InvalidToken implements Failure {}

class InternalError implements Failure {}
