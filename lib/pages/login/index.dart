import 'package:couple_space_app/cp_application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 控制密码是否可见
  bool _obscurePassword = true;

  // 切换密码可见性
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("登录",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color(0xFFF8BBD0),
      ),
      body: Stack(
        children: [
          // 背景图
          Positioned.fill(
            child: Image.asset(
              'images/login_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // 白色蒙版
          Container(
            color: Colors.white.withOpacity(0.6), // 设置透明度
          ),
          // 登录框
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0)
                .copyWith(top: 100), // 调整顶部间距
            child: Column(
              children: <Widget>[
                const TextField(
                  decoration: InputDecoration(
                    labelText: "账号",
                    hintText: "请输入用户名/手机号/邮箱",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextField(
                    obscureText: _obscurePassword, // 使用状态变量
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "请输入密码",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility, // 点击事件
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 16.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.login,
                      color: Color(0xFFFFFFFF),
                    ),
                    label: const Text(
                      '登录',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      // TODO: 实现登录逻辑
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color(0xFFFFE0F0)),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text("还没有账号,"),
                    TextButton(
                      child: const Text("去注册"),
                      onPressed: () {
                        CpApplication.router.navigateTo(
                            context, '/login/register',
                            transition: TransitionType.fadeIn);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
