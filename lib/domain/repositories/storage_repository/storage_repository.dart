abstract class StorageRepository {
  Future<String?> uploadPicture({
    required String path,
    required String name,
  });
}
