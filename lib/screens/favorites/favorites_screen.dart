import 'package:flutter/material.dart';
import '../../models/room.dart';
import '../../theme/app_theme.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual favorite rooms data
    final favoriteRooms = [
      Room(
        id: '1',
        name: 'Presidential Suite',
        description: 'Luxurious presidential suite with panoramic views',
        price: 599.0,
        imageUrl: 'https://images.unsplash.com/photo-1611892440504-42a792e24d32',
        amenities: ['WiFi', 'Mini Bar', 'Spa Bath', 'City View'],
        capacity: 4,
        type: 'presidential',
      ),
      Room(
        id: '2',
        name: 'Executive Room',
        description: 'Elegant executive room with modern amenities',
        price: 299.0,
        imageUrl: 'https://images.unsplash.com/photo-1611892440504-42a792e24d32',
        amenities: ['WiFi', 'Mini Bar', 'Work Desk'],
        capacity: 2,
        type: 'executive',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favoriteRooms.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: AppTheme.primaryGold,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Favorite Rooms Yet',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.primaryGold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start adding rooms to your favorites',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/main');
                    },
                    child: const Text('Explore Rooms'),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteRooms.length,
              itemBuilder: (context, index) {
                final room = favoriteRooms[index];
                return _buildFavoriteRoomCard(context, room);
              },
            ),
    );
  }

  Widget _buildFavoriteRoomCard(BuildContext context, Room room) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: AppTheme.softBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppTheme.primaryGold),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/room-details',
            arguments: {'room': room},
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  child: Image.network(
                    room.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () {
                      // TODO: Implement remove from favorites
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: AppTheme.primaryGold,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    room.name,
                    style: const TextStyle(
                      color: AppTheme.primaryGold,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    room.description,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ...room.amenities.take(3).map((amenity) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Chip(
                              backgroundColor: AppTheme.darkBlack,
                              side: const BorderSide(
                                color: AppTheme.primaryGold,
                              ),
                              label: Text(
                                amenity,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )),
                      if (room.amenities.length > 3)
                        Chip(
                          backgroundColor: AppTheme.darkBlack,
                          side: const BorderSide(color: AppTheme.primaryGold),
                          label: Text(
                            '+${room.amenities.length - 3}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${room.price}/night',
                        style: const TextStyle(
                          color: AppTheme.primaryGold,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/booking',
                            arguments: {'room': room},
                          );
                        },
                        child: const Text('Book Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
