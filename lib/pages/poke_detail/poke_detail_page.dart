import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex2/models/pokeapi.dart';
import 'package:pokedex2/pages/poke_detail/widgets/base_status_tab.dart';
import 'package:pokedex2/pages/poke_detail/widgets/evaluation_tab.dart';
import 'package:pokedex2/stores/pokeapi_store.dart';
import 'package:pokedex2/util/const.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatefulWidget {
  final int index;

  PokeDetailPage({Key key, this.index}) : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  PageController _pageController;
  PokeApiStore _pokeApiStore;
  MultiTrackTween _animation;
  double _progress;
  double _multiple;
  double _opacity;
  double _opacityTitle;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
    _pokeApiStore = GetIt.instance<PokeApiStore>();

    _animation = MultiTrackTween([
      Track("rotation").add(Duration(seconds: 5), Tween(begin: 0.0, end: 6.0),
          curve: Curves.linear)
    ]);

    _progress = 0;
    _multiple = 1;
    _opacity = 1;
    _opacityTitle = 0;
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;
    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: Observer(builder: (_) {
          return AppBar(
            backgroundColor: _pokeApiStore.corPokemonAtual as Color,
            title: Opacity(
              child: Observer(
                builder: (_) {
                  return Text(
                    _pokeApiStore.pokemonAtual.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  );
                },
              ),
              opacity: _opacityTitle,
            ),
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: [
              Align(
                alignment: Alignment.centerRight,
                child: ControlledAnimation(
                  playback: Playback.LOOP,
                  duration: _animation.duration,
                  tween: _animation,
                  builder: (context, animation) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(
                          angle: animation['rotation'],
                          child: Hero(
                            tag: '',
                            child: Opacity(
                              child: Image.asset(
                                Consts.whitePokeball,
                                height: 60,
                                width: 60,
                              ),
                              opacity: _opacityTitle >= 0.2 ? 0.2 : 0.0,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          );
        }),
      ),
      body: _body(context, _pokeApiStore),
    );
  }

  _body(context, PokeApiStore _pokeApiStore) {
    return Stack(
      children: [
        Observer(builder: (_) {
          return Container(color: _pokeApiStore.corPokemonAtual as Color);
        }),
        Container(
          height: MediaQuery.of(context).size.height / 3,
        ),
        SlidingSheet(
          listener: (state) {
            setState(() {
              _progress = state.progress;
              _multiple = 1 - interval(0.0, 0.9, _progress);
              _opacity = _multiple;
              _opacityTitle = _multiple = interval(0.55, 0.8, _progress);
            });
          },
          elevation: 0,
          cornerRadius: 30,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.65, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(top: 26),
                child: DefaultTabController(
                  initialIndex: 2,
                  length: 4,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: TabBar(
                      indicatorColor: _pokeApiStore.corPokemonAtual,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13.6),
                      unselectedLabelColor: Colors.black45,
                      unselectedLabelStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                      tabs: [
                        Tab(child: Text('About')),
                        Tab(child: Text('Base State')),
                        Tab(child: Text('Evaluation')),
                        Tab(child: Text('Moves')),
                      ],
                    ),
                    body: TabBarView(
                      children: [
                        Container(),
                        BaseStatusTab(),
                        EvaluationTab(),
                        Container(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        IgnorePointer(
          ignoring: _opacityTitle == 1,
          child: Opacity(
            opacity: _opacity,
            child: Stack(
              children: [
                Observer(
                  builder: (_) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(26, 10, 26, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  _pokeApiStore.pokemonAtual.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '#${_pokeApiStore.pokemonAtual.num}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                setTipos(_pokeApiStore.pokemonAtual.type)
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 65 - _progress * 50),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        _pokeApiStore.setPokemonAtual(idx: index);
                      },
                      itemCount: _pokeApiStore.pokeAPI.pokemon.length,
                      itemBuilder: (context, index) {
                        Pokemon _pokemon = _pokeApiStore.getPokemon(idx: index);
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: ControlledAnimation(
                                playback: Playback.LOOP,
                                duration: _animation.duration,
                                tween: _animation,
                                startPosition: 0.5,
                                builder: (context, animation) {
                                  return Transform.rotate(
                                    angle: animation['rotation'],
                                    child: Hero(
                                      tag: _pokemon.name + 'rotation',
                                      child: Opacity(
                                        child: Image.asset(Consts.whitePokeball,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3.5),
                                        opacity: 0.2,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Observer(
                              builder: (_) {
                                return AnimatedPadding(
                                  curve: Curves.bounceInOut,
                                  duration: Duration(milliseconds: 350),
                                  padding: EdgeInsets.all(
                                      index == _pokeApiStore.posicaoAtual
                                          ? 0
                                          : 90),
                                  child: Hero(
                                    tag: _pokemon.name,
                                    child: CachedNetworkImage(
                                      height: 155,
                                      width: 155,
                                      placeholder: (context, url) =>
                                          new Container(
                                        color: Colors.transparent,
                                      ),
                                      color: index == _pokeApiStore.posicaoAtual
                                          ? null
                                          : Colors.black.withOpacity(0.5),
                                      imageUrl:
                                          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokemon.num}.png',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget setTipos(List<String> types) {
    List<Widget> lista = [];
    types.forEach(
      (nome) {
        lista.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 8, 0),
            child: Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 6, 14, 6),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
    return Row(
      children: lista,
    );
  }
}
