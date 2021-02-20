import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokedex/pokemon.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/pokemondetail.dart';

import 'widget/costum_box.dart';

void main() => runApp(MaterialApp(
      title: "Pokedex App",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      // "https://pokeapi.co/api/v2";

      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeList pokeList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var resp = await http.get(url);
    var decodeJson = jsonDecode(resp.body);
    pokeList = PokeList.fromJson(decodeJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex App'),
        backgroundColor: Colors.tealAccent[700],
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Text(
                    "Hello!!!",
                    style: TextStyle(fontSize: 30),
                  ),
                  Card(
                    elevation: 0,
                    child: Container(
                      height: 500,
                      width: 500,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://secure.img1-fg.wfcdn.com/im/02238154/compr-r85/8470/84707680/pokemon-pikachu-wall-decal.jpg"))),
                    ),
                    // Image.network(
                  ), //     "https://secure.img1-fg.wfcdn.com/im/02238154/compr-r85/8470/84707680/pokemon-pikachu-wall-decal.jpg"),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: "Pokedex",
                descriptions: "This App is for educational purpose.",
                text: "Ok",
              );
            },
          );
        },
        child: Icon(Icons.info),
        backgroundColor: Colors.tealAccent[700],
      ),
      body: pokeList == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "List of Pokemon",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: pokeList.pokemon
                        .map((poke) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PokeDetail(
                                                pokemon: poke,
                                              )));
                                },
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                        color: Colors.green[200],
                                        width: 3,
                                      ),
                                    ),
                                    elevation: 5.0,
                                    shadowColor: Colors.teal,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 120,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          poke.img))),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  poke.name,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                FilterChip(
                                                  backgroundColor:
                                                      Colors.teal[100],
                                                  label: Text(
                                                    "AVG Spawns: ${poke.avgSpawns}",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  onSelected: (b) {},
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
