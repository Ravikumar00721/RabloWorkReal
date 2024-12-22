// import 'package:flutter/material.dart';
// import 'components/welcome_card.dart'; // Import the welcome card component
// import 'components/stepper_progress.dart'; // Import the stepper progress component
// import 'components/bottom_navigation.dart'; // Import the bottom navigation component

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentStep = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('D1MM4'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/background.png'), 
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Center(
//             child: Container(
//               margin: const EdgeInsets.only(top: 80, left: 16, right: 16),
//               child: Column(
//                 children: [
//                   WelcomeCard(currentStep: _currentStep),
//                   StepperProgress(currentStep: _currentStep),
//                   BottomNavigation(), 
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
