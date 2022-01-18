abstract class IStorageProvider<E> {
  /// Checks whether storage contains the [key].
  bool containsKey(dynamic key);

  /// Saves the [key] - [value] pair.
  Future<void> put(dynamic key, E value);

  /// Deletes the given [key] from storage.
  ///
  /// If it does not exist, nothing happens.
  Future<void> delete(dynamic key);

  /// Returns the value associated with the given [key]. If the key does not
  /// exist, `null` is returned.
  ///
  /// If [defaultValue] is specified, it is returned in case the key does not
  /// exist.
  E? get(dynamic key, {E? defaultValue});

}
