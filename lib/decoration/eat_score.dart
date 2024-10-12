import 'package:bonfire/bonfire.dart';
import 'package:pacman/main.dart';
import 'package:pacman/util/util_spritesheet.dart';

class EatScore extends GameDecoration with Movement, HandleForces {
  EatScore({
    required super.position,
  }) : super.withSprite(
          size: Vector2.all(Game.tileSize),
          sprite: UtilSpriteSheet.score100,
          renderAboveComponents: true,
        ) {
    speed = 140;
  }

  @override
  void update(double dt) {
    if (isStopped() && !isRemoving) {
      removeFromParent();
    }
    super.update(dt);
  }

  @override
  void onMount() {
    add(MoveByEffect(Vector2(0, -20), EffectController(duration: 1)));
    super.onMount();
  }
}
