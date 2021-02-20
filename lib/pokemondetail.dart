import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width + 10,
            left: -5,
            top: MediaQuery.of(context).size.height * 0.27,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                side: BorderSide(
                  color: Colors.teal,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    pokemon.name,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Height: ${pokemon.height}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 1.5,
                          )),
                      Text(
                        "Weight: ${pokemon.weight}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        "egg: ${pokemon.egg}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        "Candy: ${pokemon.candy}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Types",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      height: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((typeText) => FilterChip(
                            shape: StadiumBorder(
                                side: BorderSide(color: Colors.teal)),
                            backgroundColor: Colors.blue,
                            label: Text(
                              typeText,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      height: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((w) => FilterChip(
                            shape: StadiumBorder(
                                side: BorderSide(color: Colors.teal)),
                            backgroundColor: Colors.red[600],
                            label: Text(
                              w,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Prev Evolution",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              height: 2,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: pokemon.prevEvolution == null
                                ? [
                                    Text(
                                      "This is the first form",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ]
                                : pokemon.prevEvolution
                                    .map((p) => FilterChip(
                                          shape: StadiumBorder(
                                              side: BorderSide(
                                                  color: Colors.teal)),
                                          backgroundColor: Colors.cyan,
                                          label: Text(
                                            p.name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          onSelected: (b) {},
                                        ))
                                    .toList(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Next Evolution",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              height: 2,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: pokemon.nextEvolution == null
                                ? [Text("This is the final form")]
                                : pokemon.nextEvolution
                                    .map((n) => FilterChip(
                                          shape: StadiumBorder(
                                              side: BorderSide(
                                                  color: Colors.teal)),
                                          backgroundColor: Colors.green[600],
                                          label: Text(
                                            n.name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          onSelected: (b) {},
                                        ))
                                    .toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img,
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                      side: BorderSide(
                        color: Colors.transparent,
                      )),
                  color: Colors.white,
                  shadowColor: Colors.teal,
                  child: Container(
                    height: 250.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(pokemon.img),
                      ),
                    ),
                  ),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    var pokemon2 = pokemon;
    return Scaffold(
      backgroundColor: Colors.tealAccent[400],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.tealAccent[400],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pokemon2.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "#${pokemon2.id}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: bodyWidget(context),
    );
  }
}
