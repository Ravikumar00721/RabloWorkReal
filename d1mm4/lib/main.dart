import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentStep = 0;
  final List<int> stepProgress = [20, 40, 60, 80, 100];
  final List<String> stepIcons = [
    'assets/step1.svg',
    'assets/step2.svg',
    'assets/step3.svg',
    'assets/step4.svg',
    'assets/step5.svg',
  ];
  final List<String> stepTexts = [
    "Complete your profile",
    "Verify yourself",
    "Complete verification",
    "Create your plan",
    "Create website"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('D1MM4'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.png'), // Add your image asset here
            fit: BoxFit.cover, // Adjust the image to cover the entire area
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 80, left: 16, right: 16), // Adjusted margin
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: const Color.fromRGBO(85, 166, 196, 0.3),
                    child: SizedBox(
                      width: 344,
                      height: 199,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Combined Title and Message in the Same Container
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Welcome Back!',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(height: 3), // Further reduced margin
                                Text(
                                  'You are One-Step Closer to creating your App',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),

                            // Stepper and Progress Container
                            Column(
                              children: [
                                // Stepper and Progress Row
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: List.generate(5, (index) {
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _currentStep = index;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        _currentStep >= index
                                                            ? Color.fromRGBO(
                                                                184, 254, 34, 1)
                                                            : Colors.grey,
                                                    child: SvgPicture.asset(
                                                      stepIcons[index],
                                                      width: 20,
                                                      height: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (index < 4)
                                              Container(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  width: 8, // Reduced width
                                                  height: 6, // Thicker line
                                                  color: _currentStep > index
                                                      ? Color.fromRGBO(
                                                          184, 254, 34, 1)
                                                      : Colors.grey,
                                                ),
                                              ),
                                          ],
                                        );
                                      }),
                                    ),
                                    const Text(
                                      '|',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      '${stepProgress[_currentStep]}%',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Button
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_currentStep < 4) {
                                    _currentStep++;
                                  }
                                });
                              },
                              child: Text(
                                stepTexts[_currentStep],
                                style: const TextStyle(fontSize: 18),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(184, 254, 34, 1),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(
                                        320, 30)), // Reduced button height
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 8)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Gap between card and container
                  // Further UI content
                  Container(
                    width: 344,
                    height: 78,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(85, 166, 196, 0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/locked.svg',
                                width: 24,
                                height: 24,
                                color: Colors
                                    .white, // Optional: Adjust color if needed
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Item 1',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/exchange.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Item 2',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/locked.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Item 3',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/locked.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Item 4',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Gap between containers
                  Container(
                    width: 344,
                    height: 119,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(85, 166, 196, 0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(85, 166, 196, 0.3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/locked.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(85, 166, 196, 0.3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child:SvgPicture.asset(
                                'assets/locked.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10), // Gap between containers
                  Container(
                    width: 344,
                    height: 72,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(85, 166, 196, 0.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: SvgPicture.asset(
                                'assets/locked.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                    ),
                  ),
                  const SizedBox(
                      height:
                          50), // Gap between content above and the bottom container
                  const SizedBox(
                      height:
                          50), // Gap between content above and the bottom container
                  Stack(
                    clipBehavior:
                        Clip.none, // Ensures elements outside are visible
                    children: [
                      Container(
                        width: 280, // Fixed width
                        height: 50, // Height
                        decoration: BoxDecoration(
                          color: Colors.blue, // Background color
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40), // Padding left and right
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                                'assets/homeyes.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                            SizedBox(
                                width: 24), // Placeholder for the middle icon
                            SvgPicture.asset(
                                'assets/personno.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -20, // Adjusted to align the circular boundary
                        left: 120, // Centers the icon horizontally
                        child: Container(
                          width: 50, // Size of the circular boundary
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue, // Blue boundary color
                              width: 3, // Thickness of the boundary
                            ),
                            color: Colors.blue, // Background color
                          ),
                          child:  Center(
                            child:SvgPicture.asset(
                                'assets/scanner.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                          ),
                        ),
                      ),
                    ],
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
