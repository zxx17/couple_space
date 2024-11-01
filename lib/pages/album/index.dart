import 'package:couple_space_app/cp_application.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  /// 请求相册数据
  Future<List<dynamic>> fetchAlbums() async {
    // final response = await http.get(Uri.parse('YOUR_API_URL'));
    //
    // if (response.statusCode == 200) {
    //   final jsonResponse = json.decode(response.body);
    //   // 检查状态码和消息
    //   if (jsonResponse['status'] == 'success') {
    //     return jsonResponse['data']; // 返回相册数据
    //   } else {
    //     throw Exception(jsonResponse['message']);
    //   }
    // } else {
    //   throw Exception('Failed to load albums');
    // }

    // 模拟相册数据
    await Future.delayed(Duration(seconds: 1)); // 模拟网络延迟

    return [
      {
        'id': 1,
        'albumName':"album1",
        'coverImage': 'https://picsum.photos/200/300',
        'creator': '用户x',
        'createdAt': '2023-10-01',
      },
      {
        'id': 2,
        'albumName':"album2",
        'coverImage': 'https://picsum.photos/200/300',
        'creator': '用户z',
        'createdAt': '2023-10-02',
      },
    ];
  }

  /// 创建相册
  void _createAlbum(BuildContext context) {
    // 这里可以添加创建相册的逻辑，例如打开一个新的页面
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("创建相册"),
          content: Text("这里可以添加创建相册的表单或功能。"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("关闭"),
            ),
          ],
        );
      },
    );
  }

  /// 跳转到相册详情页
  void _navigateToAlbumPhotoDetail(BuildContext context, String path) {
    CpApplication.router.navigateTo(context, path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("相册",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color(0xFFF8BBD0),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () => _createAlbum(context), // 创建相册的操作
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 设置内边距
        child: FutureBuilder<List<dynamic>>(
          future: fetchAlbums(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No albums available'));
            }

            final albums = snapshot.data!;
            return SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: albums.length,
                itemBuilder: (context, index) {
                  final album = albums[index];
                  return GestureDetector(
                    onTap: () =>
                        _navigateToAlbumPhotoDetail(context, "/album/photo?albumId=${album['id']}&albumName=${album['albumName']}"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120, // 设置宽高以形成正方形
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0), // 圆角
                            image: DecorationImage(
                              image: NetworkImage(album['coverImage']),
                              fit: BoxFit.cover, // 图片自适应正方形
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0), // 添加间隔
                        Text(album['albumName']),
                        Text(album["creator"]+" "+album['createdAt']  ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
