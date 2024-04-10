import 'package:flutter_meal_tracker_app/app/features/storage/data/datasources/storage_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/storage/domain/errors/storage_error.dart';
import 'package:flutter_meal_tracker_app/app/features/storage/domain/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  final StorageDatasource datasource;

  StorageRepositoryImpl(this.datasource);

  @override
  Future<StorageFailure?> delete(String key) async {
    try {
      datasource.delete(key);
      return null;
    } catch (e) {
      throw StorageFailure();
    }
  }

  @override
  Future<String?> read(String key) async {
    try {
      final value = await datasource.read(key);
      return value;
    } catch (e) {
      throw StorageFailure();
    }
  }

  @override
  Future<StorageFailure?> write(String key, String value) async {
    // TODO: implement write
    throw UnimplementedError();
  }
}
