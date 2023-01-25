import 'package:flutter/material.dart';
import 'package:pokeapi_fernando_avila_bloc/models/pokemon_model.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/style/custom_styles.dart';

class Statbar extends StatelessWidget {
  Statbar({
    Key? key,
    required this.stat,
    required this.statsupdated,
    required this.statfirst,
  }) : super(key: key);
  final Stats stat;
  final Stat statfirst;
  final Stat statsupdated;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: EstiloApp.colorwhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: kElevationToShadow[3]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  titles(stat),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )),
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  child: CustomPaint(
                    painter: CustomBarPainter(
                        initial: porcentage(0),
                        finish: porcentage(statfirst.baseStat!),
                        color: EstiloApp.primaryblue),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  child: CustomPaint(
                    painter: CustomBarPainter(
                        initial: porcentage(statfirst.baseStat!),
                        finish: porcentage(statsupdated.baseStat!),
                        color: statfirst.baseStat! > statsupdated.baseStat!
                            ? EstiloApp.primaryred
                            : EstiloApp.primarygreen),
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 5,
                    child: Text(statsupdated.baseStat!.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: statfirst.baseStat! > statsupdated.baseStat!
                                ? EstiloApp.primaryred
                                : EstiloApp.primarygreen)))
              ],
            ),
          )
        ],
      ),
    );
  }
}

String titles(Stats stat) {
  switch (stat) {
    case Stats.hp:
      return 'SALUD';
    case Stats.attack:
      return 'ATAQUE';
    case Stats.defense:
      return 'DEFENSA';
    case Stats.speed:
      return 'VELOCIDAD';
  }
}

//function recibe number max, value and return a double porcentage 0.0 - 1.0
//function recibe value and return a double porcentage 0.0 - 1.0 with max 255
double porcentage(int value) {
  return value / 250;
}

enum Stats {
  hp,
  attack,
  defense,
  speed,
}

class CustomBarPainter extends CustomPainter {
  final double initial;
  final double finish;
  final Color color;

  CustomBarPainter(
      {required this.initial, required this.finish, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1;
    final path = Path();
    path.moveTo(size.width * initial, 0);
    //path.lineTo(size.width * initial, 0);
    path.lineTo(size.width * finish, 0);
    path.lineTo(size.width * finish, size.height);
    path.lineTo(size.width * initial, size.height);
    path.lineTo(size.width * initial, 0);

    ///path.lineTo(size.width * finish, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomBarPainter oldDelegate) => true;
}
