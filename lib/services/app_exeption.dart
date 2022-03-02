class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);
  
  String toString() {
    return "$_prefix $_message";
  }
}

class FetchDataExeption extends AppException {
  FetchDataExeption([message]) : super(message, "Error During Communication: ");
  
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid request: ");

}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");

}

class InvalidInputExeption extends AppException {
  InvalidInputExeption([message]) : super(message, "Invalid Input: ");


}
