class Coffee {
  final String name;
  final String type;
  final double price;
  final String image;

  Coffee({
    required this.name,
    required this.type,
    required this.price,
    required this.image,
  });
  factory Coffee.fromMap(Map<String, dynamic> map) {
    return Coffee(
      name: map['name'],
      type: map['type'],
      price: map['price'],
      image: map['image'],
    );
  }
}