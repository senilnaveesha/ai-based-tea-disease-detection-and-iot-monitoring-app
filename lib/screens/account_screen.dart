import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  static const Color primaryGreen = Color(0xFF173809);

  String userName = "Unknown User";
  String estateName = "Unknown Estate";
  String email = "No email";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString("registeredName") ?? "Unknown User";
      estateName = prefs.getString("registeredEstate") ?? "Unknown Estate";
      email = prefs.getString("registeredEmail") ?? "No email";
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();

    // Only log out. Do NOT delete registered account data.
    await prefs.setBool("isLoggedIn", false);

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: primaryGreen),
                  ),
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 45),

              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 105,
                        height: 105,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 4,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        color: primaryGreen,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.verified,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Text(
                userName,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                estateName,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 50),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.person, color: primaryGreen, size: 18),
                        SizedBox(width: 10),
                        Text(
                          "Personal Details",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    _detailBox("Full Name", userName),
                    const SizedBox(height: 12),
                    _detailBox("Estate", estateName),
                    const SizedBox(height: 12),
                    _detailBox("Email Address", email),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              GestureDetector(
                onTap: _logout,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD6D2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red),
                      SizedBox(width: 14),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, color: Colors.red),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailBox(String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE9ECE8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}