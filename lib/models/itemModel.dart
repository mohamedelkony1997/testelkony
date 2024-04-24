class Item {
  final String id;
  final String price;
  final String description;
  final String image;
  final String name;
  bool isSelected; // Add this property

  Item({
    required this.id,
    required this.price,
    required this.description,
    required this.image,
    required this.name,
    this.isSelected = false, // Initialize isSelected to false by default
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      price: json['price'],
      description: json['decription'], // Fix typo in key name
      image: json['image'],
      name: json['name'],
    );
  }
}
