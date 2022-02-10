import 'package:file_picker/file_picker.dart';
import 'package:fire_chat/domain/repositories/storage_repository/firebase_storage_repository.dart';
import 'package:flutter/material.dart';

class ImageUploader {
  static Future<String?> uploadImage(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
        'jpg',
      ],
    );
    final path = result?.files.single.path;
    final fileName = result?.files.single.name;
    final storage = FirebaseStorageRepository();
    final url = await storage.uploadPicture(
      path: path!,
      name: fileName!,
    );
    return url;
  }
}
