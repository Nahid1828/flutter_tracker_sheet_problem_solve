import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomDrawerPage(),
    );
  }
}

class CustomDrawerPage extends StatefulWidget {
  const CustomDrawerPage({super.key});

  @override
  State<CustomDrawerPage> createState() => _CustomDrawerPageState();
}

class _CustomDrawerPageState extends State<CustomDrawerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  void _toggleDrawer() {
    if (_drawerController.status == AnimationStatus.completed) {
      _drawerController.reverse();
    } else {
      _drawerController.forward();
    }
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width * 0.75;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nahid's Custom Drawer"),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _toggleDrawer,
        ),
      ),
      body: Stack(
        children: [
          const Center(
            child: Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          AnimatedBuilder(
            animation: _drawerController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(-drawerWidth * (1 - _drawerController.value), 0),
                child: SizedBox(
                  width: drawerWidth,
                  child: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: const [
                        DrawerHeader(
                          decoration: BoxDecoration(color: Colors.teal),
                          child: Text(
                            'Drawer Menu',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.home),
                          title: Text('Home'),
                        ),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings'),
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
