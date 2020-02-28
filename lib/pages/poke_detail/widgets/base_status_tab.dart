import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex2/stores/pokeapi_store.dart';

class BaseStatusTab extends StatefulWidget {
  @override
  _BaseStatusTabState createState() => _BaseStatusTabState();
}

class _BaseStatusTabState extends State<BaseStatusTab> {
  @override
  PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SingleChildScrollView(
          child: _baseStatus(_pokeApiStore.pokemonAtual.num),
        );
      },
    );
  }

  Widget _baseStatus(String num) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          _baseStateProperty(
              'HP',
              _pokeApiStore.status[0],
              Colors.red),
          SizedBox(height: 10),
          _baseStateProperty(
              'Attack',
              _pokeApiStore.status[1],
              Colors.green),
          SizedBox(height: 10),
          _baseStateProperty(
              'Defense',
              _pokeApiStore.status[2],
              Colors.red),
          SizedBox(height: 10),
          _baseStateProperty(
              'Sp. Atk',
              _pokeApiStore.status[3],
              Colors.green),
          SizedBox(height: 10),
          _baseStateProperty(
              'Sp. Def',
              _pokeApiStore.status[4],
              Colors.green),
          SizedBox(height: 10),
          _baseStateProperty(
              'Speed',
              _pokeApiStore.status[5],
              Colors.red),
          SizedBox(height: 10),
          _baseStateProperty(
              'Total',
              _pokeApiStore.status[6],
              Colors.green),
        ],
      ),
    );
  }

  _baseStateProperty(String property, int value, Color color) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                property,
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                value.toString(),
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            Expanded(
              flex: 4,
              child: LinearProgressIndicator(
                value: value / 100,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
