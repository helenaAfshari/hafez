
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class Hands extends StatelessWidget {
//   const Hands({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      body: Center(child: 
//      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
//      Container(
//       color: Colors.amber,
//       height: double.infinity,
//       child: Lottie.asset('assets/lottie/anim.json')),
// ),
//      );
    
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class YourWidget extends StatefulWidget {
//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }

// class _YourWidgetState extends State<YourWidget> {
//   double opacity = 1.0;
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 7), () {
//       setState(() {
//         opacity = 0;
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//       decoration: const BoxDecoration(
//       image: DecorationImage(
//         fit: BoxFit.fill,
//         image: AssetImage('assets/images/Goldfinger.jpg',)),
//       ),
//         child: AnimatedOpacity(
//           duration: const Duration(seconds: 1),
//           opacity: opacity,
//           child: Lottie.asset('assets/lottie/anim.json'),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class YourWidget extends StatefulWidget {
//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }

// class _YourWidgetState extends State<YourWidget> {
//   double opacity = 1.0;
//   bool _isClicked = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isClicked = !_isClicked;
//         });
//       },
//       child: Container(
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: AssetImage('assets/images/Goldfinger.jpg'),
//           ),
//         ),
//         child: Stack(
//           children: [
//             AnimatedOpacity(
//               duration: const Duration(seconds: 1),
//               opacity: opacity,
//               child: Lottie.asset('assets/lottie/anim.json'),
//             ),
//             if (_isClicked)
//               Center(
//                 child: Container(
//                   width: 20, // عرض خط مشکی
//                   height: double.infinity,
//                   color: Colors.black,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  double opacity = 1.0;
  bool _isClicked = false;
  Offset? _tapPosition;

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
  onTapDown: (TapDownDetails details) {
    setState(() {
      _isClicked = !_isClicked;
      _tapPosition = details.globalPosition;
    });
  },
  child: Stack(
    children: [
      Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/Goldfinger.jpg'),
          ),
        ),
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: opacity,
          child: Lottie.asset('assets/lottie/anim.json'),
        ),
      ),
      if (_isClicked && _tapPosition != null)
        Positioned(
          left: _tapPosition!.dx - 1 - MediaQuery.of(context).size.width ,
          top: 0,
          right: MediaQuery.of(context).size.width / 2,
          bottom: 0,
          child: Container(
            width: 2,
            height: 10,
            color: Colors.black,
          ),
        ),
    ],
  ),
);

//    GestureDetector(
//   onTapDown: (TapDownDetails details) {
//     setState(() {
//       _isClicked = !_isClicked;
//       _tapPosition = details.globalPosition;
//     });
//   },
//   child: Stack(
//     children: [
//       Container(
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: AssetImage('assets/images/Goldfinger.jpg'),
//           ),
//         ),
//         child: AnimatedOpacity(
//           duration: const Duration(seconds: 1),
//           opacity: opacity,
//           child: Lottie.asset('assets/lottie/anim.json'),
//         ),
//       ),
//       if (_isClicked && _tapPosition != null)
//         Positioned(
//           left: _tapPosition!.dx - 1,
//           top: 0,
//           right: MediaQuery.of(context).size.width - _tapPosition!.dx - 1,
//           bottom: 0,
//           child: Container(
//             width: 2,
//             height: 10,
//             color: Colors.black,
//           ),
//         ),
//     ],
//   ),
// );


  }
}




