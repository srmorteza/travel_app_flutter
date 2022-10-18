import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WellcomPage extends StatefulWidget {
  const WellcomPage({Key? key}) : super(key: key);

  @override
  State<WellcomPage> createState() => _WellcomPageState();
}

class _WellcomPageState extends State<WellcomPage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/"+images[index]))),
            );
          }),
    );
  }
}
