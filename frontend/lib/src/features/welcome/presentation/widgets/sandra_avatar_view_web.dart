import 'dart:async';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';

class SandraAvatarView extends StatefulWidget {
  const SandraAvatarView({
    required this.messageToSpeak,
    super.key,
  });

  final String? messageToSpeak;

  @override
  State<SandraAvatarView> createState() => _SandraAvatarViewState();
}

class _SandraAvatarViewState extends State<SandraAvatarView> {
  late final String _viewType;
  html.IFrameElement? _iframeElement;
  StreamSubscription<html.MessageEvent>? _messageSubscription;
  String? _lastSpokenMessage;
  bool _avatarReady = false;

  @override
  void initState() {
    super.initState();
    _viewType = 'sandra-avatar-${DateTime.now().microsecondsSinceEpoch}';
    _registerIframe();
    _messageSubscription = html.window.onMessage.listen(_onMessage);
  }

  @override
  void didUpdateWidget(covariant SandraAvatarView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _trySpeakLatest();
  }

  @override
  void dispose() {
    _messageSubscription?.cancel();
    super.dispose();
  }

  void _registerIframe() {
    ui.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final html.IFrameElement frame = html.IFrameElement()
        ..src = '/avatar_host.html'
        ..style.border = '0'
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.pointerEvents = 'none'
        ..allow = 'autoplay';
      _iframeElement = frame;
      return frame;
    });
  }

  void _onMessage(html.MessageEvent event) {
    if (event.origin != html.window.location.origin) {
      return;
    }

    final Object? data = event.data;
    if (data is! Map) {
      return;
    }

    final Object? typeValue = data['type'];
    if (typeValue is! String) {
      return;
    }

    if (typeValue == 'avatar-ready') {
      _avatarReady = true;
      if (mounted) {
        setState(() {});
      }
      _trySpeakLatest();
    }
  }

  void _trySpeakLatest() {
    if (!_avatarReady || _iframeElement == null) {
      return;
    }

    final String? text = widget.messageToSpeak?.trim();
    if (text == null || text.isEmpty || text == _lastSpokenMessage) {
      return;
    }

    _iframeElement!.contentWindow?.postMessage(
      <String, String>{'type': 'speak', 'text': text},
      html.window.location.origin,
    );
    _lastSpokenMessage = text;
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }
}
