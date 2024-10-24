import 'package:couple_space_app/cp_application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

/// 无状态组件
class PageContent extends StatelessWidget {
  // 页面名称
  final String name;

  const PageContent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("$name",
            style: const TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color(0xFFF8BBD0),
      ),
    );
  }
}
