import 'package:flutter/material.dart';
import 'package:flutter_sqlite/components/note_title.dart';
import 'package:flutter_sqlite/models/note_model.dart';
import 'package:flutter_sqlite/pages/add_note.dart';
import 'package:flutter_sqlite/services/database_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffF4F4F4),
      appBar: AppBar(
        title: const Text(
          "TODO APP",
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: FutureBuilder<List<Note>?>(
        future: DatabaseHelper.getAllNotes(),
        builder: (context, AsyncSnapshot<List<Note>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => NoteTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNote(
                                      note: snapshot.data![index],
                                    )));
                      },
                      title: snapshot.data![index].title,
                      content: snapshot.data![index].content));
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote()));
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
