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

class AnimatedText extends StatefulWidget {
  final String text;
  final int delayInMilliseconds;
  final int durationInMilliseconds;
  final TextStyle textStyle;

  AnimatedText(this.text, this.delayInMilliseconds,
      {this.durationInMilliseconds: 2500, this.textStyle});

  @override createState() => new AnimatedTextState(text);
}

class AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {

  String currentText = "";

  final String text;

  AnimationController animationController;

  List<int> textRunes;
  int curIndex = 0;

  AnimatedTextState(this.text) {
    textRunes = text.runes.toList();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this,
        value: 0.0,
        lowerBound: 0.0,
        upperBound: textRunes.length.toDouble(),
        duration: new Duration(
            milliseconds: widget.durationInMilliseconds));

    animationController.addListener(() {
      if (animationController.value.toInt() == 0) {
        setState(() {
          currentText = new String.fromCharCode(textRunes[0]);
        });
      } else if (animationController.value.toInt() > curIndex &&
          animationController.value.toInt() < textRunes.length) {
        setState(() {
          curIndex = animationController.value.toInt();
          currentText += new String.fromCharCode(textRunes[curIndex]);
        });
      }
    });

    // await
    // new Future.delayed(new Duration(milliseconds: widget.delayInMilliseconds));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Text(currentText, textAlign: TextAlign.left,
      style: widget.textStyle ??
          new TextStyle(fontWeight: FontWeight.w600, fontSize: 28.0),);
  }
}