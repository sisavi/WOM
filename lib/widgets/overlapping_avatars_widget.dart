import 'package:flutter/material.dart';

class OverlappingAvatarsWidget extends StatelessWidget {
  final String pic =
      "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5ed53f23da1f770006140c3c%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D1567%26cropX2%3D3494%26cropY1%3D155%26cropY2%3D2083";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(
                    pic,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(
                    pic,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                  pic,
                ), // Provide your custom image
              ),
            ),
          ),
        ],
      ),
    );
  }
}
