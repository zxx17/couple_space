import 'package:couple_space_app/routes/route_handlers.dart';
import 'package:couple_space_app/widgets/not_found.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  //定义路由
  static String home = "/";
  static String login = "/login";
  static String register ="/login/register";
  static String album = "/album";
  static String albumPhotos = "/album/photo";

  static void configureRoutes(FluroRouter router) {
    //处理未匹配到路由时展示的页面
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const NotFoundWidget();
    });
    //注册路由并指向所对应的handler(Handler对应的是界面)
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(album, handler: albumHandler);
    router.define(albumPhotos, handler: albumPhotosHandler);
    router.define(register, handler: registerHandler);
  }
}
