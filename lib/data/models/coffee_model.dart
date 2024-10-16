class CoffeeModel {
  final int id;
  final String name;
  final String type;
  final double price;
  final String image;

  CoffeeModel({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
  });
  factory CoffeeModel.fromMap(Map<String, dynamic> map) {
    return CoffeeModel(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      price: map['price'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type, 
      'price': price,
      'image': image,
    };
  }
}