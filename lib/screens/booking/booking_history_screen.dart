import 'package:flutter/material.dart';
import '../../models/booking.dart';
import '../../models/room.dart';
import '../../theme/app_theme.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual booking data
    final bookings = [
      {
        'booking': Booking(
          id: '1',
          roomId: '1',
          userId: '1',
          checkIn: DateTime.now().add(const Duration(days: 7)),
          checkOut: DateTime.now().add(const Duration(days: 10)),
          guests: 2,
          totalPrice: 599.0,
          status: 'confirmed',
        ),
        'room': Room(
          id: '1',
          name: 'Luxury Suite',
          description: 'Spacious luxury suite with city view',
          price: 199.0,
          imageUrl: 'https://images.unsplash.com/photo-1611892440504-42a792e24d32',
          amenities: ['WiFi', 'TV', 'Mini Bar'],
          capacity: 2,
          type: 'suite',
        ),
      },
      {
        'booking': Booking(
          id: '2',
          roomId: '2',
          userId: '1',
          checkIn: DateTime.now().subtract(const Duration(days: 5)),
          checkOut: DateTime.now().subtract(const Duration(days: 3)),
          guests: 1,
          totalPrice: 299.0,
          status: 'completed',
        ),
        'room': Room(
          id: '2',
          name: 'Deluxe Room',
          description: 'Comfortable deluxe room',
          price: 149.0,
          imageUrl: 'https://images.unsplash.com/photo-1611892440504-42a792e24d32',
          amenities: ['WiFi', 'TV'],
          capacity: 2,
          type: 'deluxe',
        ),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index]['booking'] as Booking;
          final room = bookings[index]['room'] as Room;
          return _buildBookingCard(context, booking, room);
        },
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context, Booking booking, Room room) {
    Color statusColor;
    switch (booking.status.toLowerCase()) {
      case 'confirmed':
        statusColor = Colors.green;
        break;
      case 'pending':
        statusColor = Colors.orange;
        break;
      case 'completed':
        statusColor = AppTheme.primaryGold;
        break;
      case 'cancelled':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: AppTheme.softBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppTheme.primaryGold),
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              image: DecorationImage(
                image: NetworkImage(room.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      room.name,
                      style: const TextStyle(
                        color: AppTheme.primaryGold,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        border: Border.all(color: statusColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        booking.status.toUpperCase(),
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildInfoRow(
                  Icons.calendar_today,
                  'Check-in: ${booking.checkIn.day}/${booking.checkIn.month}/${booking.checkIn.year}',
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  Icons.calendar_today,
                  'Check-out: ${booking.checkOut.day}/${booking.checkOut.month}/${booking.checkOut.year}',
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  Icons.person,
                  '${booking.guests} Guest${booking.guests > 1 ? 's' : ''}',
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  Icons.attach_money,
                  'Total: \$${booking.totalPrice}',
                ),
                const SizedBox(height: 16),
                if (booking.status.toLowerCase() == 'confirmed')
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // TODO: Implement cancel booking
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                          ),
                          child: const Text(
                            'Cancel Booking',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Implement modify booking
                          },
                          child: const Text('Modify'),
                        ),
                      ),
                    ],
                  ),
                if (booking.status.toLowerCase() == 'completed')
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement review
                      },
                      child: const Text('Write a Review'),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryGold, size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
