import 'dart:developer';
import 'dart:io';

import 'package:fire_chat/domain/repositories/storage_repository/storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository implements StorageRepository {
  final String _path = 'gs://fire-chat-mb.appspot.com/posts_pictures';

  //uploads picture to firebase storage, returns picture url
  @override
  Future<String?> uploadPicture({
    required String path,
    required String name,
  }) async {
    final storage = FirebaseStorage.instance;
    final file = File(path);
    try {
      final reference = storage
          .refFromURL('$_path/$name${DateTime.now().millisecondsSinceEpoch}');
      await reference.putFile(file);
      final url = await reference.getDownloadURL();
      return url;
    } on FirebaseException catch (error) {
      log(error.toString());
    }
    return null;
  }
}
