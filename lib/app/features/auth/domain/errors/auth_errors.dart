abstract class Failure implements Exception {
  final String message;

  Failure(this.message);
}

class InvalidCredentials extends Failure {
  InvalidCredentials(super.message);
}

class InvalidToken extends Failure {
  InvalidToken(super.message);
}

class InternalError extends Failure {
  InternalError(super.message);
}
