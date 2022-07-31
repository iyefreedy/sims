// login exceptions
class UserNotFoundAuthException implements Exception {
  String get message => 'Pengguna tidak ditemukan';
}

class WrongPasswordAuthException implements Exception {
  String get message => 'Kesalahan kredensial';
}

// register exceptions

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

// generic exceptions

class GenericAuthException implements Exception {
  String get message => 'Autentikasi eror';
}

class UserNotLoggedInAuthException implements Exception {}
