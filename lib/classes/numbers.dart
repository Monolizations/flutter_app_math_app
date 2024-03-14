import 'dart:math';

class Numbers {
  int generateNumber(int x) {
    var intValue = Random().nextInt(x);
    return intValue;
  }

  int generateNumberforSubtraction(int min, int max) {
    Random random = Random();
    int x = random.nextInt(max - min + 1);
    return x;
  }


}
