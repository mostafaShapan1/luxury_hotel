class User {
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? profileImage;
  final List<String> bookingIds;
  final List<String> favoriteRoomIds;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.profileImage,
    this.bookingIds = const [],
    this.favoriteRoomIds = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      profileImage: json['profileImage'] as String?,
      bookingIds: List<String>.from(json['bookingIds'] as List? ?? []),
      favoriteRoomIds: List<String>.from(json['favoriteRoomIds'] as List? ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'bookingIds': bookingIds,
      'favoriteRoomIds': favoriteRoomIds,
    };
  }

  User copyWith({
    String? name,
    String? phoneNumber,
    String? profileImage,
    List<String>? bookingIds,
    List<String>? favoriteRoomIds,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      bookingIds: bookingIds ?? this.bookingIds,
      favoriteRoomIds: favoriteRoomIds ?? this.favoriteRoomIds,
    );
  }
}
