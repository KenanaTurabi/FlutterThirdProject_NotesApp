import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_application/style/appStyle.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  String date = DateTime.now().toString();
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add a new Note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Note Title'),
              style: AppStyle.minTiltle,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            SizedBox(
              height: 28,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Note content'),
              style: AppStyle.minContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes22").add({
            "note_title23": _titleController.text,
            "note_creation_date": date,
            "note_content23": _mainController.text,
            "color_id23": color_id
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print("Faild to Add a new Note coz of $error "));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
