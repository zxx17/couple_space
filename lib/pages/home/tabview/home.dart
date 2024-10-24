import 'package:couple_space_app/pages/login/index.dart';
import 'package:couple_space_app/widgets/notification_button.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // 用来判断是否绑定了另一半
  bool isPartnerBound = true;

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
        title: const Text("主页",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color(0xFFF8BBD0),
        actions: [
          NotificationButton(onPressed: _navigateToNotifications),
        ],
      ),
      body: isPartnerBound ? _partnerBoundPage() : _noPartnerBoundPage(),
    );
  }

  // 已绑定情侣
  Widget _partnerBoundPage() {
    return Column(
      children: [
        // 顶部照片背景
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/default_cp_bg.png'), // 替换为你的照片路径
              fit: BoxFit.contain,
            ),
          )
        ),
        // 功能菜单
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMenuItem("纪念日", Icons.calendar_month),
            _buildMenuItem("相册", Icons.photo),
            _buildMenuItem("个人中心", Icons.person),
          ],
        ),
        // 灰色分隔线和动态内容
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container(height: 1, color: Colors.grey)),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              Expanded(child: Container(height: 1, color: Colors.grey)),
            ],
          ),
        ),
        // 动态内容区域
        Expanded(
          child: Center(child: Text("动态内容展示区")),
        ),
        // 打卡按钮
        Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                // TODO 添加打卡逻辑
              },
              child: Text("打卡"),
            ),
          ),
        ),
        // 发布按钮
        Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                // TODO 添加发布逻辑
              },
              child: Text("发布"),
            ),
          ),
        ),
      ],
    );
  }

  // 功能菜单
  Widget _buildMenuItem(String title, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40),
        SizedBox(height: 8),
        Text(title),
      ],
    );
  }

  // 未绑定情侣
  Widget _noPartnerBoundPage() {
    return Column(
      children: [
        // 顶部图片
        Container(
          height: 200, // 设置图片的高度
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/invite.png'), // 替换为你的图片路径
              fit: BoxFit.cover,
            ),
          ),
        ),
        // 中间的灰色横线和圆形头像
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Divider(
              color: Colors.grey,
              thickness: 0.1,
            )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 50, // 头像的宽度
              height: 50, // 头像的高度
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('images/default_avatar.png'), // 替换为头像路径
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Divider(
              color: Colors.grey,
              thickness: 0.1,
            )),
          ],
        ),
        // 个人中心
        TextButton(
          onPressed: () {
            // TODO 这里可以添加导航到个人中心的逻辑
          },
          child: Text("个人中心"),
        ),
        // 搜索框
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: '搜索对方账号',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // TODO 添加搜索逻辑
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
