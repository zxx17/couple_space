import 'package:couple_space_app/routes/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class CpApplication extends StatefulWidget {
  // 路由组件
  static late final FluroRouter router;

  const CpApplication({super.key});

  @override
  _CpApplicationState createState() => _CpApplicationState();
}


class _CpApplicationState extends State<CpApplication> {
  @override
  void initState() {
    super.initState();
    final router = FluroRouter();
    //一定要先写这行
    CpApplication.router = router;
    //再写这一行，因为我们在application中为给router初始值，如果先使用它肯定报错，所以要先赋值再使用
    Routes.configureRoutes(router);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 不显示右上角的DEBUG
      debugShowCheckedModeBanner: false,
      // 路由全局注册（不定义home会默认使用路由的第一个配置）
      onGenerateRoute: CpApplication.router.generator,
    );
  }
}
