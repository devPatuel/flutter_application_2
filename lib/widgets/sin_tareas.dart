import 'package:flutter/material.dart';
class SinTareas extends StatelessWidget{
  const SinTareas({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(
              Icons.task_alt,
              size: 48,
              color: Theme.of(context).colorScheme.secondary,
            ),
              const SizedBox(height: 16),
              Text(
                'No hay tareas',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize:18,
              ),
          )
        ],   
      )
    );
  }
} 