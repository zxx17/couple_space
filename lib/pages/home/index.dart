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

  void _pushDynamicMessage() {
    print("发布动态被点击");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // 给BottomAppBar添加一个圆形缺口
        notchMargin: 8, // 控制缺口与FAB的距离
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => _onItemTapped(0),
              color: _currentIndex == 0 ? const Color(0xFFF8BBD0) : Colors.grey,
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => _onItemTapped(1),
              color: _currentIndex == 1 ? const Color(0xFFF8BBD0) : Colors.grey,
            ),
            SizedBox(width: 56,), // 为FAB留出空间
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () => _onItemTapped(2),
              color: _currentIndex == 2 ? const Color(0xFFF8BBD0) : Colors.grey,
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => _onItemTapped(3),
              color: _currentIndex == 3 ? const Color(0xFFF8BBD0) : Colors.grey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushDynamicMessage,
        tooltip: '发布动态',
        child: Icon(
          Icons.add_a_photo,
          color: Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}