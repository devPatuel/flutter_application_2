import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/tarea.dart';

class TarjetaTarea extends StatelessWidget {
  const TarjetaTarea({
    super.key,
    required this.tarea,
    required this.onEliminar,
    required this.onCambiarEstado,
    required this.onEditar,
  });

  final Tarea tarea;
  final VoidCallback onEliminar;
  final VoidCallback onCambiarEstado;
  final VoidCallback onEditar;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: ListTile(
        leading: AnimatedSwitcher(
          duration: Duration(milliseconds: 250),
          child: Checkbox(
            key: ValueKey<bool>(tarea.estaTerminada),
            value: tarea
                .estaTerminada,
            onChanged: (_) => onCambiarEstado(),
            activeColor: Theme.of(context).colorScheme.secondary,
            checkColor: Theme.of(context).colorScheme.onSurfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(),
            ),
          ),
        ),
        title: Row(
          children: [
            Icon(
              Icons.task,
              color: tarea.estaTerminada
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                tarea.titulo,
                style: TextStyle(
                  decoration: tarea.estaTerminada
                      ? TextDecoration.lineThrough
                      : null,
                  color: tarea.estaTerminada            
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.tertiary,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (tarea.descripcion.isNotEmpty)
              Row(
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      tarea.descripcion,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  Icons.label_outline,
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  '${tarea.categoria.name[0].toUpperCase()}${tarea.categoria.name.substring(1)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!tarea.estaTerminada)
              IconButton(
                onPressed: onEditar,
                icon: Icon(Icons.edit, color:Theme.of(context).colorScheme.secondary),
              ),
            IconButton(
              onPressed: onEliminar,
              icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
            ),
          ],
        ),
      ),
    );
  }
}
