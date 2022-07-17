import 'dart:math';

import 'package:flutter/material.dart';

abstract class Entity {
  double x = 0;
  double y = 0;
  final String spriteName;
  bool visible = true;
  List sprites = [];
  int currentSprite = 0;
  int currentTick = 0;
  List<Point> collider = [];
  bool colliderVisible = false;

  Entity(this.spriteName) {
    for (var i = 0; i < 4; i++) {
      sprites.add(Image.asset(
        "assets/$spriteName$i.png",
        scale: 0.75,
      ));
    }
  }
  void _animate() {
    currentTick++;
    if (currentTick > 15) {
      currentSprite++;
      currentTick = 0;
    }
    if (currentSprite > 3) {
      currentSprite = 0;
    }
  }

  void update() {
    _animate();
    move();
  }

  void move();

  Widget build();
}