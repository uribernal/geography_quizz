import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';// scroll
import './landing_page.dart';
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

class GameSelector extends StatefulWidget {
  GameSelector({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GameSelectorState createState() => new _GameSelectorState();
}


class _GameSelectorState extends State<GameSelector> with TickerProviderStateMixin {

  double score = 0.0;
  Color backgroundColor;
  Color constBackColor;
  Tween<Color> colorTween; // An interpolation between two colors.
  GameCard game;
  ScrollController scrollController;

  @override
  void initState() {
    colorTween = new ColorTween(begin: GamesProperties.colors[0], end: GamesProperties.colors[1]);
    backgroundColor = GamesProperties.games[0].color;
    game = GamesProperties.games[0];

    scrollController = new ScrollController();
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
      ScrollDirection direction = position.userScrollDirection;
      int page = (position.pixels / (position.maxScrollExtent/(GamesProperties.games.length.toDouble()-1))).toInt();
      double pageDo = (position.pixels / (position.maxScrollExtent/(GamesProperties.games.length.toDouble()-1)));
      double percent = pageDo - page;
      /*setState(() {
        description = getDescription(page);
      });*/
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
                              "",
                              style: new TextStyle(
                                  color: Colors.white70
                              ),
                            ),
                          ],
                        ),
                      ),
                      // LA CARTA
                      new Container(
                        height: 350.0,
                        width: _width,
                        child: new ListView.builder(
                          itemBuilder: (context, index) {
                            GameCard game = GamesProperties.games[index];

                            EdgeInsets padding = const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 30.0);

                            return new Padding(
                                padding: padding,
                                // LA CAIXA (CARTA)
                                child: new InkWell(
                                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage(index))),
                                  child: new Container(
                                      decoration: new BoxDecoration(
                                          borderRadius: new BorderRadius.circular(10.0),
                                          boxShadow: [
                                            new BoxShadow(
                                                color: Colors.black.withAlpha(70),
                                                offset: const Offset(3.0, 10.0),
                                                blurRadius: 15.0
                                            )
                                          ]
                                      ),
                                      height: 250.0,
                                      child: new Stack(
                                        children: <Widget>[
                                          // new Hero(
                                          //   tag: "TAG001",
                                          //   child:
                                          new Container(
                                            decoration: new BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: new BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          // ),
                                          new Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: new Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                new Expanded(
                                                  child: new Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      new Expanded(
                                                        child: new Container(
                                                            alignment: Alignment.topCenter,
                                                            child: new Image.asset(game.icon, fit: BoxFit.cover, ) //etc
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                // Petit marge per a que no quedi apretat
                                                new Padding(padding: const EdgeInsets.only(bottom: 15.0)),
                                                // TITOL
                                                new Padding(
                                                  padding: const EdgeInsets.only(bottom: 20.0),
                                                  child: new Align(
                                                    alignment: Alignment.bottomLeft,
                                                    child: new Material(
                                                      color: Colors.transparent,
                                                      child: new Text(
                                                        game.title, // El titol de la carta
                                                        style: new TextStyle(
                                                            fontSize: 30.0
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                new Align(
                                                    alignment: Alignment.bottomLeft,
                                                    //child: new Hero(
                                                    //    tag: "TAG002",
                                                    child: new Material(
                                                      color: Colors.transparent,
                                                      child: new Row(
                                                        children: <Widget>[
                                                          new Expanded(
                                                            child: new LinearProgressIndicator(
                                                              value: score/150,
                                                              backgroundColor: Colors.grey.withAlpha(50),
                                                              valueColor: new AlwaysStoppedAnimation<Color>(game.color),
                                                            ),
                                                          ),
                                                          new Padding(
                                                            padding: const EdgeInsets.only(left: 5.0),
                                                            child: new Text(
                                                                (score*100).round().toString() + "%"
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  // )
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                )
                            );
                          },
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                          scrollDirection: Axis.horizontal,
                          physics: new CustomScrollPhysics(),
                          controller: scrollController,
                          itemExtent: _width - 80,
                          itemCount: 4,
                        ),
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

class CustomScrollPhysics extends ScrollPhysics {

  CustomScrollPhysics({ ScrollPhysics parent, }) : super(parent: parent);

  final double numOfItems = 3.0;

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return new CustomScrollPhysics(parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position) {
    return position.pixels / (position.maxScrollExtent/numOfItems);
    // return position.pixels / position.viewportDimension;
  }

  double _getPixels(ScrollPosition position, double page) {
    // return page * position.viewportDimension;
    return page * (position.maxScrollExtent/numOfItems);
  }

  double _getTargetPixels(ScrollPosition position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity)
      page -= 0.5;
    else if (velocity > tolerance.velocity)
      page += 0.5;
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return new ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    return null;
  }

}
