import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_application/style/appStyle.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id23'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              widget.doc["note_title23"],
              style: AppStyle.minTiltle,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.doc['note_creation_date'],
              style: AppStyle.dateTitle,
            ),
            SizedBox(
              height: 28,
            ),
            Text(
              widget.doc['note_content23'],
              style: AppStyle.minContent,
              //overflow: TextOverflow.ellipsis,
            )
          ]),
        ),
      ),
    );
  }
}
