import 'package:flutter/material.dart';
import 'package:pokedex2/pages/home_page/widgets/menu_item.dart';
import 'package:pokedex2/util/const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;

    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: -(450 / 3.9),
              left: screenWidth - (250 / 1.3),
              child: Opacity(
                child: Image.asset(
                  Consts.blackPokeball,
                  width: 300,
                  height: 300,
                ),
                opacity: 0.05,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    height: statusWidth,
                    color: Colors.red.withOpacity(.1),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 9,
                        ),
                        Text(
                          "What Pokemon \nare you looking for?",
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                            fontFamily: 'Google',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        IgnorePointer(
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 30,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'Search Pokemon, Move, Ability etc',
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  MenuItem()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
