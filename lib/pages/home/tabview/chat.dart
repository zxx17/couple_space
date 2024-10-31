import 'package:flutter/material.dart';

import '../../../widgets/notification_button.dart';
import '../../login/index.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  void _navigateToNotifications() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("聊天",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color(0xFFF8BBD0),
        actions: [
          NotificationButton(onPressed: _navigateToNotifications),
        ],
      ),
      body: ListView(
        children: <Widget>[Text("chat")],
      ),
    );
  }
}
