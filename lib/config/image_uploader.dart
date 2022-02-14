import 'package:file_picker/file_picker.dart';
import 'package:fire_chat/domain/repositories/storage_repository/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ImageUploader {
  static Future<String?> uploadImage(BuildContext context) async {
    final storageRepository = GetIt.instance.get<StorageRepository>();
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
        'jpg',
      ],
    );
    final path = result?.files.single.path;
    final fileName = result?.files.single.name;
    final url = await storageRepository.uploadPicture(
      path: path!,
      name: fileName!,
    );
    return url;
  }
}
