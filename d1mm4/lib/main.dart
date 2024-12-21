import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D1MM4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('D1MM4'),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 80,
          left: screenWidth * 0.025,
          right: screenWidth * 0.025,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Color.fromRGBO(85, 166, 196, 0.3),
          child: SizedBox(
            width: double.infinity,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.white,
                      fontFamily: 'Roboto', 
                      fontStyle: FontStyle.italic, 
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'You are One-Step Closer to creating your App',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
             
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Complete Your App',
                        style: TextStyle(fontSize: 18), 
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(184, 254, 34, 1),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(screenWidth - 40, 50)),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), 
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
