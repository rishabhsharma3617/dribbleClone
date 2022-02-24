import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/services/responsive_service.dart';
import 'package:flutter/material.dart';

class MusicPlayerCard extends StatelessWidget {
  Audio song;
  MusicPlayerCard({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: double.infinity,
      height: 118.toHeight,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: 14.toHeight, horizontal: 19.toWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.toWidth),
                  child: Image(
                    height: 38.toHeight,
                    width: 38.toWidth,
                    image: AssetImage('assets/images/hero_thmb.jpg'),
                  ),
                ),
                SizedBox(
                  width: 10.toWidth,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(song.metas.title ?? 'Unknown',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12.5.toFont, color: Colors.white)),
                      SizedBox(
                        height: 1.toHeight,
                      ),
                      Text(
                        song.metas.artist ?? 'Unknown',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12.toFont,
                            color: Colors.grey[300]),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.skip_previous,
                      size: 23.toHeight,
                      color: Colors.white,
                    ),
                    Container(
                      height: 38.toHeight,
                      width: 48.toWidth,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15.5.toHeight)),
                      child: Center(
                        child: InkWell(
                          child: Icon(
                            Icons.pause,
                            size: 26.toHeight,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.skip_next,
                      size: 23.toHeight,
                      color: Colors.white,
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
