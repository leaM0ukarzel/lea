import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled/HomePge.dart';
import 'Service.dart';
import 'info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> _listItem = [
    {"image": 'assets/lawn2.png', "name": "Lawning Services"},
    {"image": 'assets/paint1.png', "name": "Painting Services"},
    {"image": 'assets/elect2.jpg', "name": "Electricity Services"},
    {"image": 'assets/plumping1.jpg', "name": "Plumbing Services"},
    {"image": 'assets/renovation.jpg', "name": "Home Renovation"},
    {"image": 'assets/security.jpg', "name": "Home Security"},
  ];

  final List<String> carouselImages = [
    'assets/lawn1.jpg',
    'assets/cleaning1.jpg',
    'assets/elect1.jpg',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(66, 125, 159, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    66, 125, 159, 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    // Add your profile image here
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                // Handle profile tap
                Navigator.pop(context); // Close the drawer
                // Navigate to the profile page or perform any other action
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                      (route) => false, // Remove all previous routes from the stack
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/pattern.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.ease,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 500),
                          viewportFraction: 0.8,
                        ),
                        items: carouselImages.map((path) {
                          return GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    path,
                                    fit: BoxFit.fill,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        colors: [
                                          Colors.black.withOpacity(.6),
                                          Colors.black.withOpacity(.2),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      const Text(
                                        "Home Services",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => info(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 50,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Colors.white70,
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Quick View",
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    66, 125, 159, 1.0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: _listItem.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Service(
                            serviceName: item["name"],
                            imagePath: item["image"],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(item["image"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            Transform.translate(
                              offset: const Offset(55, -58),
                              child: Container(
                                width: 30,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(),
                                // You can add other widgets or buttons here if needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
