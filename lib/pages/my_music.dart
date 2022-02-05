import 'package:flutter/material.dart';

class MyMusic extends StatefulWidget {
  @override
  _MyMusicState createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'My Music',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
