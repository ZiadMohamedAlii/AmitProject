

//--------------------- for Sign In Page ----------------------------


import 'package:flutter/material.dart';

class BackGroundPage1 extends StatefulWidget {


  @override
  _BackGroundPage1State createState() => _BackGroundPage1State();
}

class _BackGroundPage1State extends State<BackGroundPage1> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [Colors.black, Colors.transparent],
      ).createShader(rect),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/WhatsApp Image 2021-07-13 at 8.31.37 PM.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
      ),
    );
  }
}
