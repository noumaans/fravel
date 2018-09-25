// MIT License

// Copyright (c) 2018 Noumaan Shah
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
import '../../utils/animated_background.dart';
import '../../utils/animated_locations_text.dart';
import '../../utils/animated_text.dart';
import '../../utils/spread_circles.dart';
import '../../utils/stacked_circles.dart';


class LoginScreen extends StatefulWidget {

  @override
  State createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {

  AnimationController buttonAnimationController;
  Animation<AlignmentGeometry> buttonAlignment;
  Animation<double> buttonOpacity;

  @override
  void initState() {
    super.initState();
    buttonAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000));

    buttonAlignment = new AlignmentTween(
      begin: new Alignment(0.0, 1.0),
      end: new Alignment(0.0, 0.95),
    ).animate(new CurvedAnimation(
      parent: buttonAnimationController,
      curve: new Interval(0.3, 0.9, curve: Curves.easeInOut),));
    buttonOpacity = new Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(new CurvedAnimation(
      parent: buttonAnimationController,
      curve: new Interval(0.3, 1.0, curve: Curves.easeInOut),));

    buttonAlignment.addListener(() {
      setState(() {});
    });
    buttonOpacity.addListener(() {
      setState(() {});
    });

    buttonAnimationController.forward();
  }

  @override
  void dispose() {
    buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new AnimatedBackground(),
          _buildStackedCircles(),
          new SpreadCircles(),
          _buildButtomButtons(),
          _buildAnimatedText(),
        ],
      ),
    );
  }

  Widget _buildAnimatedText() {
    final animatedTextDelay = 800;

    return new Align(
        alignment: new Alignment(-1.0, -0.75),
        child: new Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new AnimatedText(
                  "Find your perfect \nactivities in", animatedTextDelay,
                  durationInMilliseconds: 2500),
              new AnimatedLocationsText(animatedTextDelay + 2500),
            ],
          ),
        )
    );
  }

  Widget _buildStackedCircles() {
    final circleDiameter = 25.0;
    return new Align(
      alignment: new Alignment(0.0, -0.9),
      child: new Hero(
        tag: "CircleHeroTag",
        child: new StackedCircles(circleDiameter),
      ),
    );
  }

  Widget _buildButtomButtons() {
    return new AnimatedBuilder(
        animation: buttonAnimationController,
        child: new Container(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createAccountButton(),
              new Padding(padding: const EdgeInsets.only(bottom: 10.0)),
              _signInButton(),
              new Padding(padding: const EdgeInsets.only(bottom: 10.0)),
              _termsAndConditions(),
            ],
          ),
        ),
        builder: (BuildContext context, Widget child) {
          return new Align(
            alignment: buttonAlignment.value,
            child: new Opacity(
              opacity: buttonOpacity.value,
              child: child,
            ),
          );
        }
    );
  }

  Widget _createAccountButton() {
    return new GestureDetector(
      child: new Material(
        child: new Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5.0),
            gradient: new LinearGradient(
                colors: <Color>[
                  Colors.green,
                  Colors.greenAccent,
                ]
            ),
          ),
          alignment: Alignment.center,
          child: new Text("Create account",
            style: new TextStyle(color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),),
        ),
      ),
      onTap: () {},
    );
  }

  Widget _signInButton() {
    return new GestureDetector(
      child: new Material(
        child: new Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5.0),
            gradient: new LinearGradient(
                colors: <Color>[
                  Colors.grey.withAlpha(150),
                  Colors.grey.withAlpha(100),
                ]
            ),
          ),
          alignment: Alignment.center,
          child: new Text("Sign in",
            style: new TextStyle(color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),),
        ),
      ),
      onTap: () {},
    );
  }

  Widget _termsAndConditions() {
    final textStyle = new TextStyle(fontSize: 13.0, color: Colors.black38);
    return new RichText(
      textAlign: TextAlign.center,
      text: new TextSpan(
        text: "By signing up to our services you indicate that you have read and agree to our ",
        style: textStyle,
        children: <TextSpan>[
          new TextSpan(text: "terms and conditions",
              style: new TextStyle(decoration: TextDecoration.underline)),
        ],
      ),
    );
  }
}
