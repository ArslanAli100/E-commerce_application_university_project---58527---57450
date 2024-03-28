import 'package:flutter/material.dart';
import 'package:flutter_application_university_project/pages/cart_details.dart';
import 'package:flutter_application_university_project/pages/home_screen.dart';
import 'package:flutter_application_university_project/pages/favorite_screen.dart';
import 'package:flutter_application_university_project/pages/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_university_project/providers/favorite_providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
   @override
   Widget build(BuildContext context) => MultiProvider(
     providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
     ],
     child: MaterialApp(
           title: 'Lux SportsWear',
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             colorSchemeSeed: Color.fromARGB(255, 0, 0, 0),
             scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const HomePage(),
      ),
  );  
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  
    List screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lux Sportswear"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CardDetails(),
              ),
            ),  
          icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() => currentIndex = value);
          
        },
        selectedItemColor: const Color.fromARGB(255, 54, 108, 244),
        unselectedItemColor: Colors.grey,
        items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ],
      ),
    );
  }
}