import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipPath(
          clipper: PathClipper(),
            child: Image.asset("assets/images/bg.jpeg", fit: BoxFit.cover,)),
      )
    );
  }
}


class PathClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var mPath = Path();
    mPath.lineTo(size.width*0.8, 0);
    mPath.cubicTo(size.width, size.height*0.2, size.width*0.6, size.height*0.8, size.width*0.8, size.height);
    //mPath.quadraticBezierTo(size.width*0.7, size.height*0.5, size.width, size.height);
    //mPath.lineTo(size.width*0.8, size.height);
    mPath.lineTo(size.width*0.5, size.height);
    mPath.cubicTo(size.width*0.1, size.height*0.75, size.width*0.3, size.height*0.1, 0, 0);
    mPath.close();
    return mPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}





//Stack(
//         children: [
//           Image.asset("assets/images/bg.jpeg"),
//           BackdropFilter(
//             filter: ImageFilter.blur(
//                 sigmaX: 10.0,
//                 sigmaY: 10.0
//             ),
//             child: Container(
//               child: Center(
//                 child: Text('It\'s Raining'),
//               ),
//             ),
//           ),
//         ],
//       )

