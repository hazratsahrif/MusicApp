import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/constant/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/pages/artist.dart';
import 'package:music_player/pages/my_library.dart';
import 'package:music_player/pages/play_list.dart';

import 'home.dart';
import 'my_music.dart';

class RooApp extends StatefulWidget {
  @override
  _RooAppState createState() => _RooAppState();
}

class _RooAppState extends State<RooApp> {
  int pageIndex = 2;
  int currentPage = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundcolr,
        body: getBody(),
        bottomNavigationBar: getFooter(),
      ),
    );
  }

  Widget getBody() {
    if (pageIndex == 0) {
      return MyLibrary();
    } else if (pageIndex == 1) {
      return Artist();
    } else if (pageIndex == currentPage) {
      return Home();
    } else if (pageIndex == 3) {
      return PlayList();
    } else {
      return MyMusic();
    }
  }

  Widget getFooter() {
    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: SvgPicture.asset(
                      'assets/images/music_library.svg',
                      width: 27,
                      color: pageIndex != 0 ? kActiveColor : kInActiveColor,
                    ),
                    onTap: () {
                      setState(() {
                        pageIndex = 0;
                        getBody();
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "My Library",
                    style: TextStyle(
                      fontSize: 13,
                      color: pageIndex != 0 ? kActiveColor : kInActiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: SvgPicture.asset(
                      'assets/images/artist.svg',
                      width: 27,
                      color: pageIndex != 1 ? kActiveColor : kInActiveColor,
                    ),
                    onTap: () {
                      setState(() {
                        pageIndex = 1;
                        getBody();
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Artist",
                    style: TextStyle(
                      fontSize: 13,
                      color: pageIndex != 1 ? kActiveColor : kInActiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: kFloatingGradient),
                        child: Icon(
                          Icons.home,
                          size: 27,
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: SvgPicture.asset(
                      'assets/images/music_list.svg',
                      width: 27,
                      color: pageIndex != 3 ? kActiveColor : kInActiveColor,
                    ),
                    onTap: () {
                      setState(() {
                        pageIndex = 3;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Music List",
                    style: TextStyle(
                      fontSize: 13,
                      color: pageIndex != 3 ? kActiveColor : kInActiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: SvgPicture.asset(
                      'assets/images/my_music.svg',
                      width: 27,
                      color: pageIndex != 4 ? kActiveColor : kInActiveColor,
                    ),
                    onTap: () {
                      setState(() {
                        pageIndex = 4;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "My Music",
                    style: TextStyle(
                      fontSize: 13,
                      color: pageIndex != 4 ? kActiveColor : kInActiveColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
