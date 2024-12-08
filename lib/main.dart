import 'package:flutter/material.dart';
import 'package:luxury_hotel/screens/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/room/room_details_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/main_layout.dart';
import 'screens/booking/booking_screen.dart';
import 'screens/booking/booking_confirmation_screen.dart';
import 'screens/booking/booking_history_screen.dart';
import 'screens/profile/edit_profile_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/favorites/favorites_screen.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Luxury Hotel',
        theme: AppTheme.theme,
        initialRoute: '/splash',
        routes: {
          "/splash" : (context) => const Splashscreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/main': (context) => const MainLayout(),
          '/home': (context) => const HomeScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/booking-confirmation': (context) => const BookingConfirmationScreen(),
          '/booking-history': (context) => const BookingHistoryScreen(),
          '/edit-profile': (context) => const EditProfileScreen(),
          '/search': (context) => const SearchScreen(),
          '/favorites': (context) => const FavoritesScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/booking') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => BookingScreen(room: args['room']),
            );
          }
          if (settings.name == '/room-details') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => RoomDetailsScreen(room: args['room']),
            );
          }
          return null;
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
