import 'package:flutter/material.dart';

class MoodTrackerController extends ChangeNotifier {
  final _noteController = TextEditingController();
  TextEditingController get noteController => _noteController;

  String? _selectedMood;
  String? get selectedMood => _selectedMood;

  // Lista de humores disponíveis
  final List<Map<String, String>> moods = const [
    {'emoji': '😄', 'label': 'Feliz'},
    {'emoji': '🙂', 'label': 'Bem'},
    {'emoji': '😐', 'label': 'Normal'},
    {'emoji': '😟', 'label': 'Triste'},
    {'emoji': '😠', 'label': 'Irritado'},
  ];

  /// Atualiza o humor selecionado e notifica os ouvintes para reconstruir a UI.
  void selectMood(String emoji) {
    _selectedMood = emoji;
    notifyListeners(); // para notificar a UI sobre a mudança.
  }

  /// Simula o salvamento do registro e exibe um feedback.
  void saveMood(BuildContext context) {
    if (_selectedMood == null) {
      // Validação simples
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione um humor.'), backgroundColor: Colors.red),
      );
      return;
    }

    print('Humor salvo: $_selectedMood, Anotação: ${_noteController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Humor registrado com sucesso! (Simulação)'),
        backgroundColor: Colors.green,
      ),
    );
  }
}