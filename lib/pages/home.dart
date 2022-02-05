import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:music_player/json/cardite_json.dart';
import 'package:music_player/pages/play_music.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              child: Image(
                image: AssetImage("assets/images/header.png"),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0, left: 20, right: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Welcome To',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "My Music",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6979F8)),
                        ),
                      ],
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://cdn.crello.com/api/media/medium/449326440/stock-photo-cheerful-teen-girl-listening-music"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140, left: 20, right: 20),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 27,
                    ),
                    suffixIcon: Icon(
                      Icons.filter_list_sharp,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                  ),
                  cursorColor: Colors.white.withOpacity(0.3),
                ),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff3E3C53),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 230, left: 5, right: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlayMusic()),
                    );
                  },
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    child: new
                    Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          child: new Image.asset(
                            "assets/images/mask_gul.png",
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      itemCount: 5,
                      viewportFraction: 0.6,
                      scale: 0.7,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 450),
                child: Text(
                  "New Music",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 530),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Hot Music",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(cardItems.length, (index) {
                        return MusicCard(
                          url: cardItems[index]['img'],
                          name: cardItems[index]['name'],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MusicCard extends StatelessWidget {
  String url;
  String name;
  MusicCard({this.url, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 7, right: 7),
          child: Container(
            height: 120,
            width: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "$url",
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.lightBlue.withOpacity(0.5),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.lightBlue.shade200, blurRadius: 6.0)
                ],
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
