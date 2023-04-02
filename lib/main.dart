import 'package:flutter/material.dart';
import 'package:random_meme/view/main_screen.dart';
import 'package:random_meme/view/splash_screen.dart';

void main(List<String> args) {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  bool showsplash = true;
  showsplashscreen() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showsplash = false;
      });
    });
  }

  @override
  void initState() {
    showsplashscreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "unsad",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showsplash ? splash_screen() : main_screen(),
    );
  }
}
