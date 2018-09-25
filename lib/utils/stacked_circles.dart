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
import 'circles.dart';

class StackedCircles extends StatelessWidget {

  final double circleDiameter;
  final Matrix4 circle1Transform;
  final Matrix4 circle2Transform;

  StackedCircles(this.circleDiameter,
      {this.circle1Transform, this.circle2Transform});

  @override
  Widget build(BuildContext context) {
//    final matrix1 = circle1Transform ?? new Matrix4.translationValues(
//        -15.0, 0.0, 0.0)
//      ..scale(0.5, 0.5);
//    final matrix2 = circle2Transform ??
//        new Matrix4.translationValues(15.0, 0.0, 0.0)
//          ..scale(0.5, 0.5);
//
//    return new SizedBox(
//      width: circleDiameter * 2,
//      height: circleDiameter,
//      child: new Stack(
//        alignment: Alignment.center,
//        children: <Widget>[
//          new Transform(
//            transform: matrix1,
//            child: new Circle(
//                color: Colors.purple, diameter: circleDiameter),
//          ),
//          new Transform(
//            transform: matrix2,
//            child: new Opacity(
//              opacity: 0.8,
//              child: new Circle(
//                  color: Colors.yellow, diameter: circleDiameter),
//            ),
//          )
//        ],
//      ),
//    );

    return new SizedBox(
      width: circleDiameter * 2,
      height: circleDiameter,
      child: new Stack(
        children: <Widget>[
          new Align(
            alignment: new Alignment(-0.5, 0.0),
            child: new Circle(color: Colors.purple, diameter: circleDiameter),
          ),
          new Align(
            alignment: new Alignment(0.5, 0.0),
            child: new Opacity(
              opacity: 0.8,
              child: new Circle(color: Colors.yellow, diameter: circleDiameter),
            ),
          ),
        ],
      ),
    );
  }
}

class StackedCirclesAnimation extends StatelessWidget {

  final Animation<double> controller;
  final Animation<double> diameter;
  final Animation<Alignment> alignment, alignment1;

  StackedCirclesAnimation({Key key, this.controller})
      :
        diameter = new Tween<double>(
            end: 25.0,
            begin: 30.0
        ).animate(new CurvedAnimation(parent: controller,
            curve: new Interval(0.0, 1.0, curve: Curves.ease))),

        alignment = new AlignmentTween(
          begin: new Alignment(-0.5, 0.0),
          end: new Alignment(0.2, 0.0),
        ).animate(new CurvedAnimation(parent: controller,
            curve: new Interval(0.0, 1.0, curve: Curves.ease))),

        alignment1 = new AlignmentTween(
          begin: new Alignment(0.5, 0.0),
          end: new Alignment(-0.2, 0.0),
        ).animate(new CurvedAnimation(parent: controller,
            curve: new Interval(0.0, 1.0, curve: Curves.ease))),

        super(key: key);

  Widget _buildAnimation(BuildContext context, Widget child) {
    return new Stack(
      children: <Widget>[
        new Align(
          alignment: alignment.value,
          child: new Circle(color: Colors.purple, diameter: diameter.value),
        ),
        new Align(
          alignment: alignment1.value,
          child: new Opacity(
            opacity: 0.8,
            child: new Circle(color: Colors.yellow, diameter: diameter.value),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
