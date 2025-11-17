abstract class SimpleCache {
  DateTime prevCacheTime = DateTime.now();
  final Duration _cacheDuration = Duration(hours: 4);

  bool get shouldClearCache {
    if (prevCacheTime.add(_cacheDuration).isBefore(DateTime.now())) {
      return true;
    }
    return false;
  }
}
