import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/add_note.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffF4F4F4),
      appBar: AppBar(
        title: const Text(
          "TODO APP",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: const Center(
          child: Text(
        "No Todos",
        style: TextStyle(fontSize: 18),
      )),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNote()));
        },
        child: Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.blue.shade800),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
    );
  }
}
