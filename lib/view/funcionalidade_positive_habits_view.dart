import 'package:flutter/material.dart';

// Modelo simples para representar um hábito
class Habit {
  final String title;
  final IconData icon;
  bool isCompleted;
  int streak;

  Habit({
    required this.title,
    required this.icon,
    this.isCompleted = false,
    this.streak = 0,
  });
}

class FuncionalidadePositiveHabitsView extends StatefulWidget {
  const FuncionalidadePositiveHabitsView({super.key});

  @override
  State<FuncionalidadePositiveHabitsView> createState() =>
      _FuncionalidadePositiveHabitsViewState();
}

class _FuncionalidadePositiveHabitsViewState
    extends State<FuncionalidadePositiveHabitsView> {
  // Lista de hábitos de exemplo
  final List<Habit> _habits = [
    Habit(title: 'Dormir 8 horas', icon: Icons.bedtime_outlined, streak: 3),
    Habit(title: 'Beber 2L de água', icon: Icons.local_drink_outlined, streak: 5, isCompleted: true),
    Habit(title: 'Fazer uma caminhada de 30 min', icon: Icons.directions_walk_outlined, streak: 1),
    Habit(title: 'Ler por 15 minutos', icon: Icons.book_outlined, streak: 12, isCompleted: true),
    Habit(title: 'Meditar por 5 minutos', icon: Icons.self_improvement_outlined, streak: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio de Hábitos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _habits.length,
        itemBuilder: (context, index) {
          final habit = _habits[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12.0),
            child: CheckboxListTile(
              value: habit.isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  habit.isCompleted = value ?? false;
                  // Simula o aumento/diminuição da sequência
                  if (habit.isCompleted) {
                    habit.streak++;
                  } else {
                    // Evita que a sequência fique negativa
                    if (habit.streak > 0) habit.streak--;
                  }
                });
              },
              secondary: Icon(habit.icon, color: Theme.of(context).primaryColor),
              title: Text(habit.title, style: const TextStyle(fontSize: 16)),
              subtitle: Text(
                'Sequência: ${habit.streak} dias 🔥',
                style: TextStyle(
                  color: habit.streak > 0 ? Colors.orange.shade700 : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Marque os hábitos que você completou hoje!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}