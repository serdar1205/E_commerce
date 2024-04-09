import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  Storage._internal();
  static final Storage _instance = Storage._internal();

  factory Storage() => _instance;



  FlutterSecureStorage secureStorage = FlutterSecureStorage();
  String token = '';
}