import 'package:flutter/material.dart';

class info extends StatefulWidget {
  const info({super.key});

  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> slideTexts = [
    'view the services',
    'choose the service you need',
    'pick date',
    'pick time ',
    'view details',
    'book your service',
    // Add more slide texts as needed
  ];

  List<String> images = [
    'assets/home.jpeg',
    'assets/service.jpeg',
    'assets/date.jpeg',
    'assets/time.jpeg',
    'assets/details.jpeg',
    'assets/book.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int? newPage = _pageController.page?.round();
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage!;
        });
      }
    });
  }

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(66, 125, 159, 1.0),
        title: const Text('Quick View',
                      style: TextStyle( color: Colors.white,
      ),),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              slideTexts[_currentPage],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO( 67, 151, 201, 0.7),
    ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: slideTexts.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      images[index],
                      height: 300,

                    ),
                    const SizedBox(height: 50),
                    Text(
                      '${index + 1}',
                      style: const TextStyle(fontSize: 24, color: Color.fromRGBO(2, 96, 148, 1.0)),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(40.0),

            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: previousPage,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO( 67, 151, 201, 0.7)),
                  child: Text('<<',),

                ),
                ElevatedButton(
                  onPressed: nextPage,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO( 67, 151, 201, 0.7)),
                  child: Text('>>'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
void main() {
  runApp(const MaterialApp(
    home: info(),
  ));
}
