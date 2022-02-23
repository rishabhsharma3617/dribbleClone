import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/screens/home/middle/widgets/plug_card.dart';
import 'package:dribblestack/screens/home/middle/widgets/smart_tv_card.dart';
import 'package:dribblestack/screens/home/middle/widgets/temprature_card.dart';
import 'package:dribblestack/screens/home/temperature_controller_sheet/index.dart';
import 'package:flutter/material.dart';

class MiddleOptionsHeader extends StatelessWidget {
  final bool isTemperatureCardActive;
  final bool isPlugWallActive;
  final bool isSmartTvCardActive;
  final Function toggleServiceStatus;
  const MiddleOptionsHeader(
      {Key? key,
      required this.isTemperatureCardActive,
      required this.isPlugWallActive,
      required this.isSmartTvCardActive,
      required this.toggleServiceStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Living Room',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: InkWell(
              onTap: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  enableDrag: true,
                  builder: (context) {
                    return Wrap(children: [TempertaureControllerSheet()]);
                  }),
              child: TemperatureCard(
                isActive: isTemperatureCardActive,
                toggleActiveStatus: toggleServiceStatus,
              ),
            )),
            SizedBox(
              width: 20,
            ),
            Flexible(
                child: PlugCard(
              isActive: isPlugWallActive,
              toggleActiveStatus: toggleServiceStatus,
            )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: GlassContainer(
              height: 165,
              width: double.infinity,
              child: Container(),
            )),
            SizedBox(
              width: 20,
            ),
            Flexible(
                child: SmartTvCard(
              isActive: isSmartTvCardActive,
              toggleActiveStatus: toggleServiceStatus,
            )),
          ],
        ),
      ],
    );
  }
}
