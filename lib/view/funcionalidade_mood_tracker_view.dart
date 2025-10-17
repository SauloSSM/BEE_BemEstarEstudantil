import 'package:flutter/material.dart';
import '../controller/mood_tracker_controller.dart';
import '../main.dart'; 

class FuncionalidadeMoodTrackerView extends StatefulWidget {
  const FuncionalidadeMoodTrackerView({super.key});

  @override
  State<FuncionalidadeMoodTrackerView> createState() =>
      _FuncionalidadeMoodTrackerViewState();
}

class _FuncionalidadeMoodTrackerViewState
    extends State<FuncionalidadeMoodTrackerView> {
  final controller = g<MoodTrackerController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.removeListener(() {});
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
              children: controller.moods.map((mood) {
                final isSelected = controller.selectedMood == mood['emoji'];
                return GestureDetector(
                  onTap: () => controller.selectMood(mood['emoji']!),
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
              controller: controller.noteController,
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
              onPressed: () => controller.saveMood(context),
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