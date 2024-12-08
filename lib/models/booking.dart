class Booking {
  final String id;
  final String roomId;
  final String userId;
  final DateTime checkIn;
  final DateTime checkOut;
  final int guests;
  final double totalPrice;
  final String status;

  Booking({
    required this.id,
    required this.roomId,
    required this.userId,
    required this.checkIn,
    required this.checkOut,
    required this.guests,
    required this.totalPrice,
    this.status = 'pending',
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] as String,
      roomId: json['roomId'] as String,
      userId: json['userId'] as String,
      checkIn: DateTime.parse(json['checkIn'] as String),
      checkOut: DateTime.parse(json['checkOut'] as String),
      guests: json['guests'] as int,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      status: json['status'] as String? ?? 'pending',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomId': roomId,
      'userId': userId,
      'checkIn': checkIn.toIso8601String(),
      'checkOut': checkOut.toIso8601String(),
      'guests': guests,
      'totalPrice': totalPrice,
      'status': status,
    };
  }
}
