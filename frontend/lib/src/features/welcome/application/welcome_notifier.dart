import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:frontend/src/features/welcome/domain/welcome_state.dart';

class WelcomeNotifier extends ChangeNotifier {
  WelcomeState _state = WelcomeState.initial();
  Timer? _introTimer;

  WelcomeState get state => _state;

  void start() {
    if (_state.started) {
      return;
    }

    _state = _state.copyWith(
      started: true,
      sandraMessages: <String>[
        'Hello! welcome to the experiment',
      ],
      showInput: false,
    );
    notifyListeners();

    _introTimer = Timer(const Duration(seconds: 3), _showReadyPrompt);
  }

  void _showReadyPrompt() {
    _state = _state.copyWith(
      sandraMessages: <String>[
        'Are you ready for the first task?',
      ],
      showInput: true,
    );
    notifyListeners();
  }

  void submitUserReply(String message) {
    final String clean = message.trim();
    if (clean.isEmpty) {
      return;
    }

    _state = _state.copyWith(userMessage: clean);
    notifyListeners();
  }

  @override
  void dispose() {
    _introTimer?.cancel();
    super.dispose();
  }
}
