import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NotificationButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.notifications),
      onPressed: onPressed,
    );
  }
}
