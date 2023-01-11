import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_application/style/appStyle.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppStyle.cardsColor[doc['color_id23']],
          borderRadius: BorderRadius.circular(8)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          doc["note_title23"],
          style: AppStyle.minTiltle,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          doc['note_creation_date'],
          style: AppStyle.dateTitle,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          doc['note_content23'],
          style: AppStyle.minContent,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    ),
  );
}
