import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {

  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('404 - 页面未找到'),
        backgroundColor: const Color(0xFFF8BBD0),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mood_bad, // 这里可以换成其他图标
              size: 100, // 调整图标大小
              color: Color(0xFFBDBDBD), // 设置图标的颜色
            ),
            SizedBox(height: 20),
            Text(
              '哎呀，页面走丢了~',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFBDBDBD),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
