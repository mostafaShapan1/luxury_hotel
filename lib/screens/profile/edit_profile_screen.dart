import 'package:flutter/material.dart';
import 'package:luxury_hotel/global/global.dart';
import 'package:luxury_hotel/screens/main_layout.dart';
import '../../models/user.dart';
import '../../theme/app_theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _selectedImage;

  @override
  void initState() {
    super.initState();
    // TODO: Load user data
    _nameController.text = GlobalVar.name;
    _phoneController.text = '+201092310217';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: AppTheme.primaryGold,
                    backgroundImage: _selectedImage != null
                        ? NetworkImage(_selectedImage!)
                        : null,
                    child: _selectedImage == null
                        ? const Icon(
                            Icons.person,
                            size: 60,
                            color: AppTheme.darkBlack,
                          )
                        : null,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGold,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.darkBlack,
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // TODO: Implement image picker
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: AppTheme.darkBlack,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person, color: AppTheme.primaryGold),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone, color: AppTheme.primaryGold),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      GlobalVar.name = _nameController.text;
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const MainLayout()),
                          (route) => false);
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: AppTheme.primaryGold),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.lock, color: AppTheme.primaryGold),
                title: const Text(
                  'Change Password',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.primaryGold,
                  size: 16,
                ),
                onTap: () {
                  // TODO: Navigate to change password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications,
                    color: AppTheme.primaryGold),
                title: const Text(
                  'Notification Settings',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.primaryGold,
                  size: 16,
                ),
                onTap: () {
                  // TODO: Navigate to notification settings
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.privacy_tip, color: AppTheme.primaryGold),
                title: const Text(
                  'Privacy Settings',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.primaryGold,
                  size: 16,
                ),
                onTap: () {
                  // TODO: Navigate to privacy settings
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
