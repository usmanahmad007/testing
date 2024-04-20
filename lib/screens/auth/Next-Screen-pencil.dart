import 'package:flutter/material.dart';
import 'dart:io';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final _strokes = <Path>[];

  void _startStroke(double x, double y) {
    _strokes.add(Path()..moveTo(x, y));
  }

  void _moveStroke(double x, double y) {
    setState(() {
      _strokes.last.lineTo(x, y);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing'),
      ),
      body: GestureDetector(
        onPanDown: (details) => _startStroke(
          details.localPosition.dx,
          details.localPosition.dy,
        ),
        onPanUpdate: (details) => _moveStroke(
          details.localPosition.dx,
          details.localPosition.dy,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomPaint(
            painter: DrawingPainter(_strokes),
          ),
        ),
      ),
    );
  }
}



class DrawingPainter extends CustomPainter {
  final List<Path> strokes;

  DrawingPainter(this.strokes);
  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      final paint = Paint()
        ..strokeWidth = 10
        ..color = Colors.teal
        ..style = PaintingStyle.stroke;

      canvas.drawPath(stroke, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}