import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/screens/cubit/to_do_cubit.dart';

class ToDoTile extends StatelessWidget {
  final int index;
  final String text;
  Function(bool?)? onChanged;
  final bool isTaskCompleted;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.index,
    required this.text,
    required this.isTaskCompleted,
    required this.deleteFunction,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11, top: 11),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              borderRadius: BorderRadius.circular(12),
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isTaskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      decoration: isTaskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                  onTap: () {
                    context.read<ToDoCubit>().renameTask(context, index);
                  },
                  child: const Text('Изм.'))
            ],
          ),
        ),
      ),
    );
  }
}