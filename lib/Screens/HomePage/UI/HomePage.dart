// Done

/*
Main Concept in this project is ColorFiltered
ColorFiltered Class :
A description of a color filter to apply when drawing a shape or compositing a
layer with a particular Paint. A color filter is a function that takes two colors, and outputs one color.
When applied during compositing, it is independently applied to each pixel of the layer being drawn before
the entire layer is merged with the destination.

Instances of this class are used with Paint.colorFilter on Paint objects

We used a ColorFiltered class constructor
const ColorFilter.mode( Color color, BlendMode blendMode ),
Creates a color filter that applies the blend mode given as the second argument. The source color
is the one given as the first argument, and the destination color is the one from the layer being composited.
 */


import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List mycolors = <Color>[
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.indigo,
];
Color primaryColor = mycolors[0];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Filters"),
      ),
      body: Center(
        child: Stack(
          children: [
            buildImage(),  //This is  for image
            buildColorIcons(), // This is for different image colors
            buildAmountTag(), // This is for Amount
          ],
        ),
      ),
    );
  }

  Widget buildImage() => Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: ColorFiltered(
      colorFilter: ColorFilter.mode(primaryColor, BlendMode.hue),
      child: Container(
        color: Colors.white,
        child: Transform.translate(
          offset: Offset(35, -30),
          child: Transform.rotate(
            angle: pi / -0.55,
            child: Image.asset(
              "assets/Images/product.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ),
  );

  Widget buildColorIcons() => Positioned(
    bottom: 40,
    right: 10,
    child: Row(
      children: [
        for (var i = 0; i < 6; i++)
          buildIconBtn(mycolors[i])],
    ),
  );

  Widget buildIconBtn(Color myColor) => Container(
    child: Stack(
      children: [
        Positioned(
          top: 12.5,
          left: 12.5,
          child: Center(
            child: Icon(
              Icons.check,
              size: 22,
              color: primaryColor == myColor ? myColor : Colors.transparent,
            ),
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.circle,
              color: myColor.withOpacity(0.65),
              size: 30,
            ),
          onPressed: () {
            setState(() {
              primaryColor = myColor;
            });
          },
        ),
      ],
    ),
  );

  Widget buildAmountTag() => Positioned(
    bottom: 125,
    left: 50,
    child: Container(
      child: Text(
        "\$25.00",
        style: TextStyle(
            color: primaryColor.withOpacity(0.65),
            fontSize: 30.00,
            fontWeight: FontWeight.w500),
      ),
    ),
  );
}