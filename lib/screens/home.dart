import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/cubit/to_do_cubit.dart';
import 'package:todo/widgets/to_do_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ToDoCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.createNewTask(context);
        },
        backgroundColor: Colors.yellow[200],
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text('TODO'),
        ),
      ),
      body: BlocBuilder<ToDoCubit, ToDoState>(
        builder: (context, state) {

          if (state.todoList.isEmpty) {
            return const Center(child: Text('Пусто'));
          }
          return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return ToDoTile(
                  index: index,
                  text: state.todoList[index][0],
                  isTaskCompleted: state.todoList[index][1],
                  deleteFunction: (_) => cubit.deleteTask(index),
                  onChanged: (value) => cubit.checkBoxChanged(index),
                );
              });
        },
      ),
    );
  }
}
