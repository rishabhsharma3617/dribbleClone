import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/screens/home/middle/widgets/music_player_card.dart';
import 'package:dribblestack/screens/home/middle/widgets/plug_card.dart';
import 'package:dribblestack/screens/home/middle/widgets/smart_tv_card.dart';
import 'package:dribblestack/screens/home/middle/widgets/temprature_card.dart';
import 'package:dribblestack/screens/home/temperature_controller_sheet/index.dart';
import 'package:dribblestack/services/responsive_service.dart';
import 'package:flutter/material.dart';

class MiddleOptionsHeader extends StatelessWidget {
  final bool isTemperatureCardActive;
  final bool isPlugWallActive;
  final bool isSmartTvCardActive;
  final Function toggleServiceStatus;
  final Audio currentSong;
  const MiddleOptionsHeader(
      {Key? key,
      required this.isTemperatureCardActive,
      required this.isPlugWallActive,
      required this.isSmartTvCardActive,
      required this.toggleServiceStatus,
      required this.currentSong})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Living Room',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.toFont,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.toHeight,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    return Wrap(children: [
                      TempertaureControllerSheet(
                        isTempertaureCardActive: isTemperatureCardActive,
                        toggleActiveStatus: toggleServiceStatus,
                      )
                    ]);
                  }),
              child: TemperatureCard(
                isActive: isTemperatureCardActive,
                toggleActiveStatus: toggleServiceStatus,
              ),
            )),
            SizedBox(
              width: 15.toWidth,
            ),
            Flexible(
                child: PlugCard(
              isActive: isPlugWallActive,
              toggleActiveStatus: toggleServiceStatus,
            )),
          ],
        ),
        SizedBox(
          height: 16.toHeight,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: MusicPlayerCard(
                song: currentSong,
              ),
            ),
            SizedBox(
              width: 15.toWidth,
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
