import 'package:andiplex/features/movies_info/presentation/bookmark/controller/bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkPage extends GetView<BookmarkController> {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bookmark Page'),
      ),
    );
  }
}
