import 'package:flutter/material.dart';

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

class PositiveHabitsController extends ChangeNotifier {
  // Lista de hábitos de exemplo
  final List<Habit> habits = [
    Habit(title: 'Dormir 8 horas', icon: Icons.bedtime_outlined, streak: 3),
    Habit(title: 'Beber 2L de água', icon: Icons.local_drink_outlined, streak: 5, isCompleted: true),
    Habit(title: 'Fazer uma caminhada de 30 min', icon: Icons.directions_walk_outlined, streak: 1),
    Habit(title: 'Ler por 15 minutos', icon: Icons.book_outlined, streak: 12, isCompleted: true),
    Habit(title: 'Meditar por 5 minutos', icon: Icons.self_improvement_outlined, streak: 0),
  ];

  void toggleHabitCompletion(Habit habit) {
    habit.isCompleted = !habit.isCompleted;

    // Simula o aumento/diminuição da sequência
    if (habit.isCompleted) {
      habit.streak++;
    } else {
      // Evita que a sequência fique negativa
      if (habit.streak > 0) {
        habit.streak--;
      }
    }
    notifyListeners();
  }
}