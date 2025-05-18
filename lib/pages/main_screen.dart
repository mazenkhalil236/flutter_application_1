import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeTab(),
    //const ChatTab(), // Existing placeholder
    //const ProfileTab(), // Existing placeholder
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PharmaFlow'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'PharmaFlow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Address Book'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // TODO: Navigate to Address Book screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_giftcard),
              title: const Text('Health Cards'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Health Cards screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.reorder),
              title: const Text('Orders'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Orders screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Rates'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Rates screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement share functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.support),
              title: const Text('Support'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to Support screen
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Good afternoon,',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        const Text(
          'We made it easier to order prescription medicines with ChattyAI',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Chat with ChattyAI'),
            onTap: () {
              // TODO: Navigate to ChatTab or open chat overlay
            },
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Categories',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryCard('Medicine'),
              _buildCategoryCard('Skin Care'),
              _buildCategoryCard('Home Essential Medication'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Show all',
          style: TextStyle(fontSize: 16, color: Colors.blue),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5, // Replace with real data
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/images/product_placeholder.png', // Replace with real asset
                  width: 50,
                  height: 50,
                ),
                title: Text('Product ${index + 1}'),
                subtitle: const Text('Description of product'),
                trailing: ElevatedButton(
                  onPressed: () {
                    // TODO: Add to cart or view details
                  },
                  child: const Text('Buy'),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Keep ChatTab and ProfileTab as placeholders from the previous response