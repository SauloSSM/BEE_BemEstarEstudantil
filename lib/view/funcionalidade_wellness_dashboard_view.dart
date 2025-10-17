import 'package:flutter/material.dart';

class FuncionalidadeWellnessDashboardView extends StatelessWidget {
  const FuncionalidadeWellnessDashboardView({super.key});

  // Dados de estatísticas de exemplo (para display)
  final List<Map<String, dynamic>> _stats = const [
    {
      'icon': Icons.sentiment_very_satisfied_outlined,
      'text': "Você registrou 'Feliz' como seu humor mais frequente esta semana.",
      'color': Colors.orangeAccent,
    },
    {
      'icon': Icons.self_improvement_outlined,
      'text': "Sua atividade de mindfulness mais realizada foi 'Meditação de 5 Minutos'.",
      'color': Colors.blueAccent,
    },
    {
      'icon': Icons.calendar_today_outlined,
      'text': "Você tende a se sentir mais calmo(a) nas sextas-feiras.",
      'color': Colors.green,
    },
    {
      'icon': Icons.trending_up_outlined,
      'text': "O número de anotações positivas aumentou 20% em relação à semana passada.",
      'color': Colors.purpleAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard de Bem-Estar'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _stats.length,
        itemBuilder: (context, index) {
          final stat = _stats[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(stat['icon'], color: stat['color'], size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      stat['text'],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}