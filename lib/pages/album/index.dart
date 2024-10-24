import 'package:flutter/widgets.dart';
import '../../widgets/page_content.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageContent(name: "相册"),
    );
  }

}
