

enum Images {
  icon,
  chicago,
  londres,
  amsterdan,
  paris,
  sidney,
  tokyo
}

extension ImageExtension on Images {
  String get key {
    switch (this) {
      case Images.icon:
        return 'assets/icon.png';
      case Images.chicago:
        return 'assets/chicago.jpeg';
      case Images.londres:
        return 'assets/londres.jpg';
      case Images.amsterdan:
        return 'assets/amsterdan.jpg';
      case Images.paris:
        return 'assets/paris.jpg';
      case Images.sidney:
        return 'assets/sidney.jpg';
      case Images.tokyo:
        return 'assets/tokyo.jpeg';
    }
  }
}