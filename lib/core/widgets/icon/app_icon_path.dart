class AppIconsPath {
  static ImagesIcon imagesIcon = ImagesIcon();
}

class ImagesIcon {
  static final basePath = "assets/images/";

  static String _generatePath(String name) {
    return basePath + name;
  }

  final String pokeball = _generatePath("pokeball.svg");
}
