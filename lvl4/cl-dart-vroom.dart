import 'dart:io';

class Car {
    String name;
    double price;

    // constructor
    Car(this.name, this.price);

    // method
    void changePrice(double newPrice) {
        if (newPrice <= 0) {
            print("\nPrice cannot be zero or negative!");
        } else {
            this.price = newPrice;
            print("Price of $name was changed to \$$price");
        }
    }

    // method that helps in printing object info
    @override
    String toString() {
        return 'Car(name: $name, price: $price)';
    }
}

class Person {
    String name;
    List<Car> ownedCars;
    double moneyLeft;

    // constructor
    Person(this.name, this.ownedCars, this.moneyLeft);

    // method 1
    void buyCar(Car car) {
        if (moneyLeft >= car.price) {
            ownedCars.add(car);
            print("\n${car.name} was added to your collection.");
            viewOwnedCars(this);
            moneyLeft -= car.price;
            print("\$${car.price} was deducted from your account.");
            print("Money left in bank is \$$moneyLeft");
        } else {
            print("\nYour bank balance ($moneyLeft) is not enough!");
        }
    }

    // method 2
    void sellCar(Car car) {
        if (ownedCars.remove(car)) {
            print("\n${car.name} was removed from your collection!");
            viewOwnedCars(this);
            moneyLeft += car.price;
            print("${car.price} was added to your account");
        } else {
            print("\n${car.name} is not present in you collection!");
        }
    }

    // method that helps in printing object info
    @override
    String toString() {
        return 'Person(name: $name, ownedCars: $ownedCars, moneyLeft: $moneyLeft)';
    }
}

void main() {
    print("Vroom Companion: Car Buying & Selling Platform");

    // creating some cars
    Car tesla = Car("Tesla", 35000);
    Car ford = Car("Ford", 28000);
    Car honda = Car("Honda", 26000);
    Car chevrolet = Car("Chevrolet", 30000);
    Car toyota = Car("Toyota", 24000);
    Car bmw = Car("BMW", 41000);
    Car lexus = Car("Lexus", 40000);
    Car audi = Car("Audi", 39000);

    // create an array of cars
    List<Car> cars = [tesla, ford, honda, chevrolet, toyota, bmw, lexus, audi];

    stdout.write("Enter your name: ");
    String name = stdin.readLineSync() ?? "PersonOne";

    stdout.write("Enter your bank balance (in dollars): ");
    double bankBalance = getValidDouble();

    // creating a person with provided name and bank balance
    Person person1 = Person(name, [], bankBalance);

    while(true) {
        print('''\n1) Buy Car
2) Sell Car
3) View Your Owned Cars
4) Change Price of Car
5) Exit''');
        stdout.write("Enter the choice (1-4): ");
        int choice = int.parse(stdin.readLineSync()!);

        switch(choice) {
            case 1:
                buyCar(person1, cars);
                break;

                case 2:
                    sellCar(person1);
                    break;

                case 3:
                    viewOwnedCars(person1);
                    break;

                case 4:
                    changeCarPrice(person1);
                    break;

                case 5:
                    print("Exiting from the platform...");
                    return;
                    break;

                default:
                    print("Invalid option. Select a number from 1-3");
        }
    }
}

void buyCar(Person person, List<Car> cars) {
    int index = 1;
    print("\n");
    for (Car car in cars) {
        print("$index) ${car.name} - \$${car.price}");
        index++;
    }
    stdout.write("Choose which car to buy: ");
    int choice = int.parse(stdin.readLineSync()!);

    person.buyCar(cars[choice-1]);
}

void sellCar(Person person) {
    int index = 1;
    print("\n");
    for (Car car in person.ownedCars) {
        print("$index) ${car.name} - \$${car.price}");
        index++;
    }
    stdout.write("Choose which car to sell: ");
    int choice = int.parse(stdin.readLineSync()!);

    person.sellCar(person.ownedCars[choice-1]);
}

void viewOwnedCars(Person person) {
    int index = 1;
    print("\nYour owned cars are:");
    for (Car car in person.ownedCars) {
        print("$index) ${car.name} - \$${car.price}");
        index++;
    }
}

void changeCarPrice(Person person) {
    if (person.ownedCars.length == 0) {
        print("Sadly you don't own any cars!");
    } else {
        viewOwnedCars(person);
        stdout.write("Choose the car to change price: ");
        int choice = int.parse(stdin.readLineSync()!);
        stdout.write("Enter the new price: ");
        double newPrice = getValidDouble();
        person.ownedCars[choice-1].changePrice(newPrice);
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
