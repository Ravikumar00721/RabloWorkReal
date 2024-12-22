// import 'package:flutter/material.dart';

// class WelcomeCard extends StatelessWidget {
//   final int currentStep;

//   const WelcomeCard({Key? key, required this.currentStep}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       color: const Color.fromRGBO(85, 166, 196, 0.3),
//       child: SizedBox(
//         width: 344,
//         height: 199,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'Welcome Back!',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontFamily: 'Roboto',
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                   SizedBox(height: 3),
//                   Text(
//                     'You are One-Step Closer to creating your App',
//                     style: TextStyle(fontSize: 14, color: Colors.white),
//                   ),
//                 ],
//               ),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text(
//                   "Next Step",
//                   style: const TextStyle(fontSize: 18),
//                 ),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                     const Color.fromRGBO(184, 254, 34, 1),
//                   ),
//                   minimumSize: MaterialStateProperty.all(
//                       const Size(320, 30)),
//                   padding: MaterialStateProperty.all(
//                       const EdgeInsets.symmetric(vertical: 8)),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
