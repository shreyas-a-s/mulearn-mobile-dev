import 'dart:io';

// Function to center the text when printing
String centerText(String text, int width) {
  int paddingLeft = (width - text.length - 3) ~/ 2;
  int paddingRight = width - text.length - 4 - paddingLeft;
  return '|' + ' ' * paddingLeft + " $text " + ' ' * paddingRight + '|';
}

void main() {
  print("The Story of Me: The Biodata Generator");

  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter your age: ");
  String? age = stdin.readLineSync();

  stdout.write("Enter your phone number: ");
  String? phoneNumber = stdin.readLineSync();

  stdout.write("Enter your address: ");
  String? address = stdin.readLineSync()!;

  stdout.write("Enter your height (in cm): ");
  String? height = stdin.readLineSync();

  stdout.write("Enter your weight (in kg): ");
  String? weight = stdin.readLineSync();

  List<String> hobbiesList = [];
  stdout.write('Enter your hobbies (comma-separated): ');
  String hobbies = stdin.readLineSync()!;

  if (hobbies != null) {
    // Split the string by commas and trim any extra spaces
    hobbiesList = hobbies.split(',').map((hobby) => hobby.trim()).toList();
  }

  // Just for finding the optimum separator length
  int sepLength = address.length > hobbies.length ? address.length + 13 : hobbies.length + 13; // "| Address:  |".length = 13

  print("-" * (sepLength));
  print(centerText("BIODATA", sepLength));
  print("-" * (sepLength));
  print(centerText("Name: $name", sepLength));
  print(centerText("Age: $age", sepLength));
  print(centerText("Phone Number: $phoneNumber", sepLength));
  print(centerText("Address: $address", sepLength));
  print(centerText("Height: $height cm", sepLength));
  print(centerText("Weight: $weight cm", sepLength));
  print(centerText("Hobbies: " + hobbiesList.join(", "), sepLength));
  print("-" * (sepLength));
}
