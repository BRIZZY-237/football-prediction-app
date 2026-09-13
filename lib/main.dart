import 'package:flutter/material.dart';

void main() {
  runApp(const FootballPredictionApp());
}

class FootballPredictionApp extends StatelessWidget {
  const FootballPredictionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football Predictor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚽ Football Predictor'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.sports_soccer,
                size: 90,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              const Text(
                'Football Predictions',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Get match predictions, team insights, '
                'and upcoming football matches.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PredictionsPage(),
                    ),
                  );
                },
                child: const Text('View Predictions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PredictionsPage extends StatelessWidget {
  const PredictionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predictions'),
      ),
      body: const Center(
        child: Text(
          'Football Predictions Coming Soon',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
