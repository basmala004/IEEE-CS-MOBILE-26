

// I gave up on using set/get because I couldn't make it as easy as a constructor , everytime I initialize an object I had to call the set one by one , so I used the constructor :(

void main(List<String> args) {

  Car car1= Car(cc: 1600, speed: 215, engine: "Gasoline", model: 2023, make: "Peugeot", price: 1250000, transmissionType: "Automatic", passengers: 5);
  Car car2= Car(cc: 1800, speed: 244, engine: "Hyprid", model: 2022, make: "BMW", price: 2350000, transmissionType: "Automatic", passengers: 5);

  Truck t1= Truck(cc: 2000, speed: 170, engine: "Diesel", model: 2015, make: "Chevrolet", price: 1215000, loadCapacity: 2000);
  Truck t2= Truck(cc: 1800, speed: 150, engine: "Diesel", model: 2024, make: "Daihatsu", price: 1720000, loadCapacity: 1250);

  Motorcycle mc1= Motorcycle(cc: 750, speed: 110, engine: "Electric", model: 2011, make: "Suzuki", price: 116000, tires: 3, sidecar: true);
  Motorcycle mc2= Motorcycle(cc: 1400, speed: 200, engine: "Gasoline", model: 2021, make: "Honda", price: 1040500, tires: 2, sidecar: false);


  print("\n\nFastest Car......");
  car1.maxSpeed! > car2.maxSpeed! ? car1.printInfo() : car2.printInfo(); 

  print("\n\nHeaviest Truck...... ");
  t1.loadCapacity! > t2.loadCapacity! ? t1.printInfo() : t2.printInfo();

  print("\n\nCheapest Motorcycle...... ");
  mc1.price! < mc2.price! ? mc1.printInfo() : mc2.printInfo();

}



class Vehicle {
  int? cylinderCapacity;
  int? maxSpeed;
  String? engineType;
  int? model;
  String? manufacturer;
  int? price;

  Vehicle({
    this.cylinderCapacity,
    this.maxSpeed,
    this.engineType,
    this.model,
    this.manufacturer,
    this.price,
  });

}




class Car extends Vehicle {
  String? transmissionType;
  int? passengers;

  Car({int? cc, int? speed, String? engine, int? model, String? make, int? price, this.transmissionType, this.passengers}) 
  : super(cylinderCapacity: cc, maxSpeed: speed, engineType: engine, model: model, manufacturer: make, price: price);

  void printInfo() {
    print("Cylinder Capacity: $cylinderCapacity CC");
    print("Maximum Speed: $maxSpeed km/hr");
    print("Model: $model");
    print("Engine Type: $engineType");
    print("Manufacturer: $manufacturer");
    print("Price: $price Pounds");
    print("Transmission Type: $transmissionType");
    print("Number of passengers: $passengers");
  }
}




class Truck extends Vehicle {
  int? loadCapacity;

  Truck({int? cc, int? speed, String? engine, int? model, String? make, int? price, this.loadCapacity}) 
   : super(cylinderCapacity: cc, maxSpeed: speed, engineType: engine, model: model, manufacturer: make, price: price);

  void printInfo() {
    print("Cylinder Capacity: $cylinderCapacity CC");
    print("Maximum Speed: $maxSpeed km/hr");
    print("Model: $model");
    print("Engine Type: $engineType");
    print("Manufacturer: $manufacturer");
    print("Price: $price Pounds");
    print("Load Capacity: $loadCapacity");
  }
}





class Motorcycle extends Vehicle {
  int? tires;
  bool? sidecar;

  Motorcycle({int? cc, int? speed, String? engine, int? model, String? make, int? price, this.tires, this.sidecar}) 
  : super(cylinderCapacity: cc, maxSpeed: speed, engineType: engine, model: model, manufacturer: make, price: price);

  void printInfo() {
    print("Cylinder Capacity: $cylinderCapacity CC");
    print("Maximum Speed: $maxSpeed km/hr");
    print("Model: $model");
    print("Engine Type: $engineType");
    print("Manufacturer: $manufacturer");
    print("Price: $price Pounds");
    print("Number of tires: $tires");
    print("Side Car: ${sidecar! ? 'Yes' : 'No'}");
  }
}
