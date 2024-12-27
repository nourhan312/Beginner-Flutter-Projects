import 'package:flutter/material.dart';

class StoryDetails extends StatelessWidget {
  const StoryDetails({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Story Details'),
        ),
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              height: 400,
              width: 400,
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
        ));
  }
}
