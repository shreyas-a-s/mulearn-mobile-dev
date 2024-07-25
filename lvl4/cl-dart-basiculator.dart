import 'dart:io';

void main() {
  print("BasiCulator: The Basic Calculator");

  while(true) {
    print('''\n1) Addition
2) Subtraction
3) Multiplication
4) Division
5) Modulus
6) Comparison''');
    stdout.write("Enter the operation to perform (1-6): ");
    int choice = int.parse(stdin.readLineSync() ?? '');

    stdout.write("Enter the first number: ");
    double number1 = double.parse(stdin.readLineSync() ?? '');

    stdout.write("Enter the second number: ");
    double number2 = double.parse(stdin.readLineSync() ?? '');

    switch(choice) {
      case 1:
        performAddition(number1, number2);
        break;

      case 2:
        performSubtraction(number1, number2);
        break;

      case 3:
        performMultiplication(number1, number2);
        break;

      case 4:
        performDivision(number1, number2);
        break;

      case 5:
        performModulus(number1, number2);
        break;

      case 6:
        performComparison(number1, number2);
        break;
    }
  }
}

void performAddition(double a, double b) {
  print("The sum of $a and $b is ${a+b}");
}

void performSubtraction(double a, double b) {
  print("The differene between $a and $b is ${a-b}");
}

void performMultiplication(double a, double b) {
  print("The product of $a and $b is ${a*b}");
}

void performDivision(double a, double b) {
  if (b == 0) {
    print("Division by zero is not possible!");
  } else {
    print("The quotient of $a and $b is ${a/b}");
  }
}

void performModulus(double a, double b) {
  print("The remainder of division between $a and $b is ${a%b}");
}

void performComparison(double a, double b) {
  if (a>b) {
    print("$a is greater than $b");
  } else if (a==b) {
    print("$a is equal to $b");
  } else {
      print("$a is less than $b");
  }
}
