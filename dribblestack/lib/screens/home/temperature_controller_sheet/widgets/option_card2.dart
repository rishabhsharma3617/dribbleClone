import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ApplianceStatusCard extends StatelessWidget {
  String applianceName;
  bool activeStatus;
  Icon applianceIcon;

  ApplianceStatusCard(
      {Key? key,
      required this.applianceName,
      required this.activeStatus,
      required this.applianceIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 95,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      applianceName,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      activeStatus ? 'On' : 'Off',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Icon(Icons.add)
              ],
            )));
  }
}
