import 'package:flutter/material.dart';
import '../widgets/modal_bottom.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242424),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 12,
              child: Center(
                child: Image.asset(
                  'assets/images/background.png',
                  height: 400,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 3,
                  shadowColor: Colors.amberAccent,
                ),
                onPressed: () => Navigator.pushNamed(context, '/game'),
                child: Text(
                  'Play Game Now'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  ModalBottom(context);
                },
                child: Text(
                  "See the instructions",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xffA9A9A9),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}