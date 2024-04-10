import 'package:flutter_meal_tracker_app/app/features/storage/data/datasources/storage_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageDatasource implements StorageDatasource {
  final FlutterSecureStorage storage;

  FlutterSecureStorageDatasource(this.storage);

  @override
  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  @override
  Future<String?> read(String key) async {
    final value = await storage.read(key: key);
    return value;
  }

  @override
  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}
