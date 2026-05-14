import 'package:flutter/material.dart';
import 'package:frontend/src/features/welcome/presentation/widgets/sandra_avatar_view.dart';

class SandraStage extends StatelessWidget {
  const SandraStage({
    required this.messageToSpeak,
    super.key,
  });

  final String? messageToSpeak;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF5A5A5A), width: 1),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xFF3D4043),
            Color(0xFF2F3336),
          ],
        ),
      ),
      child: ClipRect(
        child: SandraAvatarView(messageToSpeak: messageToSpeak),
      ),
    );
  }
}
