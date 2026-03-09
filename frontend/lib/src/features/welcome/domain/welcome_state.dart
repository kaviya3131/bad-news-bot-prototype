class WelcomeState {
  WelcomeState({
    required this.started,
    required this.sandraMessages,
    required this.showInput,
    required this.userMessage,
  });

  factory WelcomeState.initial() {
    return WelcomeState(
      started: false,
      sandraMessages: const <String>[],
      showInput: false,
      userMessage: null,
    );
  }

  final bool started;
  final List<String> sandraMessages;
  final bool showInput;
  final String? userMessage;

  WelcomeState copyWith({
    bool? started,
    List<String>? sandraMessages,
    bool? showInput,
    String? userMessage,
  }) {
    return WelcomeState(
      started: started ?? this.started,
      sandraMessages: sandraMessages ?? this.sandraMessages,
      showInput: showInput ?? this.showInput,
      userMessage: userMessage ?? this.userMessage,
    );
  }
}
