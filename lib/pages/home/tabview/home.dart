import 'package:couple_space_app/cp_application.dart';
import 'package:couple_space_app/pages/login/index.dart';
import 'package:couple_space_app/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class IndexPage extends StatefulWidget {
  late String userName = "XXXX";

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  File? _image;

  String get _userName => widget.userName;

  // 上传图片, TODO 数据库添加个人背景图，在集成oss存放再来改造
  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;
    setState(() {
      _image = File(result.files.single.path!);
    });
  }

  void _navigateToNotifications() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 头部
      appBar: AppBar(
        centerTitle: true,
        title: const Text("主页",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color(0xFFF8BBD0),
        actions: [
          NotificationButton(onPressed: _navigateToNotifications),
        ],
      ),
      // 侧边栏
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
              onTap: _pickImage,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: _image != null
                        ? FileImage(_image!)
                        : const AssetImage('images/default_cp_bg.png')
                            as ImageProvider,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '你好$_userName',
                      style: TextStyle(
                          color: Colors.black, fontSize: 24), // 改变文字颜色以便在图片上可见
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('个人中心'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('退出登录'),
              onTap: () {},
            ),
          ],
        ),
      ),
      // 主体
      body: _IndexHomeContentArea(),
    );
  }
}

/// 主体内容
class _IndexHomeContentArea extends StatefulWidget {

  var cpSpaceHomeInfo = {
    'spaceBackgroundImageUrl': 'images/homebg.png',
    'spaceName': '您还没有绑定情侣空间',
    'coupleNames': 'xx && xx',
    'days': '000'
  };

  @override
  State createState() {
    return _IndexHomeContentAreaState();
  }
}

class _IndexHomeContentAreaState extends State<_IndexHomeContentArea> {
  String? get _spaceBackgroundImageUrl => widget.cpSpaceHomeInfo['spaceBackgroundImageUrl'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        ImageSection(image: _spaceBackgroundImageUrl),
        TitleSection(
          spaceName: '情侣空间',
          coupleNames: 'XXX && XXX',
          days: "000",
        ),
        ButtonSection(),
        DynamicMessageSection(
          description: "xxx发布的动态：000000",
          images: ['images/dymessage.png'],
        ),
        DynamicMessageSection(
          description: "zzzz发布的动态：11111",
          images: ['images/dymessage.png'],
        ),
      ],
    ));
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection(
      {super.key,
      required this.spaceName,
      required this.coupleNames,
      required this.days});

  final String spaceName;
  final String coupleNames;
  final String days;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    spaceName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  coupleNames,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          // #docregion icon
          Icon(
            Icons.favorite,
            color: Colors.pink[300],
          ),
          // #enddocregion icon
          Text("我们在一起 $days 天啦！"),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              // TODO 处理纪念日按钮点击事件
              print('纪念日按钮被点击');
            },
            child: const ButtonWithText(
              color: Color(0xFFF394B6),
              icon: Icons.calendar_month,
              label: '纪念日',
            ),
          ),
          GestureDetector(
            onTap: () {
              CpApplication.router.navigateTo(context, '/album');
            },
            child: const ButtonWithText(
              color: Color(0xFFF394B6),
              icon: Icons.photo_album,
              label: '相册',
            ),
          ),
          GestureDetector(
            onTap: () {
              // 处理动态按钮点击事件
              print('动态按钮被点击');
            },
            child: const ButtonWithText(
              color: Color(0xFFF394B6),
              icon: Icons.message,
              label: '动态',
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color,size: 42,),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class DynamicMessageSection extends StatelessWidget {
  const DynamicMessageSection({
    super.key,
    required this.description,
    required this.images,
  });

  final String description;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final limitedImages = images.take(9).toList(); // 限制最多9张图片

    return Container(
      width: 600, // 设置组件宽度
      padding: const EdgeInsets.all(62),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 显示图片
          SizedBox(
            height: 200,
            child: limitedImages.length == 1
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(limitedImages[0], fit: BoxFit.cover),
                  )
                : limitedImages.length <= 3
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: limitedImages.map((image) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset(image, fit: BoxFit.cover),
                            ),
                          );
                        }).toList(),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3列
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: limitedImages.length,
                        itemBuilder: (context, index) {
                          return Image.asset(limitedImages[index],
                              fit: BoxFit.cover);
                        },
                      ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            softWrap: true,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // children: [
            //   IconButton(
            //     icon: const Icon(Icons.thumb_up),
            //     onPressed: () {
            //       print('点赞');
            //     },
            //   ),
            //   // const SizedBox(width: 8),
            //   // IconButton(
            //   //   icon: const Icon(Icons.comment),
            //   //   onPressed: () {
            //   //     print('评论');
            //   //   },
            //   // ),
            // ],
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}

// #docregion image-asset
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    // #docregion image-asset
    return Image.asset(
      image!,
      width: 360,
      height: 240,
      fit: BoxFit.cover,
    );
    // #enddocregion image-asset
  }
}
// #enddocregion image-section

// #docregion favorite-widget
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}
// #enddocregion favorite-widget

// #docregion favorite-state, favorite-state-fields, favorite-state-build
class _FavoriteWidgetState extends State<FavoriteWidget> {
  // #enddocregion favorite-state-build
  bool _isFavorited = true;
  int _favoriteCount = 41;

  // #enddocregion favorite-state-fields

  // #docregion toggle-favorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  // #enddocregion toggle-favorite

  // #docregion favorite-state-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
// #docregion favorite-state-fields
}
// #enddocregion favorite-state, favorite-state-fields, favorite-state-build
