import 'package:flutter/material.dart';
import '../controller/self_reflection_controller.dart';
import '../main.dart';

class FuncionalidadeSelfReflectionView extends StatefulWidget {
  const FuncionalidadeSelfReflectionView({super.key});

  @override
  State<FuncionalidadeSelfReflectionView> createState() =>
      _FuncionalidadeSelfReflectionViewState();
}

class _FuncionalidadeSelfReflectionViewState
    extends State<FuncionalidadeSelfReflectionView> {
  final controller = g<SelfReflectionController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    g.resetLazySingleton<SelfReflectionController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas de Reflexão'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
        itemCount: controller.prompts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.prompts[index],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.controllers[index],
                    decoration: const InputDecoration(
                      hintText: 'Sua resposta aqui...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
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