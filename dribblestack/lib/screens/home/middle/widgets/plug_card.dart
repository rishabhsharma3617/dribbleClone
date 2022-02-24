import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/screens/home/index.dart';
import 'package:dribblestack/services/responsive_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PlugCard extends StatelessWidget {
  final bool isActive;
  final Function toggleActiveStatus;
  const PlugCard(
      {Key? key, required this.isActive, required this.toggleActiveStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GlassContainer(
        disableMorphicEffect: isActive,
        height: 164.toHeight,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20.toWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Plug wall',
                    style: TextStyle(
                        color: isActive
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        fontSize: 17.toFont),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12.toHeight,
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 6.toHeight,
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: '\u2022 ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.toFont,
                                color: isActive
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.white,
                              )),
                          TextSpan(
                              text: 'PlayStation 5',
                              style: TextStyle(
                                fontSize: 12.toFont,
                                color: isActive
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.white,
                              )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 4.toHeight,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30.toHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterSwitch(
                    value: isActive,
                    inactiveColor: Colors.white.withOpacity(0.3),
                    height: 20.toHeight,
                    toggleSize: 18.5.toHeight,
                    width: 48.toWidth,
                    activeColor: Theme.of(context).colorScheme.primaryVariant,
                    padding: 1.2.toWidth,
                    onToggle: (newActiveStatus) => toggleActiveStatus(
                        ApplianceService.plugWallService, newActiveStatus),
                  ),
                  Container()
                ],
              )
            ],
          ),
        ));
  }
}
