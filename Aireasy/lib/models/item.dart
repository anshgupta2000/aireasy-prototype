class Item {
  final String id;
  final String name;
  final String category; //For example "Drinks", "Snacks", "Meals", etc.
  final double price;

  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
  });

  // Method to convert an Item object into a map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
    };
  }

  // Method to convert a map object into an Item object
  static Item fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      price: map['price'],
    );
  }
}
