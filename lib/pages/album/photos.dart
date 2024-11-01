import 'package:flutter/widgets.dart';
import '../../widgets/page_content.dart';

class AlbumPhotosPage extends StatefulWidget {
  final String albumId;
  final String albumName;

  const AlbumPhotosPage({
    super.key,
    required this.albumId,
    required this.albumName,
  });

  @override
  State<AlbumPhotosPage> createState() => _AlbumPhotosPageState();
}

class _AlbumPhotosPageState extends State<AlbumPhotosPage> {
  @override
  Widget build(BuildContext context) {
    return PageContent(
      name: widget.albumName,
    );
  }
}