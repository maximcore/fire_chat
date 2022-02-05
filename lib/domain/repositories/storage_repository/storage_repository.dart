import 'package:flutter/material.dart';

abstract class StorageRepository {
  Future<void> uploadPicture({
    required BuildContext context,
    required String path,
    required String name,
  });
}
