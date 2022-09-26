import 'package:flutter/material.dart';
import 'package:grid_box/pages/dialog.dart';
import 'package:grid_box/pages/toDo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checkBox = false;
  final _controller = TextEditingController();

  //Lista de tareas
  List toDoList = [];

  //Cambia el estado del checkBox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //Guarda una nueva tarea
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  //Cancela el guardado de una tarea
  void cancelSavedTask() {
    _controller.clear();
    Navigator.of(context).pop();
  }

  //Crea una nueva Tarea
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
            controller: _controller,
            saved: saveNewTask,
            cancel: cancelSavedTask);
      },
    );
  }

  //Eliminar una tarea
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        title: const Center(
          child: Text(
            "To Do",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          createNewTask();
        },
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: ((p0) => deleteTask(index)));
        },
      ),
    );
  }
}
