import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/materials/view/item_list_page.dart';
import 'package:studysharesns/samples/method_channel/battery_level_screen.dart';

class SampleListPage extends HookConsumerWidget {
  const SampleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("サンプル一覧"),
            backgroundColor: Colors.indigo,
            automaticallyImplyLeading: false),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BatteryLevelScreen(),
                    ),
                  );
                },
                child: const Text("バッテリーレベル取得"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemListPage(),
                    ),
                  );
                },
                child: const Text("TODOリストサンプル"),
              ),
            ],
          ),
        ));
  }
}
