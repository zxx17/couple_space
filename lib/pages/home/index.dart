import 'package:couple_space_app/pages/home/tabview/chat.dart';
import 'package:couple_space_app/pages/home/tabview/discovery.dart';
import 'package:couple_space_app/pages/home/tabview/home.dart';
import 'package:couple_space_app/pages/home/tabview/setting.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    IndexPage(),
    DiscoveryPage(),
    ChatPage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: '发现',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '聊天',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '设置'
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFFF8BBD0), // 选中的颜色
        unselectedItemColor: Colors.grey, // 未选中的颜色
      ),
    );
  }
}
