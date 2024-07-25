class Car {
    String name;
    double price;

    // constructor
    Car(this.name, this.price);

    // method
    void changePrice(double newPrice) {
        this.price = newPrice;
    }

    // method that helps in printing object info
    @override
    String toString() {
        return 'Car(name: $name, price: $price)';
    }
}

class Person {
    String name;
    List<String> ownedCars;
    double moneyLeft;

    // constructor
    Person(this.name, this.ownedCars, this.moneyLeft);

    // method 1
    void buyCar(Car car) {
        ownedCars.add(car.name);
        moneyLeft -= car.price;
    }

    // method 2
    void sellCar(Car car) {
        ownedCars.remove(car.name);
        moneyLeft += car.price;
    }

    // method that helps in printing object info
    @override
    String toString() {
        return 'Person(name: $name, ownedCars: $ownedCars, moneyLeft: $moneyLeft)';
    }
}

void main() {
    // creating some cars
    Car tesla = Car("Tesla", 35000);
    Car ford = Car("Ford", 28000);
    Car honda = Car("Honda", 26000);
    Car chevrolet = Car("Chevrolet", 30000);
    Car toyota = Car("Toyota", 24000);
    Car bmw = Car("BMW", 41000);
    Car lexus = Car("Lexus", 40000);
    Car audi = Car("Audi", 39000);

    // creating some persons
    Person leno = Person("Jay Leno", ["Tesla", "Honda", "Chevrolet"], 100000);

    // person before changes
    print(leno);

    // invoking some changes in person
    leno.buyCar(ford);
    leno.sellCar(tesla);

    // person after changes
    print(leno);

    // car before price change
    print(toyota);

    // invoking some changes in car
    toyota.changePrice(21000);

    // car after price change
    print(toyota);
}
