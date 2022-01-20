enum Flavor {
  LOCAL,
  DEV,
  DEMO,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.LOCAL:
        return 'Local';
      case Flavor.DEV:
        return 'Dev';
      case Flavor.DEMO:
        return 'Demo';
      default:
        return 'title';
    }
  }

}
