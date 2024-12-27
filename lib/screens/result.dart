import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatefulWidget {
  final String winnerText, aiImage, humanImage;

  const ResultScreen({
    Key? key,
    required this.winnerText,
    required this.aiImage,
    required this.humanImage,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 5));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.winnerText.contains('You are a winner')) {
        _confettiController.play();
      }
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242424),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 35,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Result',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildChoiceCard('You', widget.humanImage),
                      _buildChoiceCard('AI', widget.aiImage),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 700),
                      child: Text(
                        widget.winnerText.toUpperCase(),
                        key: ValueKey(widget.winnerText),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color:
                                widget.winnerText.contains('You are a winner')
                                    ? Colors.green
                                    : Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white30,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Play Again'.toUpperCase(),
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                emissionFrequency: 0.05,
                numberOfParticles: 30,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.yellow,
                  Colors.purple,
                  Colors.orange,
                  Colors.pink,
                  Colors.red,
                  Colors.teal,
                  Colors.indigo,
                  Colors.cyan,
                  Colors.brown,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceCard(String title, String image) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[850],
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(15),
          child: Image.asset(image, height: 100),
        ),
      ],
    );
  }
}
