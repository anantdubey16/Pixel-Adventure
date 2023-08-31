import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum PlayerState { idle, running }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  late final SpriteAnimation idleAnimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimation();
    return super.onLoad();
  }

  void _loadAllAnimation() {
    final image =
        game.images.fromCache('Main Characters/Ninja Frog/Idle (32x32).png');
    idleAnimation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 11,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
    
    animations = {PlayerState.idle: idleAnimation};
    //set current animation
    current = PlayerState.idle;
  }
}
