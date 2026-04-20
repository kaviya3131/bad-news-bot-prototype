import 'package:flutter/material.dart';

class SandraInput extends StatefulWidget {
  const SandraInput({
    required this.visible,
    required this.onSubmit,
    super.key,
  });

  final bool visible;
  final ValueChanged<String> onSubmit;

  @override
  State<SandraInput> createState() => _SandraInputState();
}

class _SandraInputState extends State<SandraInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final String message = _controller.text;
    widget.onSubmit(message);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.visible) {
      return const SizedBox.shrink();
    }

    return Positioned(
      left: 32,
      right: 32,
      bottom: 26,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFCFCFCF)),
          borderRadius: BorderRadius.circular(28),
          color: const Color(0xFF5A5A5A),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
                style: const TextStyle(color: Color(0xFFF2F2F2), fontSize: 20),
                decoration: const InputDecoration(
                  hintText: 'Type your message',
                  hintStyle: TextStyle(color: Color(0xFFCACACA), fontSize: 20),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                onSubmitted: (_) => _submit(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: _submit,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: Color(0xFF001BC4),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
