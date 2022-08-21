import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edbuddy/models/listModel.dart';
import 'package:intl/date_time_patterns.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class ListBox extends StatelessWidget {
  //TODO use dynamic text
  const ListBox({Key? key, required this.listing}) : super(key: key);
  final ListingModel listing;
  @override
  Widget build(BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(
        listing.timestamp.millisecondsSinceEpoch * 1000);
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMMMd');
    final String formatted = formatter.format(now);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      height: 300,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(7),
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(7)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(listing.profileIMG),
                  radius: 15,
                ),
                Flexible(
                  child: Text(
                    listing.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                formatted,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Image(
              height: 80,
              width: 150,
              image: NetworkImage(listing.imgURL),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              listing.desc,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.josefinSans(
                textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
