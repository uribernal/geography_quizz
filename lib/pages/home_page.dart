import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // scroll
import '../UI/game_card_ui.dart';

import '../utils/game_card.dart';

// Todo
// Posar idiomes
// posar descripcions als jocs
// posar percentatge del joc
// posar settings
// afegir joc
// canviar colors
// canviar UI respostes

class GamesProperties {
  static const List<Color> colors = [
    const Color(0xFF5A89E6),
    const Color(0xFFF77B67),
    const Color(0xFF4EC5AC),
    const Color(0xCD853F),
  ];

  static List<GameCard> games = [
    new GameCard("Capitals", colors[0], "assets/world.png"),
    new GameCard("Frontiers", Colors.green, "assets/frontiers.png"),
    new GameCard("Population", colors[2], "assets/population2.png"),
    new GameCard("Flags", colors[1], "assets/flag.png"),
  ];

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  double score = 50/179;
  Color backgroundColor;
  Color constBackColor;
  Tween<Color> colorTween; // An interpolation between two colors.

  ScrollController scrollController;

  @override
  void initState() {
    colorTween = new ColorTween(begin: GamesProperties.colors[0], end: GamesProperties.colors[1]);
    backgroundColor = GamesProperties.games[0].color;

    scrollController = new ScrollController();
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
      ScrollDirection direction = position.userScrollDirection;
      int page = (position.pixels / (position.maxScrollExtent/(GamesProperties.games.length.toDouble()-1))).toInt();
      double pageDo = (position.pixels / (position.maxScrollExtent/(GamesProperties.games.length.toDouble()-1)));
      double percent = pageDo - page;

      if (direction == ScrollDirection.reverse) {
        //page begin
        if (GamesProperties.games.length-1 < page+1) {
          return;
        }
        colorTween.begin = GamesProperties.games[page].color;
        colorTween.end = GamesProperties.games[page+1].color;
        setState(() {
          backgroundColor = colorTween.lerp(percent);
        });
      }else if (direction == ScrollDirection.forward) {
        //+1 begin page end
        if (GamesProperties.games.length-1 < page+1) {
          return;
        }
        colorTween.begin = GamesProperties.games[page].color;
        colorTween.end = GamesProperties.games[page+1].color;
        setState(() {
          backgroundColor = colorTween.lerp(percent);

        });
      }else {
        return;
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    final double _width = MediaQuery.of(context).size.width;

    return new Container(
      decoration: new BoxDecoration(
          color: backgroundColor
      ),
      child: new Scaffold( // Barra
          backgroundColor: Colors.transparent,

          // Barra
          appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: new Text("Geography Quiz App"),
            leading: new IconButton(
              //icon: new Icon(CustomIcons.menu), // Icono menu
              icon: new Icon(Icons.menu), // Icono menu
              onPressed: () {},
            ),
            actions: <Widget>[
              new IconButton(
                //icon: new Icon(CustomIcons.search, size: 26.0,), // per definir iconos propis
                icon: new Icon(Icons.settings, size: 26.0,),
                onPressed: () {},
              )
            ],
          ),

          // Cos
          body: new Container(
            child: new Stack(
              children: <Widget>[
                // CONTENIDOR PRINCIPAL
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Contenidor Text
                      new Container(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 50.0, right: 60.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Text Hello John
                            new Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: new Text(
                                "2018 Geography Quiz",
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0
                                ),
                              ),
                            ),
                            new Text(
                              "Try to aswer correctly.",
                              style: new TextStyle(
                                  color: Colors.white70
                              ),
                            ),
                            new Text(
                              "There are 30 questions in each test.",
                              style: new TextStyle(
                                  color: Colors.white70
                              ),
                            ),
                          ],
                        ),
                      ),
                      // LA CARTA
                      new GameCardUI(
                          score,
                          _width,
                          scrollController
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}