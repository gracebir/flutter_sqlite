import 'package:flutter/material.dart';
import 'package:flutter_sqlite/models/note_model.dart';
import 'package:flutter_sqlite/services/database_helper.dart';

class AddNote extends StatelessWidget {
  final Note? note;
  AddNote({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    final _title = TextEditingController();
    final _content = TextEditingController();
    if (note != null) {
      _title.text = note!.title;
      _content.text = note!.content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          note == null ? "ADD NOTE" : "EDIT NOTE",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "What I do think",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: _title,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Note title',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _content,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Content',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () async {
                    final title = _title.value.text;
                    final content = _content.value.text;
                    if (title.isEmpty || content.isEmpty) {
                      return null;
                    }

                    final Note model =
                        Note(title: title, content: content, id: note?.id);
                    if (note == null) {
                      await DatabaseHelper.addNote(model);
                    } else {
                      await DatabaseHelper.updateNote(model);
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      note == null ? "Save" : "Edit",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
