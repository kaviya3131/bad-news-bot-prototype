import 'package:flutter/material.dart';
import 'package:frontend/src/features/welcome/application/welcome_notifier.dart';
import 'package:frontend/src/features/welcome/presentation/widgets/sandra_bubbles.dart';
import 'package:frontend/src/features/welcome/presentation/widgets/sandra_input.dart';
import 'package:frontend/src/features/welcome/presentation/widgets/sandra_stage.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeNotifier notifier = context.watch<WelcomeNotifier>();
    final List<String> sandraMessages = notifier.state.sandraMessages;
    final String? latestSandraMessage =
        sandraMessages.isEmpty ? null : sandraMessages.last;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: const Color(0xFF062A57),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: const Text(
                'Welcome Screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  children: <Widget>[
                    SandraStage(messageToSpeak: latestSandraMessage),
                    SandraBubbles(messages: sandraMessages),
                    SandraInput(
                      visible: notifier.state.showInput,
                      onSubmit: notifier.submitUserReply,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
