import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi_fernando_avila_bloc/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/screens/home.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/style/custom_styles.dart';

class buttonability extends StatelessWidget with ChangeNotifier {
  buttonability(
      {super.key, required this.animationController, required this.ability});
  final AnimationController animationController;
  late final Animation _animation = Tween<double>(begin: 0.9, end: 1).animate(
    CurvedAnimation(
      curve: Curves.bounceOut,
      parent: animationController,
      reverseCurve: Curves.bounceIn,
    ),
  );
  late final Animation _animationmove = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      curve: Curves.bounceOut,
      parent: animationController,
      reverseCurve: Curves.bounceIn,
    ),
  );
  final Abilities ability;
  //final List abilitiestate;
  @override
  Widget build(BuildContext context) {
    var state = context.read<PokemonBloc>().state;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.scale(
          scale: state.abilities!.contains(ability) ? _animation.value : 0.9,
          //scale: _animationslide.value,
          child: state.pokemon != null
              ? child
              : Transform.translate(
                  offset: Offset(_animationmove.value * 15, 0), child: child)),
      child: Tooltip(
        message: InfoAbilities(ability),
        child: InkWell(
          onTap: () {
            context.read<PokemonBloc>().add(PokemonSelectHabilityEvent(
                  ability: ability,
                ));
            animationController.forward().whenComplete(() {
              animationController.reverse();
            });
          },
          child: Stack(
            children: [
              Opacity(
                opacity: _animation.value,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    gradient: _design(ability).gradient,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: kElevationToShadow[4],
                  ),
                ),
              ),
              Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                  child: AutoSizeText(
                    _design(ability).text,
                    style: TextStyle(
                        fontSize: 18,
                        color: EstiloApp.colorwhite,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  )),
              state.abilities!.contains(ability)
                  ? Positioned(
                      child: Icon(Icons.check, color: EstiloApp.colorwhite),
                      right: 0)
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

designabilities _design(Abilities ability) {
  var map = {
    Abilities.intimidation: designabilities(
        text: 'INTIMIDACION',
        gradient: const LinearGradient(colors: [
          //color ebd656
          Color(0xFF80dff3),
          Color(0xFFfc644c)
        ])),
    Abilities.immunity: designabilities(
        text: 'INMUNIDAD',
        gradient: const LinearGradient(
            colors: [Color(0xFF2cb9c2), Color(0xFF8faedc)])),
    Abilities.power: designabilities(
        text: 'POTENCIA',
        gradient: const LinearGradient(
            colors: [Color(0xFFff8255), Color(0xFFffc94f)])),
    Abilities.regeneration: designabilities(
        text: 'REGENERACIÓN',
        gradient: const LinearGradient(
            colors: [Color(0xFF8a97cc), Color(0xFFf49778)])),
    Abilities.impassive: designabilities(
        text: 'IMPASIBLE',
        gradient: const LinearGradient(
            colors: [Color(0xFFd7df72), Color(0xFF9dc880)])),
    Abilities.toxic: designabilities(
        text: 'TOXICO',
        gradient: const LinearGradient(
            colors: [Color(0xFFee8b66), Color(0xFFf6a353)])),
  };
  return map[ability] ??
      designabilities(
          text: 'TOXICO',
          gradient: const LinearGradient(
              colors: [Color(0xFFee8b66), Color(0xFFf6a353)]));
}

class designabilities {
  String text;
  LinearGradient gradient;
  designabilities({required this.text, required this.gradient});
}
