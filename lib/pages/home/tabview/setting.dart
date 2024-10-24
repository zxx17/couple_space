import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("设置",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color(0xFFF8BBD0),
      ),
      body: ListView(
        children: <Widget>[Text("setting")],
      ),
    );
  }


}
