import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/core/colores.dart';
import 'package:flutter_application_2/widgets/boton_modo.dart';
import 'package:flutter_application_2/widgets/boton_tema.dart';
import 'package:flutter_application_2/widgets/logo.dart';
import 'package:flutter_application_2/models/tarea.dart';
import 'package:flutter_application_2/widgets/sin_tareas.dart';
import 'package:flutter_application_2/widgets/tarjeta_tarea.dart';
import 'package:flutter_application_2/routes/rutas.dart';
import 'package:flutter_application_2/screens/pagina_agregar_tarea.dart';

/// Pantalla principal de la aplicación.
///
/// Muestra la lista de tareas, filtros y opciones de configuración global.
class PaginaPrincipal extends StatefulWidget {
  /// Función para alternar el modo oscuro/claro.
  final Function(bool) alCambiarModo;

  /// Función para cambiar el color semilla del tema.
  final Function(int) alCambiarColor;

  /// El color actualmente seleccionado.
  final Colores colorActual;

  /// Crea la pantalla principal con los callbacks necesarios para el estado global.
  const PaginaPrincipal({
    super.key,
    required this.alCambiarModo,
    required this.alCambiarColor,
    required this.colorActual,
  });

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  Categoria? _filtroCategoria;
  // null es todos, true es Terminadas y false es Pendientes
  bool? _filtroEstado;

  final List<Tarea> _tareas = [];

  List<Tarea> get _tareasFiltradas {
    return _tareas.where((tarea) {
      if (_filtroCategoria != null && tarea.categoria != _filtroCategoria) {
        return false;
      }
      if (_filtroEstado != null && tarea.estaTerminada != _filtroEstado) {
        return false;
      }
      return true;
    }).toList();
  }

  void _agregarTarea(Tarea tarea) {
    setState(() {
      _tareas.add(tarea);
    });
  }

  void _actualizarTarea(Tarea tareaOriginal, Tarea tareaEditada) {
    final index = _tareas.indexOf(tareaOriginal);
    if (index != -1) {
      setState(() {
        _tareas[index] = tareaEditada;
      });
    }
  }

  void _eliminarTarea(Tarea tarea) {
    final int indice = _tareas.indexOf(tarea);

    setState(() {
      _tareas.remove(tarea);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Tarea eliminada'),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {
            setState(() {
              if (indice >= 0 && indice <= _tareas.length) {
                _tareas.insert(indice, tarea);
              } else {
                _tareas.add(tarea);
              }
            });
          },
        ),
      ),
    );
  }

  void _cambiarEstadoTarea(Tarea tarea) {
    setState(() {
      tarea.estaTerminada = !tarea.estaTerminada;
    });
  }

  void _reordenarTareas(int viejoIndice, int nuevoIndice) {
    setState(() {
      if (nuevoIndice > viejoIndice) {
        nuevoIndice -= 1;
      }
      final tarea = _tareas.removeAt(viejoIndice);
      _tareas.insert(nuevoIndice, tarea);
    });
  }

  Widget _construirFiltros() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.3),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<Categoria?>(
              value: _filtroCategoria,
              decoration: const InputDecoration(
                labelText: 'Categoría',
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: null, child: Text('Todas')),
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
              onChanged: (valor) {
                setState(() => _filtroCategoria = valor);
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: DropdownButtonFormField<bool?>(
              value: _filtroEstado,
              decoration: const InputDecoration(
                labelText: 'Estado',
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: null, child: Text('Todos')),
                DropdownMenuItem(value: false, child: Text('Pendientes')),
                DropdownMenuItem(value: true, child: Text('Terminadas')),
              ],
              onChanged: (valor) {
                setState(() => _filtroEstado = valor);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        actions: [
          BotonModo(cambiarModo: widget.alCambiarModo),
          BotonColor(
            cambiarColor: widget.alCambiarColor,
            colorElegido: widget.colorActual,
          ),
        ],
      ),
      body: _tareas.isEmpty
          ? const SinTareas()
          : Column(
              children: [
                _construirFiltros(),
                Expanded(
                  child: _tareasFiltradas.isEmpty
                      ? const Center(
                          child: Text("No hay tareas con estos filtros"),
                        )
                      : ReorderableListView.builder(
                          padding: const EdgeInsets.all(16.0),
                          itemCount: _tareasFiltradas.length,
                          onReorder: _reordenarTareas,
                          itemBuilder: (context, index) {
                            final tarea = _tareasFiltradas[index];
                            return Dismissible(
                              key: ObjectKey(tarea),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: Theme.of(context).colorScheme.error,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20.0),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              onDismissed: (direction) => _eliminarTarea(tarea),
                              child: TarjetaTarea(
                                tarea: tarea,
                                onCambiarEstado: () =>
                                    _cambiarEstadoTarea(tarea),
                                onEliminar: () => _eliminarTarea(tarea),
                                onEditar: () async {
                                  final tareaEditada = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaginaAgregarTarea(
                                        tareaParaEditar: tarea,
                                      ),
                                    ),
                                  );
                                  if (tareaEditada != null) {
                                    _actualizarTarea(tarea, tareaEditada);
                                  }
                                },
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nuevaTarea = await Navigator.pushNamed(
            context,
            Rutas.pagAgregarTarea,
          );
          if (nuevaTarea != null) {
            _agregarTarea(nuevaTarea as Tarea);
          }
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
