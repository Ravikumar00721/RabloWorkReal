// import 'package:flutter/material.dart';

// class StepperProgress extends StatelessWidget {
//   final int currentStep;

//   const StepperProgress({Key? key, required this.currentStep}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> stepIcons = [
//       'assets/step1.svg',
//       'assets/step2.svg',
//       'assets/step3.svg',
//       'assets/step4.svg',
//       'assets/step5.svg',
//     ];

//     final List<int> stepProgress = [20, 40, 60, 80, 100];

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(5, (index) {
//             return Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {},
//                   child: CircleAvatar(
//                     backgroundColor: currentStep >= index
//                         ? Color.fromRGBO(184, 254, 34, 1)
//                         : Colors.grey,
//                     child: Image.asset(
//                       stepIcons[index],
//                       width: 20,
//                       height: 20,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//                 if (index < 4)
//                   Container(
//                     width: 8,
//                     height: 6,
//                     color: currentStep > index
//                         ? Color.fromRGBO(184, 254, 34, 1)
//                         : Colors.grey,
//                   ),
//               ],
//             );
//           }),
//         ),
//         Text(
//           '${stepProgress[currentStep]}%',
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//           ),
//         ),
//       ],
//     );
//   }
// }
