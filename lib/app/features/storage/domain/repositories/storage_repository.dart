import 'package:flutter_meal_tracker_app/app/features/storage/domain/errors/storage_error.dart';

abstract class StorageRepository {
  Future<StorageFailure?> write(String key, String value);
  Future<String?> read(String key);
  Future<StorageFailure?> delete(String key);
}
