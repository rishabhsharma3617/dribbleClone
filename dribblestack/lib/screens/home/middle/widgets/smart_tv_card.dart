import 'dart:ui';

import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/screens/home/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SmartTvCard extends StatelessWidget {
  final bool isActive;
  final Function toggleActiveStatus;
  const SmartTvCard(
      {Key? key, required this.isActive, required this.toggleActiveStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      disableMorphicEffect: isActive,
      height: 165,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Smart Tv',
                    style: TextStyle(
                        color: isActive ? Colors.black : Colors.white,
                        fontSize: 20),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 17, color: isActive ? Colors.black : Colors.white)
                ],
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text('Samsung UA45 4AC',
                style:
                    TextStyle(color: isActive ? Colors.black : Colors.white)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterSwitch(
                  value: isActive,
                  height: 33,
                  toggleSize: 30,
                  width: 62,
                  padding: 2,
                  onToggle: (newActiveStatus) => toggleActiveStatus(
                      ApplianceService.smartTvService, newActiveStatus),
                ),
                Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
