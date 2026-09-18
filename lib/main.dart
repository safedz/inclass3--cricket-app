import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MiniCricketApp());
}

class MiniCricketApp extends StatelessWidget {
  const MiniCricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CricketGamePage(),
    );
  }
}

class CricketGamePage extends StatefulWidget {
  const CricketGamePage({super.key});

  @override
  State<CricketGamePage> createState() => _CricketGamePageState();
}

class _CricketGamePageState extends State<CricketGamePage> {
  int runs = 0;
  int balls = 6;
  String lastOutcome = '';

  void playBall() {
    if (balls > 0) {
      final random = Random();
      int currentRuns = random.nextInt(7);

      setState(() {
        runs += currentRuns;
        balls--;
        lastOutcome = currentRuns == 0 ? 'No Runs' : '$currentRuns Runs';
      });
    }
  }

  void resetGame() {
    setState(() {
      runs = 0;
      balls = 6;
      lastOutcome = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        title: const Text('Mini Cricket'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/bat.png', width: 120, height: 120),
                Image.asset('assets/ball.png', width: 120, height: 120),
              ],
            ),
            const SizedBox(height: 30),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Runs', style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text('$runs', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    const Text('Balls', style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text('$balls', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),


            Text(
              lastOutcome,
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),


            if (balls > 0)
              ElevatedButton(
                onPressed: playBall,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: const Text('Bat', style: TextStyle(fontSize: 18)),
              )
            else
              ElevatedButton(
                onPressed: resetGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: const Text('Restart', style: TextStyle(fontSize: 18)),
              ),
          ],
        ),
      ),
    );
  }
}