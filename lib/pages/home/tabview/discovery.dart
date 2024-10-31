import 'package:flutter/material.dart';

import '../../../widgets/notification_button.dart';
import '../../login/index.dart';


class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {

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
        title: const Text("发现",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color(0xFFF8BBD0),
        actions: [
          NotificationButton(onPressed: _navigateToNotifications),
        ],
      ),
      body: ListView(
        children: <Widget>[Text("discovery")],
      ),
    );
  }
}
