import 'package:flutter/material.dart';

class ElectricityUsageCard extends StatelessWidget {
  const ElectricityUsageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Electricity Usage',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 17,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
