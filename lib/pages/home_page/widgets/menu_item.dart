import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex2/pages/pokedex_page/pokedex_page.dart';

class MenuItem extends StatefulWidget {
  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          _cards('Pokedex', 'Moves',
              primary1: Color(0xff4dc2a6),
              secondary1: Color(0xff65d4bc),
              primary2: Color(0xfff77769),
              secondary2: Color(0xfff88a7d)),
          _cards('Abilities', 'Items',
              primary1: Color(0xff59a9f4),
              secondary1: Color(0xff6fc1f9),
              primary2: Color(0xffffce4a),
              secondary2: Color(0xffffd858)),
          _cards('Locations', 'Type Charts',
              primary1: Color(0xff7b528c),
              secondary1: Color(0xff9569a5),
              primary2: Color(0xffb1726c),
              secondary2: Color(0xffc1877e)),
        ],
      ),
    );
  }

  Widget _cards(String text1, String text2,
      {Color primary1, Color secondary1, Color primary2, Color secondary2}) {
    return Container(
      height: MediaQuery.of(context).size.height / 8.5,
      child: Row(
        children: <Widget>[
          _card(text1, primary1, secondary1),
          _card(text2, primary2, secondary2)
        ],
      ),
    );
  }

  Widget _card(String title, Color color, Color seondaryColor) {
    return Hero(
      transitionOnUserGestures: true,
      tag: title,
      child: InkWell(
        onTap: () {
          if (title == 'Pokedex') {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PokedexPage()));
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          width: MediaQuery.of(context).size.width / 2.4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(2, 5),
                  color: color.withAlpha(100),
                  spreadRadius: 2),
            ],
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Positioned(
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: seondaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Transform.scale(
                    scale: 1.2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        heightFactor: 1,
                        widthFactor: .9,
                        child: Image.asset(
                          'assets/images/pokeball.png',
                          color: seondaryColor,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
