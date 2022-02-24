import 'package:dribblestack/services/responsive_service.dart';
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
    SizeConfig().init(context);
    return Container(
        height: 60.toHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.toWidth),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8.toHeight, horizontal: 12.toWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      applianceName,
                      style: TextStyle(
                        fontSize: 16.toFont,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(
                      height: 1.toHeight,
                    ),
                    Text(
                      activeStatus ? 'On' : 'Off',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 23.toFont,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                applianceIcon
              ],
            )));
  }
}
