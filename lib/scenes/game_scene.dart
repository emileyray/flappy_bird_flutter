import 'dart:async';

import 'package:flappy_bird_flutter/entities/barrier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bird_flutter/entities/bird.dart';
import 'package:flappy_bird_flutter/scenes/app_scene.dart';
import 'package:flappy_bird_flutter/utils/global_vars.dart';

class GameScene extends AppScene {
  final Bird _bird = Bird();
  List<Barrier> barriers = [];
  late Timer timer;

  GameScene() {
    Timer.periodic(
      const Duration(milliseconds: 2500),
      (Timer t) {
        barriers.add(Barrier());
      },
    );
  }

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _bird.build(),
        ...(barriers.map((e) => e.build()).toList()),
        GestureDetector(
          onTap: onJump,
        ),
      ],
    );
  }

  @override
  void update() {
    _bird.update();
    for (var element in barriers) {
      element.update();
    }
  }

  void onJump() {
    _bird.start();
    _bird.jump();
  }
}
