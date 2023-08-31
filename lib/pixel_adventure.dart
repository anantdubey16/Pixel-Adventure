import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:pixel_adventure/levels/level.dart';

class PixelAdventure extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF211f30);
  late final CameraComponent cam;
  final world = Level();
  @override
  FutureOr<void> onLoad() async {
    //load all images into cache
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(
        world: world, width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;
    add(Level());
    addAll([cam, world]);

    return super.onLoad();
  }
}
