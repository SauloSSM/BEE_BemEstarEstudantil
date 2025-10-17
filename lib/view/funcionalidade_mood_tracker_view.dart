import 'package:flutter/material.dart';

class FuncionalidadeMoodTrackerView extends StatefulWidget {
  const FuncionalidadeMoodTrackerView({super.key});

  @override
  State<FuncionalidadeMoodTrackerView> createState() =>
      _FuncionalidadeMoodTrackerViewState();
}

class _FuncionalidadeMoodTrackerViewState
    extends State<FuncionalidadeMoodTrackerView> {
  final _noteController = TextEditingController();
  String? _selectedMood;

  // Lista de humores disponíveis
  final List<Map<String, String>> _moods = [
    {'emoji': '😄', 'label': 'Feliz'},
    {'emoji': '🙂', 'label': 'Bem'},
    {'emoji': '😐', 'label': 'Normal'},
    {'emoji': '😟', 'label': 'Triste'},
    {'emoji': '😠', 'label': 'Irritado'},
  ];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Simples formatação de data sem pacotes externos
    final now = DateTime.now();
    final formattedDate = "${now.day}/${now.month}/${now.year}";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rastreador de Humor'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título e Data
            Text(
              'Como você está se sentindo hoje?',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              formattedDate,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Seleção de Humor
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _moods.map((mood) {
                final isSelected = _selectedMood == mood['emoji'];
                return GestureDetector(
                  onTap: () => setState(() => _selectedMood = mood['emoji']),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue.shade100 : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      mood['emoji']!,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),

            // Campo de Anotação
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Anotação do dia',
                hintText: 'O que está em sua mente?',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 24),

            // Botão de Salvar
            ElevatedButton(
              onPressed: () {
                // Simulação de salvamento
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Humor registrado com sucesso! (Simulação)'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Salvar Registro', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}