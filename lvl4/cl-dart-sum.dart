import 'dart:io';

void main() {
  print("Sum it Up: The Calculator that Only knows Addition\n");

  stdout.write("Enter the first number: ");
  double number1 = double.parse(stdin.readLineSync() ?? '');

  stdout.write("Enter the second number: ");
  double number2 = double.parse(stdin.readLineSync() ?? '');

  double sum = number1 + number2;

  print("The sum of $number1 and $number2 is $sum");
}
