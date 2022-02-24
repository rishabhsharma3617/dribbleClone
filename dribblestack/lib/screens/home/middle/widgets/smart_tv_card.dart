import 'dart:ui';
import 'package:dribblestack/utils/constants/text_constants.dart'
    as textCconstants;
import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/screens/home/index.dart';
import 'package:dribblestack/services/responsive_service.dart';
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
    SizeConfig().init(context);
    return GlassContainer(
      disableMorphicEffect: isActive,
      height: 118.toHeight,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(20.toWidth),
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
                    textCconstants.smartTv,
                    style: TextStyle(
                        color: isActive
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        fontSize: 18.toFont),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 17,
                      color: isActive
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white)
                ],
              ),
            ),
            SizedBox(
              height: 3.toHeight,
            ),
            Text('Samsung UA45 4AC',
                style: TextStyle(
                    fontSize: 12.toFont,
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterSwitch(
                  value: isActive,
                  height: 20.toHeight,
                  toggleSize: 18.5.toHeight,
                  activeColor: Theme.of(context).colorScheme.primaryVariant,
                  inactiveColor: Colors.white.withOpacity(0.3),
                  width: 48.toWidth,
                  padding: 1.2.toWidth,
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
