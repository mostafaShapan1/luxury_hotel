import 'package:flutter/material.dart';
import '../../models/room.dart';
import '../../theme/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  RangeValues _priceRange = const RangeValues(0, 1000);
  List<String> _selectedAmenities = [];
  int _selectedCapacity = 1;
  String? _selectedType;

  final List<String> _amenities = [
    'WiFi',
    'Mini Bar',
    'TV',
    'Air Conditioning',
    'Balcony',
    'City View',
    'Room Service',
    'Spa Bath',
    'Work Desk',
  ];

  final List<String> _roomTypes = [
    'Standard',
    'Deluxe',
    'Suite',
    'Executive',
    'Presidential',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Rooms'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search rooms...',
                prefixIcon: const Icon(Icons.search, color: AppTheme.primaryGold),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list, color: AppTheme.primaryGold),
                  onPressed: () {
                    _showFilterBottomSheet(context);
                  },
                ),
              ),
              onChanged: (value) {
                // TODO: Implement search functionality
              },
            ),
          ),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    // TODO: Replace with actual search results
    final searchResults = [
      Room(
        id: '1',
        name: 'Luxury Suite',
        description: 'Spacious luxury suite with city view',
        price: 399.0,
        imageUrl: 'https://images.unsplash.com/photo-1611892440504-42a792e24d32',
        amenities: ['WiFi', 'Mini Bar', 'City View'],
        capacity: 2,
        type: 'suite',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final room = searchResults[index];
        return _buildRoomCard(room);
      },
    );
  }

  Widget _buildRoomCard(Room room) {
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
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(
                room.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
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
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: AppTheme.primaryGold,
                        ),
                        onPressed: () {
                          // TODO: Implement add to favorites
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    room.description,
                    style: const TextStyle(color: Colors.white70),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: room.amenities.map((amenity) => Chip(
                      backgroundColor: AppTheme.darkBlack,
                      side: const BorderSide(color: AppTheme.primaryGold),
                      label: Text(
                        amenity,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )).toList(),
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

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.darkBlack,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.9,
              minChildSize: 0.5,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Filters',
                            style: TextStyle(
                              color: AppTheme.primaryGold,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _priceRange = const RangeValues(0, 1000);
                                _selectedAmenities = [];
                                _selectedCapacity = 1;
                                _selectedType = null;
                              });
                            },
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Price Range',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      RangeSlider(
                        values: _priceRange,
                        min: 0,
                        max: 1000,
                        divisions: 20,
                        activeColor: AppTheme.primaryGold,
                        inactiveColor: Colors.grey,
                        labels: RangeLabels(
                          '\$${_priceRange.start.round()}',
                          '\$${_priceRange.end.round()}',
                        ),
                        onChanged: (values) {
                          setState(() {
                            _priceRange = values;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Room Type',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _roomTypes.map((type) {
                          final isSelected = _selectedType == type;
                          return ChoiceChip(
                            label: Text(type),
                            selected: isSelected,
                            selectedColor: AppTheme.primaryGold,
                            backgroundColor: AppTheme.softBlack,
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                            onSelected: (selected) {
                              setState(() {
                                _selectedType = selected ? type : null;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Capacity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (_selectedCapacity > 1) {
                                setState(() {
                                  _selectedCapacity--;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.remove_circle,
                              color: AppTheme.primaryGold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.primaryGold),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _selectedCapacity.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _selectedCapacity++;
                              });
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: AppTheme.primaryGold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Amenities',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _amenities.map((amenity) {
                          final isSelected = _selectedAmenities.contains(amenity);
                          return FilterChip(
                            label: Text(amenity),
                            selected: isSelected,
                            selectedColor: AppTheme.primaryGold,
                            backgroundColor: AppTheme.softBlack,
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _selectedAmenities.add(amenity);
                                } else {
                                  _selectedAmenities.remove(amenity);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Apply filters
                            Navigator.pop(context);
                          },
                          child: const Text('Apply Filters'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
