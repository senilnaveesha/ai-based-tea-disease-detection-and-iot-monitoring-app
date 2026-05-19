import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'identify_screen.dart';
import 'soil_screen.dart';
import 'insights_screen.dart';
import 'library_screen.dart';
import 'account_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const Color primaryGreen = Color(0xFF173809);

  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late final List<Widget> _screens = [
    HomeScreen(onNavigate: _changeTab),
    const IdentifyScreen(),
    const SoilScreen(),
    const InsightsScreen(),
    const LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: primaryGreen),
              child: Text("Menu",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),

            _drawerItem("Home", 0),
            _drawerItem("Identify", 1),
            _drawerItem("Soil", 2),
            _drawerItem("Insights", 3),
            _drawerItem("Library", 4),

            ListTile(
              title: const Text("Account"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AccountScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: primaryGreen,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _changeTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Identify"),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: "Soil"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Evolution"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Library"),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, int index) {
    return ListTile(
      title: Text(title),
      onTap: () {
        _changeTab(index);
        Navigator.pop(context);
      },
    );
  }
}