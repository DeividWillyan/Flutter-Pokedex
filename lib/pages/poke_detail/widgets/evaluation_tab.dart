import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex2/stores/pokeapi_store.dart';
import 'package:pokedex2/util/const.dart';

class EvaluationTab extends StatefulWidget {
  @override
  _EvaluationTabState createState() => _EvaluationTabState();
}

class _EvaluationTabState extends State<EvaluationTab> {
  PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Text(
                "Evolution Chain",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Observer(builder: (_) {
                  return Column(
                    children: _generateNextEvolution(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _generateNextEvolution() {
    List<Widget> list = [];
    if (_pokeApiStore.pokemonAtual.nextEvolution == null) return [];
    int length = _pokeApiStore.pokemonAtual.nextEvolution.length;
    if (length == 1) {
      list.add(_evaluationRow(
          _pokeApiStore.pokemonAtual.num,
          _pokeApiStore.pokemonAtual.name,
          _pokeApiStore.pokemonAtual.nextEvolution[0].num,
          _pokeApiStore.pokemonAtual.nextEvolution[0].name));
    }
    if (length > 1) {
      list.add(_evaluationRow(
          _pokeApiStore.pokemonAtual.num,
          _pokeApiStore.pokemonAtual.name,
          _pokeApiStore.pokemonAtual.nextEvolution[0].num,
          _pokeApiStore.pokemonAtual.nextEvolution[0].name));
      list.add(SizedBox(height: 10));
      list.add(Divider());
      list.add(SizedBox(height: 10));
      for (int i = 0; i < length; i++) {
        list.add(_evaluationRow(
            _pokeApiStore.pokemonAtual.nextEvolution[i].num,
            _pokeApiStore.pokemonAtual.nextEvolution[i].name,
            _pokeApiStore.pokemonAtual.nextEvolution[length-1].num,
            _pokeApiStore.pokemonAtual.nextEvolution[i++].name));
        list.add(SizedBox(height: 10));
        list.add(Divider());
        list.add(SizedBox(height: 10));
      }
    }
    return list;
  }

  Widget _evaluationRow(String num1, String name1, String num2, String name2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    Consts.blackPokeball,
                    height: 70,
                    width: 70,
                  ),
                ),
                CachedNetworkImage(
                  height: 70,
                  width: 70,
                  placeholder: (context, url) =>
                      new Container(color: Colors.transparent),
                  imageUrl:
                      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${num1}.png',
                ),
              ],
            ),
            Text(name1),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.arrow_forward,
              color: Colors.black26,
            ),
            Text(
              'Next',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    Consts.blackPokeball,
                    height: 70,
                    width: 70,
                  ),
                ),
                CachedNetworkImage(
                  height: 70,
                  width: 70,
                  placeholder: (context, url) =>
                      new Container(color: Colors.transparent),
                  imageUrl:
                      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${num2}.png',
                ),
              ],
            ),
            Text(name2)
          ],
        ),
      ],
    );
  }
}
