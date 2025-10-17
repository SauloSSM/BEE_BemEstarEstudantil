import 'package:flutter/material.dart';
import 'funcionalidade_meditation_timer_view.dart';

class FuncionalidadeDailyMindfulnessView extends StatelessWidget {
  const FuncionalidadeDailyMindfulnessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atenção Diária'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seção de Respiração
            _buildSectionTitle(context, 'Exercício de Respiração'),
            _buildBreathingCard(context),
            const SizedBox(height: 24),

            // Seção de Meditações Curtas
            _buildSectionTitle(context, 'Meditações Curtas'),
            _buildMeditationCard(
              icon: Icons.timer_outlined,
              title: 'Meditação de 5 Minutos',
              subtitle: 'Uma pausa rápida para re-centralizar.',
              onTap: () => _navigateToTimer(context, 'Meditação de 5 Minutos'),
            ),
            const SizedBox(height: 12),
            _buildMeditationCard(
              icon: Icons.self_improvement_outlined,
              title: 'Foco no Presente',
              subtitle: 'Conecte-se com o agora.',
              onTap: () => _showObservationDialog(context),
            ),
            const SizedBox(height: 24),

            // Seção de Áudios de Relaxamento
            _buildSectionTitle(context, 'Áudios de Relaxamento'),
            _buildRelaxationAudioSection(context),
          ],
        ),
      ),
    );
  }

  // Widget para os títulos das seções
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  // Card para o exercício de respiração
  Widget _buildBreathingCard(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const Icon(Icons.air, size: 40, color: Colors.blueAccent),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Respiração Guiada', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text('Inspire por 4s, segure por 7s, expire por 8s.', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card para os itens de meditação
  Widget _buildMeditationCard({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.play_circle_outline),
        onTap: onTap,
      ),
    );
  }

  // Seção para os áudios de relaxamento
  Widget _buildRelaxationAudioSection(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: Text(
            '// TODO: A lista de áudios e o player serão implementados aqui.',
            style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // Navega para a tela do cronômetro
  void _navigateToTimer(BuildContext context, String title) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FuncionalidadeMeditationTimerView(
          meditationTitle: title,
        ),
      ),
    );
  }

  // Exibe um AlertDialog para o usuário registrar suas observações
  void _showObservationDialog(BuildContext context) {
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Observação do Momento'),
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
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Fecha o diálogo
              },
            ),
            ElevatedButton(
              child: const Text('Registrar'),
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
    ).then((_) => textController.dispose()); // limpa o controller
  }
}