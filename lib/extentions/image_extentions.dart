

enum Images {
  icon
}

extension RepositoryImageExtension on Images {
  String get key {
    switch (this) {
      case Images.icon:
        return 'assets/icon.png';
    }
  }
}