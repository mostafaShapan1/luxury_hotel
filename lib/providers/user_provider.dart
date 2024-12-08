import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../models/room.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  List<Room> _favoriteRooms = [];

  User? get user => _user;
  List<Room> get favoriteRooms => _favoriteRooms;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    _favoriteRooms = [];
    notifyListeners();
  }

  void toggleFavorite(Room room) {
    if (_user != null) {
      final isFavorite = _user!.favoriteRoomIds.contains(room.id);
      List<String> updatedFavorites;
      
      if (isFavorite) {
        updatedFavorites = _user!.favoriteRoomIds.where((id) => id != room.id).toList();
        _favoriteRooms.removeWhere((r) => r.id == room.id);
      } else {
        updatedFavorites = [..._user!.favoriteRoomIds, room.id];
        _favoriteRooms.add(room);
      }

      _user = _user!.copyWith(favoriteRoomIds: updatedFavorites);
      notifyListeners();
      
      // TODO: Sync with backend
    }
  }

  bool isFavorite(String roomId) {
    return _user?.favoriteRoomIds.contains(roomId) ?? false;
  }

  Future<void> loadFavoriteRooms() async {
    if (_user != null) {
      // TODO: Fetch favorite rooms from backend
      // For now, we'll just use dummy data
      _favoriteRooms = _user!.favoriteRoomIds.map((id) {
        return Room(
          id: id,
          name: 'Room $id',
          description: 'Description for Room $id',
          price: 199.0,
          imageUrl: 'https://images.unsplash.com/photo-1611892440504-42a792e24d32',
          amenities: ['WiFi', 'TV', 'Mini Bar'],
          capacity: 2,
          type: 'deluxe',
        );
      }).toList();
      notifyListeners();
    }
  }
}
