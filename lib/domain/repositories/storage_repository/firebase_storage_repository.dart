import 'dart:developer';
import 'dart:io';

import 'package:fire_chat/domain/repositories/storage_repository/storage_repository.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseStorageRepository implements StorageRepository {
  final String _path = 'gs://fire-chat-mb.appspot.com/pictures';

  @override
  Future<void> uploadPicture({
    required BuildContext context,
    required String path,
    required String name,
  }) async {
    final storage = FirebaseStorage.instance;
    final file = File(path);
    try {
      final reference = storage.refFromURL('$_path/$name');
      await reference.putFile(file);
      final url = await reference.getDownloadURL();
      context.read<ProfileEditingBloc>().editAvatar(url);
    } on FirebaseException catch (error) {
      log(error.toString());
    }
  }
}
