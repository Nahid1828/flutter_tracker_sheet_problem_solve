import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Card App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> items = [
    {
      'image':
          'https://media.istockphoto.com/id/855447930/photo/various-of-ice-cream-flavor-in-cones-blueberry-strawberry-pistachio-almond-orange-and-cherry.jpg?s=2048x2048&w=is&k=20&c=GXzParRdXXHiNHtC7bIea4FjGCNgoWKzzBjNDQEyBfk=',
      'title': 'Cone Ice Cream',
      'subtitle': 'Cone Ice cream is yummy',
      'description': 'Best Ice cream for your summer',
    },
    {
      'image':
          'https://media.istockphoto.com/id/882220272/photo/ice-cream-sundae-with-chocolate-sauce-and-cookie.jpg?s=2048x2048&w=is&k=20&c=iezimsRCq3t49aXwOCjuSS92VZ9jzg06fVcr03Qyo_c=',
      'title': 'Bowl Ice Cream',
      'subtitle': 'Amount will blow your mind',
      'description': 'This is the description for Bowl Ice cream.',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1633933037611-f26e54366832?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'title': 'Ice Cream',
      'subtitle': 'Perfect for sunny weather',
      'description': 'This is the description for Ice lolly Ice cream.',
    },
    {
      'image':
          'https://media.istockphoto.com/id/1552871673/photo/black-coffee-in-a-white-glass-placed-on-an-old-cement-table-with-coffee-beans.jpg?s=2048x2048&w=is&k=20&c=1q5t0q9P-ANsSrSqME5FKLJSy8M6MJx4SBBWbF-luaE=',
      'title': 'Coffee',
      'subtitle': 'Good for concentration',
      'description': 'This is the description for Coffee.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Card'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 2, 121, 42),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomCard(
            image: items[index]['image']!,
            title: items[index]['title']!,
            subtitle: items[index]['subtitle']!,
            description: items[index]['description']!,
          );
        },
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String description;

  const CustomCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          // Add action on tap if needed
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            boxShadow:
                _isHovered
                    ? [
                      const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ]
                    : [
                      const BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 5, 89, 100),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 8, 137, 100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
