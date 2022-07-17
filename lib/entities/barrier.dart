import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flappy_bird_flutter/entities/entity.dart';
import 'package:flappy_bird_flutter/utils/global_vars.dart';

class Barrier extends Entity {
  double offset = Random().nextInt(GlobalVars.screenHeight ~/ 4).toDouble();
  double velocity = -2;

  Barrier() : super("pipe-green") {
    x = GlobalVars.screenWidth;
    y = offset;
  }

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: Transform.translate(
        offset: Offset(0.0, -GlobalVars.screenHeight / 4),
        child: Column(children: [
          Transform.rotate(
            angle: pi,
            child: sprites[0],
          ),
          SizedBox(height: GlobalVars.screenHeight / 4),
          sprites[0],
        ]),
      ),
    );
  }

  @override
  void move() {
    x += velocity;
  }
}
