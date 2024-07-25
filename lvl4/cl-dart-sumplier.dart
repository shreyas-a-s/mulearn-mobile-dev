import 'dart:io';

void main(){
  print("Sumplier Madness: The Sum of Multipliers");

  //stdout.write("Enter an integer number: ");
  //int number = getValidInt();
  int number = 13;
  int sum = 0;

  print("Multiplication table for $number:");
  for (int i = 1; i <= 10; i++) {
  int product = number * i;
  print("$number  x\t$i\t=\t$product");
  sum += product;
}

  print("The Sum of all multiples is $sum");
}

/// Function to get a validated integer from user input.
int getValidInt() {
  while (true) {
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    int? intValue = int.tryParse(input);
    if (intValue == null) {
      if (double.tryParse(input) != null) {
        stdout.write("Input should be an integer, not a floating point number. Please enter a valid integer: ");
      } else {
        stdout.write("Invalid input. Please enter a valid integer: ");
      }
    } else {
      return intValue;
    }
  } else {
    stdout.write("Input cannot be empty. Please enter a valid integer: ");
  }
}
}
