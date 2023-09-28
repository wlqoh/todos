import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/cubit/to_do_cubit.dart';

class CreateNewTask extends StatelessWidget {
  const CreateNewTask({super.key});

  bool isFieldEmpty(BuildContext context) =>
      context.read<ToDoCubit>().state.controller.text == '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: context.read<ToDoCubit>().state.controller,
              decoration: InputDecoration(
                hintText: 'Добавить новую задачу',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ToDoCubit>().saveNewTask();
                    isFieldEmpty(context) ? {} : Navigator.of(context).pop();
                    context.read<ToDoCubit>().state.controller.clear();
                  },
                  child: const Text('Добавить'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<ToDoCubit>().state.controller.clear();
                  },
                  child: const Text('Отмена'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RenameTask extends StatelessWidget {
  final int index;
  const RenameTask({super.key, required this.index});

  bool isFieldEmpty(BuildContext context) =>
      context.read<ToDoCubit>().state.controller.text == '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: context.read<ToDoCubit>().state.controller,
              decoration: InputDecoration(
                hintText: 'Измените название',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ToDoCubit>().confirmRename(index);
                    isFieldEmpty(context) ? {} : Navigator.of(context).pop();
                    context.read<ToDoCubit>().state.controller.clear();
                  },
                  child: const Text('Изменить'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<ToDoCubit>().state.controller.clear();
                  },
                  child: const Text('Отмена'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}