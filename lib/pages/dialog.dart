import 'package:flutter/material.dart';
import 'package:grid_box/pages/buttoms.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback saved;
  VoidCallback cancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.saved,
      required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: "Nombre de la tarea", border: OutlineInputBorder()),
            ),
            //Buttoms
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyButtom(text: "Guardar", onPressed: saved),
                const SizedBox(width: 10),
                MyButtom(
                  text: "Cancelar",
                  onPressed: cancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
