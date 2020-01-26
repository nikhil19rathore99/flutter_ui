import 'package:daily_routine_app/model/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final event = Provider.of<Event>(context);
    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: ImageClipper(),
        child: Image.asset(
          event.imagePath,
          width: screenWidth * 2.0,
          color: Color(0x99000000),
          colorBlendMode: BlendMode.darken,
          height: screenHeight * 0.5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartingPoint = Offset(0, 40);
    Offset curveEndingPoint = Offset(size.width, size.height * 0.95);
    path.lineTo(curveStartingPoint.dx, curveStartingPoint.dy - 5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.85,
        curveEndingPoint.dx - 60, curveEndingPoint.dy + 10);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.99,
        curveEndingPoint.dx, curveEndingPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
