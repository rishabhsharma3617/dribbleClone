import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/screens/home/index.dart';
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
    return GlassContainer(
        disableMorphicEffect: isActive,
        height: 250,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20),
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
                        color: isActive ? Colors.black : Colors.white,
                        fontSize: 20),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                    color: isActive ? Colors.black : Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 22,
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
                                fontSize: 18,
                                color: isActive ? Colors.black : Colors.white,
                              )),
                          TextSpan(
                              text: 'PlayStation 5',
                              style: TextStyle(
                                color: isActive ? Colors.black : Colors.white,
                              )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 12,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
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
