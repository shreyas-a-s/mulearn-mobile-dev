import 'dart:io';
import 'dart:math';

class Passwords {

    generate(String strength, int length) {
        String chars;
        if (strength == "low") {
            chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
        } else if (strength == "intermediate") {
            chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        } else {
            chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\$#@!&*%?';
        }

        Random rnd = Random();
        print(String.fromCharCodes(Iterable.generate(
            length,
            (_) => chars.codeUnitAt(rnd.nextInt(chars.length))
        )));
    }

    validate(String password) {
        double entropy = calculateEntropy(password);
        if (entropy < 45) {
            print("Password strength: LOW");
        } else if (entropy < 105) {
            print("Password strength: INTERMEDIATE");
        } else {
            print("Password strength: STRONG");
        }
    }
}

void main() {
    print("Lock and Key: Password Generator + Validator");

    Passwords pass = Passwords();
    int length = 10;

    while(true) {
        print('''\n1) Password Generator (Strength: Strong)
2) Password Generator (Strength: Intermediate)
3) Password Generator (Strength: Low)
4) Password Validator
5) Exit''');
        stdout.write("Enter your choice: ");
        int choice = getValidInt();
        if (choice == 1 || choice == 2 || choice == 3) {
            stdout.write("Enter the length of password to generate: ");
            length = getValidInt();
        }

        switch(choice) {
            case 1:
                pass.generate("strong", length);
                break;

            case 2:
                pass.generate("intermediate", length);
                break;

            case 3:
                pass.generate("low", length);
                break;

            case 4:
                stdout.write("Enter the password to validate: ");
                String password = stdin.readLineSync()!;
                pass.validate(password);
                break;

            case 5:
                print("Exiting the program...");
                return;

            default:
                print("Invalid input. Enter a number between 1 and 5");
        }
    }
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

// Code for calculating the emtropy of password
double log2(num x) => log(x) / log(2);

int calculateCharacterSetSize(String password) {
  bool hasLower = password.contains(RegExp(r'[a-z]'));
  bool hasUpper = password.contains(RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(RegExp(r'[0-9]'));
  bool hasSpecial = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

  int size = 0;
  if (hasLower) size += 26;
  if (hasUpper) size += 26;
  if (hasDigits) size += 10;
  if (hasSpecial) size += 32;

  return size;
}

double calculateEntropy(String password) {
  int length = password.length;
  int characterSetSize = calculateCharacterSetSize(password);

  return length * log2(characterSetSize);
}
