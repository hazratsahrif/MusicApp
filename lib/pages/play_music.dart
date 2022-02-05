import 'package:flutter/material.dart';
import 'package:music_player/constant/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/pages/home.dart';

class PlayMusic extends StatefulWidget {
  @override
  _PlayMusicState createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> {
  bool play = false;
  IconData playbtn = Icons.play_circle_fill_rounded;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundcolr,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    ));
  }

  Widget getFooter() {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.queue_music,
            size: 30,
            color: ktextColor,
          ),
          Icon(
            Icons.repeat,
            size: 30,
            color: ktextColor,
          ),
          Icon(
            Icons.shuffle_rounded,
            size: 30,
            color: ktextColor,
          ),
          Icon(
            Icons.post_add,
            size: 30,
            color: ktextColor,
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: <Widget>[
        Stack(children: <Widget>[
          Container(
            child: Image(
              image: AssetImage("assets/images/header.png"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0, left: 20, right: 20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      child: Icon(
                        Icons.arrow_back,
                        size: 27,
                        color: Colors.white.withOpacity(0.9),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black87.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        size: 27,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.more_vert_rounded,
                        size: 27,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 165,
                    width: 165,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 10,
                        )
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/momi.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 240),
              child: SvgPicture.asset(
                'assets/images/dots.svg',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 370,
              left: 20,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Gul panra",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "New Album",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/artist.svg',
                        width: 27,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.favorite,
                        size: 37,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 450, left: 35, right: 35),
            child: Image.asset('assets/images/frequency.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 640),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.skip_previous_rounded,
                  size: 40,
                  color: ktextColor,
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    if (!play) {
                      setState(() {
                        playbtn = Icons.pause;
                        play = true;
                      });
                    } else {
                      setState(() {
                        playbtn = Icons.play_circle_fill_rounded;
                        play = true;
                      });
                    }
                  },
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, gradient: kFloatingGradient),
                      child: Icon(
                        playbtn,
                        size: 45,
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.skip_next_rounded,
                  size: 40,
                  color: ktextColor,
                ),
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}
