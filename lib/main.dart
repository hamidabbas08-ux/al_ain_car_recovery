import 'package:flutter/material.dart';

void main() {
  runApp(const RecoveryApp());
}

const Color dark = Color(0xFF101923);
const Color yellow = Color(0xFFFFC900);
const Color green = Color(0xFF078B50);

class RecoveryApp extends StatelessWidget {
  const RecoveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Ain Car Recovery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: yellow),
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
      ),
      home: const RecoveryHome(),
    );
  }
}

class RecoveryHome extends StatefulWidget {
  const RecoveryHome({super.key});

  @override
  State<RecoveryHome> createState() => _RecoveryHomeState();
}

class _RecoveryHomeState extends State<RecoveryHome> {
  int selectedTab = 0;

  void comingSoon(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name - Coming Soon'), backgroundColor: dark),
    );
  }

  Widget actionButton(
    String text,
    IconData icon,
    Color color,
    VoidCallback action,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: action,
        icon: Icon(icon),
        label: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: color == yellow ? dark : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  Widget serviceCard(String title, IconData icon, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E6E9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 34, color: dark),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 7),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget homePage() {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF17446B), dark],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'AL AIN  •  UAE  •  24/7 SERVICE',
                style: TextStyle(
                  color: yellow,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '24/7 Car Recovery & Towing',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Fast and reliable vehicle recovery in Al Ain and across the UAE.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 145,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF20364B),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: yellow, width: 1.5),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_shipping_rounded, size: 76, color: yellow),
                    Text(
                      'AL AIN CAR RECOVERY',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              actionButton(
                'BOOK RECOVERY NOW',
                Icons.local_shipping,
                yellow,
                () => comingSoon('Customer Booking'),
              ),
              const SizedBox(height: 10),
              actionButton(
                'LIVE TRACKING - COMING SOON',
                Icons.location_on,
                green,
                () => comingSoon('GPS Live Tracking'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Our Recovery Services',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  serviceCard(
                    'Car Recovery',
                    Icons.directions_car,
                    'Car towing and recovery',
                  ),
                  serviceCard(
                    'SUV Recovery',
                    Icons.airport_shuttle,
                    'SUV and large vehicles',
                  ),
                  serviceCard(
                    'Breakdown Help',
                    Icons.build,
                    'Roadside assistance',
                  ),
                  serviceCard(
                    'Vehicle Transport',
                    Icons.local_shipping,
                    'Transport across UAE',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Our Service Coverage',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Based in Al Ain. Available 24 hours a day, 7 days a week. Recovery and vehicle transportation across all seven UAE emirates.',
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(height: 22),
              actionButton(
                'CUSTOMER PORTAL',
                Icons.person,
                yellow,
                () => comingSoon('Customer Portal'),
              ),
              const SizedBox(height: 10),
              actionButton(
                'DRIVER PORTAL',
                Icons.badge,
                dark,
                () => comingSoon('Driver Portal'),
              ),
              const SizedBox(height: 10),
              actionButton(
                'ADMIN PANEL',
                Icons.admin_panel_settings,
                dark,
                () => comingSoon('Admin Panel'),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ],
    );
  }

  Widget otherPage(String title, IconData icon) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 85, color: yellow),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'This feature will be activated in an upcoming development step.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      homePage(),
      otherPage('My Bookings', Icons.receipt_long),
      otherPage('Live Tracking', Icons.location_on),
      otherPage('My Account', Icons.person),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        foregroundColor: Colors.white,
        title: const Text(
          'AL AIN CAR RECOVERY',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () => comingSoon('Notifications'),
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: pages[selectedTab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        indicatorColor: yellow,
        onDestinationSelected: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(Icons.location_on_outlined),
            label: 'Tracking',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
