import 'package:flutter/material.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = SplashController();

  @override
  void initState() {
    super.initState();
    // Inicia a lógica do controller assim que a tela é construída.
    _controller.initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- Logo ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.flip(
                  flipX: true,
                  child: const Icon(
                    Icons.front_hand_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.local_florist,
                  size: 60,
                  color: Colors.blueAccent,
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.front_hand_outlined,
                  size: 40,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}