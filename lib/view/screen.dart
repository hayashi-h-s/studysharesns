import 'package:flutter/material.dart';
import 'package:studysharesns/materials/view/item_list_page.dart';
import 'package:studysharesns/view/post/post_page.dart';
import 'package:studysharesns/view/post_index/posts_index_page.dart';

import 'account/account_page.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int selectedIndex = 0;
  List<Widget> pageList = [
    const PostIndexPage(),
    const ItemListPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "投稿"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "TODO",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "その他"),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostPage()));
        },
        child: const Icon(Icons.article),
      ),
    );
  }
}
