
import 'package:flutter/material.dart';

import '../game/assets.dart';
import '../game/flappy_bird_game.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set a fixed size for the container to match the Wear OS watch screen size
    final double watchScreenWidth = MediaQuery.of(context).size.width;
    final double watchScreenHeight = MediaQuery.of(context).size.height;

    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Image.asset(
              Assets.message,
              // You can adjust the width and height of the message image if needed
              width: watchScreenWidth * 0.7,
              height: watchScreenHeight * 0.7,
            ),
          ),
        ),
      ),
    );
  }
}
