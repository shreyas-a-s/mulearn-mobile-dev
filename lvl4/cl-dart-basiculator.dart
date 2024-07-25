import 'dart:io';

void main() {
  print("BasiCulator: The Basic Calculator");

  while(true) {
    print('''\n1) Addition
2) Subtraction
3) Multiplication
4) Division
5) Modulus
6) Comparison
7) Exit''');
    stdout.write("Enter the operation to perform (1-6): ");
    int choice = int.parse(stdin.readLineSync() ?? '');

    stdout.write("Enter the first number: ");
    double number1 = getValidDouble();

    stdout.write("Enter the second number: ");
    double number2 = getValidDouble();

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

      case 7:
        print("Exiting the program...");
        return;

      default:
        print("Invalid choice. Enter a number between 1 and 6");
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

/// Function to get a validated number from user input.
double getValidDouble() {
  while (true) {
    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) {
      try {
        return double.parse(input);
      } catch (e) {
        stdout.write("Invalid input. Please enter a valid number: ");
      }
    } else {
      stdout.write("Input cannot be empty. Please enter a valid number: ");
    }
  }
}
