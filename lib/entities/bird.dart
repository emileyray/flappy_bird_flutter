import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flappy_bird_flutter/entities/entity.dart';
import 'package:flappy_bird_flutter/utils/global_vars.dart';

class Bird extends Entity {
  bool isJumping = false;
  bool started = false;
  double acceleration = 0.2;
  double velocity = -6;
  double angle = 0;

  Bird() : super("bird") {
    x = GlobalVars.screenWidth / 2;
    y = GlobalVars.screenHeight / 2;
  }

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: Transform.rotate(
        angle: angle,
        child: sprites[0],
      ),
    );
  }

  jump() {
    isJumping = true;

    velocity = -6;
  }

  start() {
    started = true;
  }

  @override
  void move() {
    if (!started) return;

    velocity += acceleration;
    y += velocity;

    if (velocity > 1) {
      updateAngle(3.14 / 2, 1);
    } else if (velocity < -1) {
      updateAngle(-3.14 / 4, 4);
    } else {
      updateAngle(0, 1);
    }
  }

  updateAngle(double newAngle, int coef) {
    angle += (newAngle - angle) / (20 / coef);
  }
}
