import 'package:flutter/material.dart';
import '../widgets/meditation_card.dart';
import '../utils/utils.dart';
import '../utils/assets.dart';
import 'songboard.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardData = [
      {
        "title": kMeditateTitle,
        "description": kMeditateSubtitle,
        "image": kMeditateImageSource,
        "musicSource": kMeditateMusicSource,
      },
      {
        "title": kRelaxTitle,
        "description": kRelaxSubtitle,
        "image": kRelaxImageSource,
        "musicSource": kRelaxMusicSource,
      },
      {
        "title": kBrainTitle,
        "description": kBrainSubtitle,
        "image": kBrainImageSource,
        "musicSource": kBrainMusicSource,
      },
      {
        "title": kStudyTitle,
        "description": kStudySubtitle,
        "image": kStudyImageSource,
        "musicSource": kStudyMusicSource,
      },
      {
        "title": kSleepTitle,
        "description": kSleepSubtitle,
        "image": kSleepImageSource,
        "musicSource": kSleepMusicSource,
      },
      {
        "title": kFocusTitle,
        "description": kFocusSubtitle,
        "image": kFocusImageSource,
        "musicSource": kFocusMusicSource,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff242424),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Text(
                    "Hey Sweetie!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "What's your mood today ?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: cardData.length,
                  itemBuilder: (context, index) {
                    final card = cardData[index];
                    return MeditationCard(
                      title: card['title']!,
                      description: card['description']!,
                      image: card['image']!,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongBoard(
                              musicName: card['title']!,
                              imageSource: card['image']!,
                              musicSource: card['musicSource']!,
                              heroTag: card['image']!,
                            ),
                          ),
                        );
                      },
                      heroTag: card['image']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
