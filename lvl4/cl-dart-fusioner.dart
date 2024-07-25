import 'dart:math';

processList(List<int> numbers, int Function(int) operation) {
  for (int number in numbers) {
    int result = operation(number);
    print("Result of operation on $number is $result");
  }
}

int double(int x) => x * 2;
int cube(int x) => pow(x, 3).toInt();

void main() {
  List<int> evenNumbers = [0, 2, 4, 6, 8];
  List<int> oddNumbers = [1, 3, 5, 7, 9];

  processList(evenNumbers, double);
  print("\n");
  processList(oddNumbers, cube);
}
