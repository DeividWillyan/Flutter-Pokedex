import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex2/pages/home_page/home_page.dart';
import 'package:pokedex2/stores/pokeapi_store.dart';

void main() {
  GetIt getIt = GetIt.instance;
  GetIt.instance.registerSingleton<PokeApiStore>(PokeApiStore());
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
