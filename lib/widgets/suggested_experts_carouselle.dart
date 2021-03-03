import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/providers/authentication_provider.dart';
import 'package:world_of_mouth/providers/user_provider.dart';
import 'package:world_of_mouth/widgets/carouselle_item.dart';

class SuggestedExpertsCarouselle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final userId = Provider.of<AuthenticationProvider>(context).userId;
    final userData = Provider.of<UserProvider>(context);
    final usersList = userData.suggestedExperts(userId);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Container(
        child: SizedBox(
          height: deviceSize.height / 3,
          child: Container(
            color: HexColor("#F8F8F8"),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Suggested experts",
                        style: TextStyle(
                            fontFamily: "SFPro",
                            fontSize: 16,
                            color: HexColor("#262628"),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
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
                      itemCount: usersList.length,
                      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                          value: usersList[i], child: CarouselleItem())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
