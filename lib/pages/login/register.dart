import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../cp_application.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPhoneRegistration = true; // 控制手机号和邮箱注册的选择
  bool _obscurePassword = true; // 控制密码是否可见
  bool _obscureConfirmPassword = true; // 控制确认密码是否可见

  // 切换注册方式
  void _toggleRegistrationType(bool isPhone) {
    setState(() {
      _isPhoneRegistration = isPhone;
    });
  }

  // 切换密码可见性
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  // 切换确认密码可见性
  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("注册",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color(0xFFF8BBD0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            // 注册方式选择
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => _toggleRegistrationType(true),
                  child: Text(
                    "手机注册",
                    style: TextStyle(
                      color: _isPhoneRegistration ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text("/", style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => _toggleRegistrationType(false),
                  child: Text(
                    "邮箱注册",
                    style: TextStyle(
                      color: !_isPhoneRegistration ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // 手机号注册
            if (_isPhoneRegistration) ...[
              TextField(
                decoration: const InputDecoration(
                  labelText: "手机号",
                  hintText: "请输入手机号",
                ),
                keyboardType: TextInputType.phone,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: "验证码",
                        hintText: "请输入验证码",
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: 获取手机号验证码逻辑
                    },
                    child: const Text("获取验证码"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "设置密码",
                    hintText: "请输入密码",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: "确认密码",
                    hintText: "请确认密码",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _toggleConfirmPasswordVisibility,
                    ),
                  ),
                ),
              ),
            ],
            // 邮箱注册
            if (!_isPhoneRegistration) ...[
              TextField(
                decoration: const InputDecoration(
                  labelText: "邮箱",
                  hintText: "请输入邮箱地址",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: "验证码",
                        hintText: "请输入验证码",
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: 获取邮箱验证码逻辑
                    },
                    child: const Text("获取验证码"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "设置密码",
                    hintText: "请输入密码",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: "确认密码",
                    hintText: "请确认密码",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _toggleConfirmPasswordVisibility,
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: 实现注册逻辑
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFFFFE0F0),
              ),
              child: const Text(
                '注册',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Text("已有账号,"),
                TextButton(
                  child: const Text("去登录"),
                  onPressed: () {
                    CpApplication.router.navigateTo(
                        context, '/login',
                        transition: TransitionType.fadeIn);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
