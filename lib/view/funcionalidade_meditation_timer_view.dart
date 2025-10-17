import 'dart:async';
import 'package:flutter/material.dart';

class FuncionalidadeMeditationTimerView extends StatefulWidget {
  final Duration duration;
  final String meditationTitle;

  const FuncionalidadeMeditationTimerView({
    super.key,
    this.duration = const Duration(minutes: 5),
    required this.meditationTitle,
  });

  @override
  State<FuncionalidadeMeditationTimerView> createState() =>
      _FuncionalidadeMeditationTimerViewState();
}

class _FuncionalidadeMeditationTimerViewState
    extends State<FuncionalidadeMeditationTimerView> {
  Timer? _timer;
  late Duration _currentDuration;

  @override
  void initState() {
    super.initState();
    _currentDuration = widget.duration;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;

      if (_currentDuration.inSeconds <= 0) {
        _timer?.cancel();
        // Ao finalizar, mostra o diálogo de observação e depois fecha a tela do timer
        _showObservationDialog(context).then((_) {
          if (mounted) {
            Navigator.of(context).pop();
          }
        });
      } else {
        setState(() {
          _currentDuration = Duration(seconds: _currentDuration.inSeconds - 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meditationTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatDuration(_currentDuration),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 20),
            const Text(
              'Respire fundo e relaxe.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Exibe um AlertDialog para o usuário registrar suas observações
  Future<void> _showObservationDialog(BuildContext context) async {
    final textController = TextEditingController();

    await showDialog(
      context: context,
      barrierDismissible: false, // Impede que o diálogo feche ao tocar fora
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Fim da Meditação'),
          content: TextField(
            controller: textController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Descreva o que você vê ao seu redor...',
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Registrar Observação'),
              onPressed: () {
                // Simulação de registro
                print('Observação registrada: ${textController.text}');
                Navigator.of(dialogContext).pop(); // Fecha o diálogo

                // Feedback para o usuário com um SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Observação registrada!')),
                );
              },
            ),
          ],
        );
      },
    );
    textController.dispose(); // limpa o controller
  }
}