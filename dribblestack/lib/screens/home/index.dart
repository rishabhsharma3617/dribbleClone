import 'dart:math';

import 'package:dribblestack/screens/home/footer/index.dart.dart';
import 'package:dribblestack/screens/home/header/index.dart';
import 'package:dribblestack/screens/home/middle/index.dart';
import 'package:dribblestack/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//@@@@ Defining static services for the Dribble UI
enum ApplianceService {
  temperatureControllerService,
  plugWallService,
  smartTvService
}

enum UserAudioInteractions { playNext, playPrev, pause }
enum SongPlayingStatus { notStarted, playing, paused }

class _HomeScreenState extends State<HomeScreen> {
  //USING STATE LOCALLY
  //@@@@ Local state to store current activation status of a particular appliance--

  bool isTemperatureCardActive = true;
  bool isPlugWallActive = false;
  bool isSmartTvCardActive = false;
  int currentSongIndex = 0;
  SongPlayingStatus currentPlayingStatus = SongPlayingStatus.notStarted;
  final assetsAudioPlayer = AssetsAudioPlayer();

  //@@@ Local function to change the active state of the appliance service
  toggleApplianceServiceStatus(
      ApplianceService applianceService, bool newActiveStatus) {
    setState(() {
      switch (applianceService) {
        case ApplianceService.temperatureControllerService:
          {
            print(applianceService);
            isTemperatureCardActive = newActiveStatus;
          }

          break;
        case ApplianceService.plugWallService:
          isPlugWallActive = newActiveStatus;
          break;
        case ApplianceService.smartTvService:
          isSmartTvCardActive = newActiveStatus;
          break;
        default:
      }
    });
  }

  //@@@ Random data for the electricity usage
  List<int> electricityUnitsConsumed = [];

  //@@@ Seeder function to seed random static data uptill todays day in accordance with month
  seedUnitsConsumedData() {
    Random random = Random();

    int daysElapsedInAMonth = DateTime.now().day;
    while (daysElapsedInAMonth > 0) {
      int randomUnitsConsumedInADay = random.nextInt(90) + 10;
      electricityUnitsConsumed.add(randomUnitsConsumedInADay);
      daysElapsedInAMonth--;
    }
  }

  //@@@ Static Audio files to be played
  final audios = <Audio>[
    Audio(
      'assets/audios/cant_buy_me_loving.mp3',
      //playSpeed: 2.0,
      metas: Metas(
        id: 'Rffauk',
        title: 'Cant Buy me Loving',
        artist: 'Rfauk',
        album: '',
        image: MetasImage(
            path: 'assets/images/cbml_thumb.jpeg', type: ImageType.asset),
      ),
    ),
    Audio(
      'assets/audios/Hero.mp3',
      //playSpeed: 2.0,
      metas: Metas(
        id: 'Hero',
        title: 'Hero',
        artist: 'Enrique Igleasis',
        album: '',
        image: MetasImage(
            path: 'assets/images/hero_thmb.jpg', type: ImageType.asset),
      ),
    )
  ];

  ///@@@ Function to change the song
  changeSongIndex(int newIndex) {
    setState(() {
      currentSongIndex = newIndex;
    });

    if (currentPlayingStatus == SongPlayingStatus.playing) {
      print('x');
      assetsAudioPlayer.open(audios[currentSongIndex]);
    } else if (currentPlayingStatus == SongPlayingStatus.paused) {
      assetsAudioPlayer.stop();
      setState(() {
        currentPlayingStatus = SongPlayingStatus.notStarted;
      });
    }
  }

  startSongCallback() {
    assetsAudioPlayer.open(audios[currentSongIndex]);
    setState(() {
      currentPlayingStatus = SongPlayingStatus.playing;
    });
  }

  ///@@@ Function to change the playing status of the song
  changeAudioPlayingstatus(SongPlayingStatus newStatus) {
    print(newStatus);
    setState(() {
      currentPlayingStatus = newStatus;
    });
    if (newStatus == SongPlayingStatus.paused)
      assetsAudioPlayer.pause();
    else
      assetsAudioPlayer.play();
  }

  @override
  void initState() {
    super.initState();
    seedUnitsConsumedData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SizeConfig().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_background1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15.toWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.toHeight,
                  ),
                  GreetingsHeader(userName: 'Christopher'),
                  SizedBox(
                    height: 30.toHeight,
                  ),
                  MiddleOptionsHeader(
                    isTemperatureCardActive: isTemperatureCardActive,
                    isPlugWallActive: isPlugWallActive,
                    isSmartTvCardActive: isSmartTvCardActive,
                    toggleServiceStatus: toggleApplianceServiceStatus,
                    currentSong: audios[currentSongIndex],
                    audioPlayingStatus: currentPlayingStatus,
                    currentSongIndex: currentSongIndex,
                    startPlayerCallback: startSongCallback,
                    changeSongCallback: changeSongIndex,
                    changePlayingStatusCallback: changeAudioPlayingstatus,
                  ),
                  SizedBox(
                    height: 27.toHeight,
                  ),
                  FooterSection(
                    electricityUnitsConsumed: electricityUnitsConsumed,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
