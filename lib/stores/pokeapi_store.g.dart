// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeAPI> _$pokeAPIComputed;

  @override
  PokeAPI get pokeAPI =>
      (_$pokeAPIComputed ??= Computed<PokeAPI>(() => super.pokeAPI)).value;
  Computed<dynamic> _$corPokemonAtualComputed;

  @override
  dynamic get corPokemonAtual => (_$corPokemonAtualComputed ??=
          Computed<dynamic>(() => super.corPokemonAtual))
      .value;

  final _$_pokeAPIAtom = Atom(name: '_PokeApiStoreBase._pokeAPI');

  @override
  PokeAPI get _pokeAPI {
    _$_pokeAPIAtom.context.enforceReadPolicy(_$_pokeAPIAtom);
    _$_pokeAPIAtom.reportObserved();
    return super._pokeAPI;
  }

  @override
  set _pokeAPI(PokeAPI value) {
    _$_pokeAPIAtom.context.conditionallyRunInAction(() {
      super._pokeAPI = value;
      _$_pokeAPIAtom.reportChanged();
    }, _$_pokeAPIAtom, name: '${_$_pokeAPIAtom.name}_set');
  }

  final _$pokemonAtualAtom = Atom(name: '_PokeApiStoreBase.pokemonAtual');

  @override
  Pokemon get pokemonAtual {
    _$pokemonAtualAtom.context.enforceReadPolicy(_$pokemonAtualAtom);
    _$pokemonAtualAtom.reportObserved();
    return super.pokemonAtual;
  }

  @override
  set pokemonAtual(Pokemon value) {
    _$pokemonAtualAtom.context.conditionallyRunInAction(() {
      super.pokemonAtual = value;
      _$pokemonAtualAtom.reportChanged();
    }, _$pokemonAtualAtom, name: '${_$pokemonAtualAtom.name}_set');
  }

  final _$_corPokemonAtualAtom =
      Atom(name: '_PokeApiStoreBase._corPokemonAtual');

  @override
  dynamic get _corPokemonAtual {
    _$_corPokemonAtualAtom.context.enforceReadPolicy(_$_corPokemonAtualAtom);
    _$_corPokemonAtualAtom.reportObserved();
    return super._corPokemonAtual;
  }

  @override
  set _corPokemonAtual(dynamic value) {
    _$_corPokemonAtualAtom.context.conditionallyRunInAction(() {
      super._corPokemonAtual = value;
      _$_corPokemonAtualAtom.reportChanged();
    }, _$_corPokemonAtualAtom, name: '${_$_corPokemonAtualAtom.name}_set');
  }

  final _$posicaoAtualAtom = Atom(name: '_PokeApiStoreBase.posicaoAtual');

  @override
  int get posicaoAtual {
    _$posicaoAtualAtom.context.enforceReadPolicy(_$posicaoAtualAtom);
    _$posicaoAtualAtom.reportObserved();
    return super.posicaoAtual;
  }

  @override
  set posicaoAtual(int value) {
    _$posicaoAtualAtom.context.conditionallyRunInAction(() {
      super.posicaoAtual = value;
      _$posicaoAtualAtom.reportChanged();
    }, _$posicaoAtualAtom, name: '${_$posicaoAtualAtom.name}_set');
  }

  final _$statusAtom = Atom(name: '_PokeApiStoreBase.status');

  @override
  List<int> get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(List<int> value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPokemon({int idx}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getPokemon(idx: idx);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPokemonAtual({int idx}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.setPokemonAtual(idx: idx);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getImage({String num}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getImage(num: num);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pokemonAtual: ${pokemonAtual.toString()},posicaoAtual: ${posicaoAtual.toString()},status: ${status.toString()},pokeAPI: ${pokeAPI.toString()},corPokemonAtual: ${corPokemonAtual.toString()}';
    return '{$string}';
  }
}
