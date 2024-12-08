import 'package:flutter/material.dart';
import '../../models/room.dart';
import '../../theme/app_theme.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final room = args['room'] as Room;
    final checkIn = args['checkIn'] as DateTime;
    final checkOut = args['checkOut'] as DateTime;
    final guests = args['guests'] as int;
    final totalPrice = args['totalPrice'] as double;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.check_circle,
              color: AppTheme.primaryGold,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'Booking Confirmed!',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppTheme.primaryGold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your reservation has been successfully confirmed.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            _buildDetailsCard(
              context,
              title: 'Booking Details',
              children: [
                _buildDetailRow('Room Type', room.name),
                _buildDetailRow('Check-in', '${checkIn.day}/${checkIn.month}/${checkIn.year}'),
                _buildDetailRow('Check-out', '${checkOut.day}/${checkOut.month}/${checkOut.year}'),
                _buildDetailRow('Guests', guests.toString()),
                _buildDetailRow('Total Price', '\$${totalPrice.toStringAsFixed(2)}'),
              ],
            ),
            const SizedBox(height: 16),
            _buildDetailsCard(
              context,
              title: 'Important Information',
              children: [
                _buildInfoRow(
                  'Check-in Time',
                  'Check-in time starts at 2 PM. Early check-in subject to availability.',
                ),
                _buildInfoRow(
                  'Check-out Time',
                  'Check-out time is 12 PM. Please contact the front desk for late check-out requests.',
                ),
                _buildInfoRow(
                  'Cancellation Policy',
                  'Free cancellation until 24 hours before check-in. After that, first night charge applies.',
                ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/main',
                    (route) => false,
                  );
                },
                child: const Text('Back to Home'),
              ),
            ),
            const SizedBox(height: 16),
            // SizedBox(
            //   width: double.infinity,
            //   child: OutlinedButton(
            //     onPressed: () {
            //       // TODO: Implement view bookings
                  
            //     },
            //     style: OutlinedButton.styleFrom(
            //       side: const BorderSide(color: AppTheme.primaryGold),
            //     ),
            //     child: const Text('View My Bookings'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      color: AppTheme.softBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppTheme.primaryGold),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.primaryGold,
                  ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white70),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppTheme.primaryGold,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
