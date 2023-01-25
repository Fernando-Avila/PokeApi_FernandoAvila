import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapi_fernando_avila_bloc/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/style/custom_styles.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/widgets/layouts/buttonhabilitie.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/widgets/layouts/buttonpokemon.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/widgets/layouts/designs.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/widgets/layouts/statbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final AnimationController _animatedcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      reverseDuration: Duration(milliseconds: 300));
  late final AnimationController _abilityanimatedcontroller =
      AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 300),
  );
  late final Animation _animationmove = Tween<double>(begin: 0.7, end: 1)
      .animate(CurvedAnimation(
          curve: const Interval(0, 1, curve: Curves.ease),
          reverseCurve: const Interval(0.5, 1, curve: Curves.bounceIn),
          parent: _animatedcontroller));
  late final Animation _animationminopacity = Tween<double>(begin: 0.4, end: 1)
      .animate(CurvedAnimation(
          curve: const Interval(0.3, 1, curve: Curves.ease),
          reverseCurve: Interval(0.6, 1, curve: Curves.ease),
          parent: _animatedcontroller));
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<PokemonBloc>(context);
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state.pokemon == null) {
          _animatedcontroller.repeat(reverse: true);
        } else {
          _animatedcontroller.stop();
        }
        return WillPopScope(
          onWillPop: () async {
            if (state.pagination!.previous != '') {
              context
                  .read<PokemonBloc>()
                  .add(PokemonChangePageEvent(direction: directions.previous));
              return false;
            } else {
              return true;
            }
          },
          child: Scaffold(
              body: CustomScrollView(
            controller: bloc.scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Text(
                  state.pokemon?.name ?? 'Selecciona tu pokemon',
                ),
                centerTitle: true,
                floating: true,
                snap: true,
                pinned: true,
                stretch: true,
                expandedHeight: height * 0.15,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground
                  ],
                  background: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 100,
                        width: size.width,
                        child:
                            ButtonsPokemons(results: state.pagination!.results),
                      )
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.surface
                        ])),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Habilidades',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.18,
                          child: ButonsAbilities(
                              animatedcontroller: _abilityanimatedcontroller),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                              color: EstiloApp.colorwhite.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 5)
                              ]),
                          height: height * 0.12,
                          width: size.width,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Text(
                                    InfoAbilities(state.abilities![index]),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              itemCount: state.abilities!.length),
                        ),
                        Dvdh(),
                        InkWell(
                          onTap: () async {
                            state.pokemon != null
                                ? Navigator.pushNamed(context, '/detailpokemon')
                                : null;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                boxShadow: kElevationToShadow[12],
                                gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.9),
                                      Theme.of(context)
                                          .colorScheme
                                          .surface
                                          .withOpacity(0.9),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(30)),
                            height: height * 0.2,
                            width: size.width * 0.8,
                            child: state.pokemon == null
                                ? AnimatedBuilder(
                                    animation: _animatedcontroller,
                                    builder: (context, child) => Transform(
                                      //  scale: _animationmove.value,
                                      transform: Matrix4.identity()
                                          .scaled(_animationmove.value),
                                      child: Opacity(
                                          opacity: _animationminopacity.value,
                                          child: child),
                                    ),
                                    child: Center(
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/pokeball.png')),
                                    ),
                                  )
                                : SvgPicture.network(
                                    state.pokemon!.sprites!.other!.dreamWorld!
                                        .frontDefault!,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                          ),
                        ),
                        Dvdh(),
                        SizedBox(
                            height: height * 0.22,
                            child: StatusBars(
                                stats: state.stats, newstats: state.newstats))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}

class ButtonsPokemons extends StatelessWidget {
  const ButtonsPokemons({
    Key? key,
    required this.results,
  }) : super(key: key);
  final List results;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 60),
        itemCount: results.length,
        itemBuilder: (BuildContext context, int index) {
          return Buttonpokemon(
            pokemon: results[index],
          );
        },
      ),
    );
  }
}

class ButonsAbilities extends StatelessWidget {
  const ButonsAbilities({
    Key? key,
    required AnimationController animatedcontroller,
  })  : _animatedcontroller = animatedcontroller,
        super(key: key);

  final AnimationController _animatedcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 55),
        itemCount: Abilities.values.length,
        itemBuilder: (BuildContext context, int index) {
          return buttonability(
            animationController: _animatedcontroller,
            ability: Abilities.values[index],
          );
        },
      ),
    );
  }
}

class StatusBars extends StatelessWidget {
  var newstats;

  var stats;

  StatusBars({
    Key? key,
    required this.stats,
    required this.newstats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, mainAxisExtent: 40),
      itemCount: Stats.values.length,
      itemBuilder: (BuildContext context, int index) {
        return Statbar(
          statfirst: stats[index],
          statsupdated: newstats[index],
          stat: Stats.values[index],
        );
      },
    );
  }
}

String InfoAbilities(Abilities abiliti) {
  var map = {
    Abilities.intimidation:
        'Intimidación: Ataque +10, velocidad+15, salud-5, defensa-10',
    Abilities.toxic: 'Tóxico: Defensa+10, velocidad-3, salud-15',
    Abilities.regeneration:
        'Regeneración: Ataque-20, velocidad+5, salud-10, defensa+5',
    Abilities.immunity:
        'Inmunidad: Ataque-20, velocidad-10, salud+10, defensa+20',
    Abilities.impassive:
        'Impasible: Ataque -3, velocidad+30, salud-15, defensa-10',
    Abilities.power: 'Potencía: Ataque +15, velocidad+15, salud-20, defensa-10',
  };
  return map[abiliti] ?? '';
}
