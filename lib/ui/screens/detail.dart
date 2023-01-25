import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapi_fernando_avila_bloc/blocs/detail/detail_bloc.dart';
import 'package:pokeapi_fernando_avila_bloc/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/style/custom_styles.dart';

class DetailPokemon extends StatefulWidget {
  const DetailPokemon({Key? key}) : super(key: key);

  @override
  _DetailPokemonState createState() => _DetailPokemonState();
}

class _DetailPokemonState extends State<DetailPokemon> {
  PageController _scrollController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state.pokemon == null) {
          Navigator.pop(context);
        }
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(state.pokemon!.name!.toUpperCase(),
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary)),
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    _scrollController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  },
                  icon: Icon(Icons.arrow_back_ios,
                      color: Theme.of(context).colorScheme.onPrimary))
            ],
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  EstiloApp.colorwhite,
                  Theme.of(context).colorScheme.primary,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
              body(state),
            ],
          ),
        );
      },
    );
  }

  Widget body(PokemonState state) {
    var size = MediaQuery.of(context).size;
    List<Widget> children = [];
    for (var i = 0; i < state.pokemon!.types!.length; i++) {
      children.add(type(state, state.pokemon!.types![i].type!.url!));
    }
    children.insert(0, ability(state));
    children.insert(0, PrincipalInfo(state));
    return PageView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      children: children,
    );
  }

  Widget PrincipalInfo(PokemonState state) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            height: size.height * 0.4,
            child: SvgPicture.network(
              state.pokemon!.sprites!.other!.dreamWorld!.frontDefault!,
              width: MediaQuery.of(context).size.width,
            )),
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Theme.of(context).colorScheme.primary,
                    ],
                    stops: [0.0, 0.4],
                  ),
                ),
              ),
              Opacity(
                opacity: 1,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                    ),
                    margin: const EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      children: <Widget>[
                        Column(
                          children: List.generate(
                              state.pokemon!.types!.length,
                              (index) => literal(
                                  'Tipo',
                                  state.pokemon!.types![index].type!.name
                                      .toString(),
                                  context)),
                        ),
                        literal('Altura', state.pokemon!.height!.toString(),
                            context),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget ability(PokemonState state) {
    var bloc = context.read<DetailBloc>();
    bloc.add(DetailInitialEvent());
    print('Se cargo la habilidad');
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, statedetail) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Theme.of(context).colorScheme.primary,
              ],
              stops: [0.0, 0.4],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Habilidades',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary)),
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.pokemon!.abilities!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 2.0,
                                color: Theme.of(context).colorScheme.surface),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  state.pokemon!.abilities![index].ability!
                                      .name!,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    bloc.add(DetailShowAbilityEvent(
                                        url: state.pokemon!.abilities![index]
                                            .ability!.url));
                                    //_scaleDialog(state
                                    //    .pokemon!.abilities![index].ability!.name);
                                  },
                                  icon: Icon(Icons.visibility, size: 40)),
                            ),
                          ],
                        ),
                      );
                    }),
                statedetail.ability != null &&
                        statedetail.ability!.effectEntries != null
                    ? Column(
                        children: <Widget>[
                          Text('Efectos de entrada',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  statedetail.ability!.effectEntries!.length,
                              itemBuilder: (context, index) {
                                return Text(
                                    selectortextentry(statedetail
                                        .ability!.effectEntries![index]),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary));
                              }),
                        ],
                      )
                    : SizedBox(),
                statedetail.ability != null &&
                        statedetail.ability!.effectChanges != null
                    ? Column(
                        children: <Widget>[
                          Text('Efectos de Cambio',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                statedetail.ability!.effectChanges!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                  selectortextchange(statedetail
                                      .ability!.effectChanges![index]),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary));
                            },
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget type(PokemonState state, String url) {
    var bloc = context.read<DetailBloc>();
    bloc.add(DetailShowTypeEvent(url: url));
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, statedetail) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primary,
                Colors.white,
              ],
              stops: [0.1, 0.9],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Tipo de Pokemon ${statedetail.type!.name}',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary)),
                  ),
                ),
                Text('Doble Daño sobre:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary)),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisExtent: 60),
                  itemBuilder: (context, index) => Container(
                    child: typecontainer(statedetail
                        .type!.damageRelations!.doubleDamageTo![index].name!),
                  ),
                  itemCount:
                      statedetail.type!.damageRelations!.doubleDamageTo!.length,
                ),
                Text('Recibe Doble Daño de:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary)),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisExtent: 60),
                  itemBuilder: (context, index) => Container(
                    child: typecontainer(statedetail
                        .type!.damageRelations!.doubleDamageFrom![index].name!),
                  ),
                  itemCount: statedetail
                      .type!.damageRelations!.doubleDamageFrom!.length,
                ),
                Text('Medio Daño sobre:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary)),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisExtent: 60),
                  itemBuilder: (context, index) => Container(
                    child: typecontainer(statedetail
                        .type!.damageRelations!.halfDamageTo![index].name!),
                  ),
                  itemCount:
                      statedetail.type!.damageRelations!.halfDamageTo!.length,
                ),
                Text('Recibe medio daño de:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary)),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisExtent: 60),
                  itemBuilder: (context, index) => Container(
                    child: typecontainer(statedetail
                        .type!.damageRelations!.halfDamageFrom![index].name!),
                  ),
                  itemCount:
                      statedetail.type!.damageRelations!.halfDamageFrom!.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget literal(String title, String text, context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 2.0, color: Theme.of(context).colorScheme.surface),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
          ],
        ));
  }

  Widget typecontainer(String type) {
    var colors = design(type);
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.3,
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            colors.surface,
            colors.primary,
            colors.surface,
            colors.primary
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(10),
          boxShadow: kElevationToShadow[4],
          border: Border.all(color: colors.surface, width: 2)),
      child: Text(
        type,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: colors.onPrimary),
      ),
    );
  }
}

String selectortextentry(object) {
  try {
    if (object.language!.name == 'en') {
      return object.effect!;
    }
  } on Exception catch (e) {
    return '';
  }
  return '';
}

String selectortextchange(object) {
  try {
    for (var element in object.effectEntries) {
      if (element.language!.name == 'en') {
        return element.effect!;
      }
    }
  } on Exception catch (e) {
    return '';
  }
  return '';
}
