import 'package:flutter/material.dart';

class SandraBubbles extends StatelessWidget {
  const SandraBubbles({
    required this.messages,
    super.key,
  });

  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: 56,
      right: 56,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 460),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: messages
              .map(
                (String message) => Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Color(0xFF232323),
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
