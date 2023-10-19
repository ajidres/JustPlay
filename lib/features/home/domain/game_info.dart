
import 'dart:ffi';

enum GameCategory { soccer, baseball }
enum GameField { indoor, outdoor }
class GameInfo{

  GameCategory category;
  DateTime date;

  GameField field;

  bool gamble;

  int gambleAmount;

  int maxPeople;

  int enrollPeople;

  GameInfo(this.category, this.date, this.field, this.gamble, this.gambleAmount, this.maxPeople, this.enrollPeople);
}