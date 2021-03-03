import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RecommendationBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var devSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Where did you eat last evening?",
            style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Share your experience with the others!",
            style: TextStyle(color: HexColor("#C7CCD0"), fontFamily: "Raleway"),
          ),
          SizedBox(
            height: 10,
          ),
          DottedBorder(
            dashPattern: [5],
            color: HexColor("#C7CCD0"),
            child: SizedBox(
              height: devSize.height / 9,
              width: devSize.width - 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.add_circled,
                    size: 46,
                    color: HexColor("#C7CCD0"),
                  ),
                  Text(
                    "Add recommendations",
                    style: TextStyle(
                        fontFamily: "Raleway", color: HexColor("#C7CCD0")),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
