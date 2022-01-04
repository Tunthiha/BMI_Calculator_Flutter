import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;

  calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getInterpreatation() {
    if (_bmi >= 25) {
      return 'your are a higher than noraml weight';
    } else if (_bmi > 18.5) {
      return 'you have noraml weight';
    } else {
      return 'you have lower than normal';
    }
  }

  String result() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }
}
