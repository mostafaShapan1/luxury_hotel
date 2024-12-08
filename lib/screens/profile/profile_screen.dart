import 'package:flutter/material.dart';
import 'package:luxury_hotel/global/global.dart';
import 'package:luxury_hotel/screens/booking/booking_history_screen.dart';
import 'package:luxury_hotel/screens/profile/edit_profile_screen.dart';
import '../../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Implement logout
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.primaryGold,
              child: Icon(
                Icons.person,
                size: 50,
                color: AppTheme.darkBlack,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              GlobalVar.name,
              style: Theme.of(context).textTheme.displayMedium,
            ),
             Text(
              GlobalVar.email,
              style: const TextStyle(color: AppTheme.primaryGold),
            ),
            const SizedBox(height: 32),
            _buildProfileSection(
              title: 'Edit Profile',
              icon: Icons.notifications,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const EditProfileScreen()));
              },),
            _buildProfileSection(
              title: 'My Bookings',
              icon: Icons.book_online,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                   builder: (context) => const BookingHistoryScreen(),
                ));
              },
            ),
            _buildProfileSection(
              title: 'Payment Methods',
              icon: Icons.payment,
              onTap: () {
                // TODO: Navigate to payment methods
              },
            ),
            _buildProfileSection(
              title: 'Notifications',
              icon: Icons.notifications,
              onTap: () {
                // TODO: Navigate to notifications
              },
            ),
            _buildProfileSection(
              title: 'Settings',
              icon: Icons.settings,
              onTap: () {
                // TODO: Navigate to settings
              },
            ),
            _buildProfileSection(
              title: 'Help & Support',
              icon: Icons.help,
              onTap: () {
                // TODO: Navigate to help
              },
            ),
            _buildProfileSection(
              title: 'About Us',
              icon: Icons.info,
              onTap: () {
                // TODO: Navigate to about
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      color: AppTheme.softBlack,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppTheme.primaryGold),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primaryGold),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: AppTheme.primaryGold),
        onTap: onTap,
      ),
    );
  }
}
