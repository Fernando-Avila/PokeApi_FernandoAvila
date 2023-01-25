import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi_fernando_avila_bloc/blocs/detail/detail_bloc.dart';
import 'package:pokeapi_fernando_avila_bloc/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/screens/detail.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/screens/home.dart';

void main() {
  runApp(MyApp3());
}

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonBloc()..init(),
        ),
        BlocProvider(
          create: (context) => DetailBloc(),
        ),
      ],
      child: BlocBuilder<PokemonBloc, PokemonState>(
        //  bloc: BlocProvider.of<PokemonBloc>(context),
        builder: (context, state) {
          //  print('cambio el color //${state.pokemon!.types![0].type!.name}}');
          return MaterialApp(
            theme: ThemeData(
              colorScheme: state.colorScheme,
            ),
            routes: {
              // ignore: prefer_const_constructors
              '/': (context) => Home(),
              '/detailpokemon': (context) => DetailPokemon(),
            },
            initialRoute: '/',
          );
        },
      ),
    );
    ;
  }
}
