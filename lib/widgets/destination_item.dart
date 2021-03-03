import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/providers/destination_provider.dart';

class DestinationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Destination destination = Provider.of<Destination>(context);
    var deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      width: deviceSize.width / 2.3,
      height: deviceSize.height / 2.5,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(destination.pictureUrl),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  destination.city,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "GTSuper",
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                ),
                Text("${destination.restaurantsCount.toInt()} restaurants", style: TextStyle(fontSize: 12, fontFamily: "SFPro", color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
