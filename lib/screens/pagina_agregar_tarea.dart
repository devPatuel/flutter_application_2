import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/tarea.dart';
import 'package:flutter_application_2/widgets/logo.dart';

/// Pantalla que permite crear una nueva tarea o editar una existente.
class PaginaAgregarTarea extends StatefulWidget {
  /// Crea una instancia de [PaginaAgregarTarea].
  ///
  /// Si [tareaParaEditar] se proporciona, los campos se prellenarán con sus datos.
  const PaginaAgregarTarea({super.key, this.tareaParaEditar});

  /// Tarea objeto de edición. Si es `null`, se asume creación.
  final Tarea? tareaParaEditar;

  @override
  _PaginaAgregarTareaState createState() => _PaginaAgregarTareaState();
}

class _PaginaAgregarTareaState extends State<PaginaAgregarTarea> {
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();
  Categoria _categoriaSeleccionada = Categoria.otro;

  @override
  void initState() {
    super.initState();
    if (widget.tareaParaEditar != null) {
      _titulo.text = widget.tareaParaEditar!.titulo;
      _descripcion.text = widget.tareaParaEditar!.descripcion;
      _categoriaSeleccionada = widget.tareaParaEditar!.categoria;
    }
  }

  @override
  void dispose() {
    _titulo.dispose();
    _descripcion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _titulo,
              decoration: InputDecoration(
                labelText: 'Título',
                prefixIcon: Icon(
                  Icons.task_alt,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onSurfaceVariant,
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descripcion,
              decoration: InputDecoration(
                labelText: 'Descripción',
                prefixIcon: Icon(
                  Icons.task_alt,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onSurfaceVariant,
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Categoria>(
              value: _categoriaSeleccionada,
              decoration: InputDecoration(
                labelText: 'Categoría',
                prefixIcon: Icon(
                  Icons.category_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onSurfaceVariant,
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: Categoria.personal,
                  child: Text('Personal'),
                ),
                DropdownMenuItem(
                  value: Categoria.trabajo,
                  child: Text('Trabajo'),
                ),
                DropdownMenuItem(value: Categoria.otro, child: Text('Otro')),
              ],
              onChanged: (value) => setState(() {
                _categoriaSeleccionada = value ?? Categoria.personal;
              }),
            ),
            const SizedBox(height: 20),
            Center(
              child: (ElevatedButton.icon(
                onPressed: () {
                  if (_titulo.text.isNotEmpty) {
                    Navigator.pop(
                      context,
                      Tarea(
                        titulo: _titulo.text,
                        descripcion: _descripcion.text,
                        estaTerminada: false,
                        categoria: _categoriaSeleccionada,
                      ),
                    );
                  } else {
                    Navigator.pop(context, null);
                  }
                },
                label: Text(
                  widget.tareaParaEditar != null
                      ? 'Guardar cambios'
                      : 'Agregar tarea',
                ),
                icon: Icon(
                  widget.tareaParaEditar != null ? Icons.save : Icons.add_task,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
