

enum Images {
  icon,
  chicago,
  londres,
  amsterdan,
  paris,
  sidney,
  tokyo,
  baseball,
  soccer,
  baseballBall,
  soccerBall,
  dollar

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
      case Images.baseball:
        return 'assets/baseball.jpg';
      case Images.soccer:
        return 'assets/soccer.jpeg';
      case Images.baseballBall:
        return 'assets/baseball_ball.png';
      case Images.soccerBall:
        return 'assets/soccer_ball.png';
      case Images.dollar:
        return 'assets/dollar.png';
    }
  }
}