import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokedex2/util/const.dart';

import 'package:pokedex2/models/pokeapi.dart';

part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI _pokeAPI;

  @observable
  Pokemon pokemonAtual;

  @observable
  dynamic _corPokemonAtual;

  @observable
  int posicaoAtual;

  @observable
  var status = List<int>();

  @computed
  PokeAPI get pokeAPI => _pokeAPI;

  @computed
  dynamic get corPokemonAtual => _corPokemonAtual;

  @action
  fetchPokemonList() {
    _pokeAPI = null;
    loadPokeAPI().then((pokeList) {
      _pokeAPI = pokeList;
    });
  }

  @action
  getPokemon({int idx}) {
    return _pokeAPI.pokemon[idx];
  }

  @action
  setPokemonAtual({int idx}) {
    pokemonAtual = _pokeAPI.pokemon[idx];
    _corPokemonAtual = Consts.getColorType(type: pokemonAtual.type[0]);
    posicaoAtual = idx;
    status.clear();
    for (int i = 0; i < 7; i++) {
      status.add((Random().nextInt(100) *
              int.parse(pokemonAtual.num) /
              int.parse(pokemonAtual.num))
          .round());
    }
  }

  @action
  getImage({String num}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png',
    );
  }

  Future<PokeAPI> loadPokeAPI() async {
    try {
      final response = await http.get(Consts.url);
      var decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
