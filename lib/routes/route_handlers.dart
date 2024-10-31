import 'package:couple_space_app/pages/album/index.dart';
import 'package:couple_space_app/pages/album/photos.dart';
import 'package:couple_space_app/pages/home/index.dart';
import 'package:couple_space_app/pages/home/tabview/chat.dart';
import 'package:couple_space_app/pages/home/tabview/discovery.dart';
import 'package:couple_space_app/pages/login/index.dart';
import '../pages/login/register.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

/// 登录
var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LoginPage();
});

/// 登录-注册
var registerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return RegisterPage();
});

/// 首页
var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return HomePage();
});

/// 相册
var albumHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return AlbumPage();
});

/// 相册-照片
var albumPhotosHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  //接收传的参数
  final albumId = params['albumId']!.first;
  final albumName = params['albumName']!.first;
  return AlbumPhotosPage(albumId: albumId, albumName: albumName);
});

/// 发现
var discoveryHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return DiscoveryPage();
});

/// 聊天
var chatHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return ChatPage();
});
