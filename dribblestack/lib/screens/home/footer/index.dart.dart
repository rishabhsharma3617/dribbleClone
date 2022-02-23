import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/screens/home/footer/widgets/electricity_usage_card.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Statistics',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Month',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GlassContainer(
            height: 200, width: double.infinity, child: ElectricityUsageCard()),
      ],
    );
  }
}
