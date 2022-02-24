import 'dart:math';
import 'package:dribblestack/utils/constants/text_constants.dart'
    as textCconstants;
import 'package:dribblestack/services/responsive_service.dart';
import 'package:dribblestack/utils/extensions/hex.dart';
import 'package:flutter/material.dart';

class ElectricityUsageCard extends StatelessWidget {
  List<int> electricityUnitsConsumed;
  ElectricityUsageCard({Key? key, required this.electricityUnitsConsumed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Finding max used units in a day
    int maxUnitsUsageInADay = electricityUnitsConsumed
        .reduce((curr, next) => curr > next ? curr : next);
    //

    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 20.toHeight, horizontal: 22.toWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textCconstants.electricityUsageCardHeading,
                style: TextStyle(color: Colors.white, fontSize: 17.toFont),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12.toWidth,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 15.toHeight,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getGraphBars(maxUnitsUsageInADay),
          )
        ],
      ),
    );
  }

  List<Widget> getGraphBars(int maxUnitsUsageInADay) {
    double maxBarHeight = 70.toHeight;
    print(maxUnitsUsageInADay);

    List<Widget> bars = [];
    for (int i = 0; i < electricityUnitsConsumed.length; i++) {
      bars.add(Container(
        width: 5.toWidth,
        height:
            maxBarHeight * (electricityUnitsConsumed[i] / maxUnitsUsageInADay),
        decoration: BoxDecoration(
            color: i % 2 == 0 ? Colors.grey[400] : Colors.white,
            borderRadius: BorderRadius.circular(10.toHeight)),
      ));
    }
    return bars;
  }
}
