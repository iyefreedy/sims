// login exceptions
class UserNotFoundAuthException implements Exception {
  String get message => 'Pengguna tidak ditemukan';
}

// identity number exception
class IdentityNumberAuthException implements Exception {
  final String role;
  String get message => 'Nomor identitas tidak ditemukan';
  IdentityNumberAuthException(this.role);
}

class WrongPasswordAuthException implements Exception {
  String get message => 'Kesalahan kredensial';
}

// register exceptions

class WeakPasswordAuthException implements Exception {
  String get message => 'Kata sandi lemah';
}

class EmailAlreadyInUseAuthException implements Exception {
  String get message => 'Email sudah digunakan';
}

class InvalidEmailAuthException implements Exception {
  String get message => 'Email tidak valid';
}

// generic exceptions

class GenericAuthException implements Exception {
  final String? message;
  GenericAuthException(this.message);
}

class UserNotLoggedInAuthException implements Exception {}
