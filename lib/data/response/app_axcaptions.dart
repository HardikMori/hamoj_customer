

class AppException implements Exception {

  final _massage ;
  final _prefix ;
  AppException([this._massage , this._prefix]);

  String toString(){
    return '$_prefix $_massage';
  }
}

class FetchDataException extends AppException{
  FetchDataException ([String?message]) : super(message, 'Error during Communication');
}


class BadRequestException extends AppException{
  BadRequestException ([String?message]) : super(message, 'Invalid Request');
}


class UnauthorisedException extends AppException{
  UnauthorisedException ([String?message]) : super(message, 'Unauthorised Request');
}


class InvalideInputException extends AppException{
  InvalideInputException ([String?message]) : super(message, 'Invalid Input');
}