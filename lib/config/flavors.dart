enum Flavor {
  local,
  dev,
  demo,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.local:
        return 'Local';
      case Flavor.dev:
        return 'Dev';
      case Flavor.demo:
        return 'Demo';
      default:
        return 'title';
    }
  }

}
