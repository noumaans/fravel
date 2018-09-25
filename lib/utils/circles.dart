// MIT License

// Copyright (c) 2018 Tomi Alagbe

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Circle extends StatelessWidget {

  final Color color;
  final double diameter;
  final Offset center;

  Circle({@required this.color, @required this.diameter, this.center});

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      size: new Size(diameter, diameter),
      painter: new CirclePainter(color, center: center),
    );
  }

}

class CirclePainter extends CustomPainter {

  final Color color;
  final Offset center;

  CirclePainter(this.color, {this.center});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        center ?? new Offset(size.width / 2, size.height / 2), size.width / 2,
        new Paint()..color = this.color);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;

}