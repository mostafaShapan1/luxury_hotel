class Room {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> amenities;
  final int capacity;
  final String type;
  final bool isAvailable;

  Room({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.amenities,
    required this.capacity,
    required this.type,
    this.isAvailable = true,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      amenities: List<String>.from(json['amenities'] as List),
      capacity: json['capacity'] as int,
      type: json['type'] as String,
      isAvailable: json['isAvailable'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'amenities': amenities,
      'capacity': capacity,
      'type': type,
      'isAvailable': isAvailable,
    };
  }
}
