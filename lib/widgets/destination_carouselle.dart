import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/providers/destination_provider.dart';

import 'destination_item.dart';
class DestinationCarouselle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    List<Destination> destinationsList = Provider.of<Destination>(context).destinations; 
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0, horizontal: 15),
      child: Container(
        child: SizedBox(
          height: deviceSize.height / 2,
          child: Container(
            color: HexColor("#F8F8F8"),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Which is your next destination?",
                        style: TextStyle(
                            fontFamily: "SFPro",
                            fontSize: 16,
                            color: HexColor("#262628"),
                            fontWeight: FontWeight.w600),
                      ),
                      Text("See all", style: TextStyle(
                            fontFamily: "SFPro",
                            fontSize: 16,
                            color: Theme.of(context).buttonColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: destinationsList.length,
                      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                          value: destinationsList[i], child: DestinationItem())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}