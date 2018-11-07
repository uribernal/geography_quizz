import 'package:flutter/material.dart';

import './percentage_card_ui.dart';

import '../utils/game_card.dart';
import '../pages/home_page.dart';
import '../pages/landing_page.dart';


class GameCardUI extends StatelessWidget{
  final double _percentage;
  final double _width;
  final ScrollController _controller;

  GameCardUI(this._percentage, this._width, this._controller);

  @override
  Widget build(BuildContext context) {

    return  // LA CARTA
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
                                new PercentageCardUI(_percentage, game.color),
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
          controller: _controller,
          itemExtent: _width - 80,
          itemCount: 4,
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


