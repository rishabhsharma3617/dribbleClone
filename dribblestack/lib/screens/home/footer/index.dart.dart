import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/screens/home/footer/widgets/electricity_usage_card.dart';
import 'package:dribblestack/services/responsive_service.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  List<int> electricityUnitsConsumed;
  FooterSection({Key? key, required this.electricityUnitsConsumed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    String getCurrentMonth(int monthIndex) {
      List<String> monthNameArr = [
        'JAN',
        'FEB',
        'MAR',
        'APR',
        'MAY',
        'JUN',
        'JUL',
        'AUG',
        'SEP',
        'OCT',
        'NOV',
        'DEC'
      ];
      return monthNameArr[monthIndex];
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Statistics',
              style: TextStyle(color: Colors.white, fontSize: 16.toFont),
            ),
            Text(
              getCurrentMonth(DateTime.now().month - 1),
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8), fontSize: 16.toFont),
            )
          ],
        ),
        SizedBox(
          height: 20.toHeight,
        ),
        GlassContainer(
            height: 150.toHeight,
            width: double.infinity,
            child: ElectricityUsageCard(
              electricityUnitsConsumed: electricityUnitsConsumed,
            )),
      ],
    );
  }
}
