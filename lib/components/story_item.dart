import 'package:flutter/material.dart';
import 'package:massenger_ui/models/chat.dart';

import '../models/story.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key, required this.story});

  final Story story;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      children: [
        Container(
          width: 80,
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue,
              width: 3,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(story.image),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SelectableText(
          story.name,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
