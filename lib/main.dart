import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird_01/screens/game_over_screen.dart';
import 'package:flappy_bird_01/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:wearable_rotary/wearable_rotary.dart';

import 'components/bird.dart';
import 'game/flappy_bird_game.dart';

void main() {
  runApp(const FlappyBirdApp());
}

class FlappyBirdApp extends StatefulWidget {
  const FlappyBirdApp({super.key});

  @override
  _FlappyBirdAppState createState() => _FlappyBirdAppState();
}

class _FlappyBirdAppState extends State<FlappyBirdApp> {
  late Bird bird;
  late StreamSubscription<RotaryEvent> rotarySubscription;
  late FlappyBirdGame game;

  @override
  void initState() {
    super.initState();
    game = FlappyBirdGame();
    rotarySubscription =
    rotaryEvents.listen((RotaryEvent event) {
      if (event.direction == RotaryDirection.clockwise) {
       bird.fly();
      } else if (event.direction == RotaryDirection.counterClockwise) {
        bird.fly();
        // Do something.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    );
  }

  @override
  void dispose() {
    rotarySubscription.cancel();
    super.dispose();
  }
}
