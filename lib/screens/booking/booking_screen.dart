import 'package:flutter/material.dart';
import '../../models/room.dart';
import '../../theme/app_theme.dart';

class BookingScreen extends StatefulWidget {
  final Room room;

  const BookingScreen({super.key, required this.room});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _checkIn;
  DateTime? _checkOut;
  int _guests = 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Room'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Room Info Card
              Card(
                color: AppTheme.softBlack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppTheme.primaryGold),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.room.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.room.name,
                              style: const TextStyle(
                                color: AppTheme.primaryGold,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '\$${widget.room.price}/night',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Check-in Date
              Text(
                'Check-in Date',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.primaryGold,
                    ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() {
                      _checkIn = date;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.primaryGold),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _checkIn != null
                            ? '${_checkIn!.day}/${_checkIn!.month}/${_checkIn!.year}'
                            : 'Select Date',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(Icons.calendar_today, color: AppTheme.primaryGold),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Check-out Date
              Text(
                'Check-out Date',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.primaryGold,
                    ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _checkIn?.add(const Duration(days: 1)) ?? DateTime.now().add(const Duration(days: 1)),
                    firstDate: _checkIn?.add(const Duration(days: 1)) ?? DateTime.now().add(const Duration(days: 1)),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() {
                      _checkOut = date;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.primaryGold),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _checkOut != null
                            ? '${_checkOut!.day}/${_checkOut!.month}/${_checkOut!.year}'
                            : 'Select Date',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(Icons.calendar_today, color: AppTheme.primaryGold),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Number of Guests
              Text(
                'Number of Guests',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.primaryGold,
                    ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (_guests > 1) {
                        setState(() {
                          _guests--;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove_circle, color: AppTheme.primaryGold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryGold),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _guests.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_guests < widget.room.capacity) {
                        setState(() {
                          _guests++;
                        });
                      }
                    },
                    icon: const Icon(Icons.add_circle, color: AppTheme.primaryGold),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // Total Price
              if (_checkIn != null && _checkOut != null)
                Card(
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
                        const Text(
                          'Price Details',
                          style: TextStyle(
                            color: AppTheme.primaryGold,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Number of nights:',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${_checkOut!.difference(_checkIn!).inDays}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Price per night:',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '\$${widget.room.price}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const Divider(color: AppTheme.primaryGold),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(
                                color: AppTheme.primaryGold,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${widget.room.price * _checkOut!.difference(_checkIn!).inDays}',
                              style: const TextStyle(
                                color: AppTheme.primaryGold,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              
              // Book Now Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _checkIn != null && _checkOut != null
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            // TODO: Implement booking logic
                            Navigator.pushNamed(
                              context,
                              '/booking-confirmation',
                              arguments: {
                                'room': widget.room,
                                'checkIn': _checkIn,
                                'checkOut': _checkOut,
                                'guests': _guests,
                                'totalPrice': widget.room.price *
                                    _checkOut!.difference(_checkIn!).inDays,
                              },
                            );
                          }
                        }
                      : null,
                  child: const Text('Book Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
