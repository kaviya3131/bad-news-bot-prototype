import 'package:flutter/material.dart';

class SandraAvatarView extends StatelessWidget {
  const SandraAvatarView({
    required this.messageToSpeak,
    super.key,
  });

  final String? messageToSpeak;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Sandra avatar is available on Flutter Web.',
        style: TextStyle(
          color: Color(0xFFC7CBD1),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
