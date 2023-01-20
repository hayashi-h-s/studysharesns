import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/materials/view/item_list_page.dart';

import '../../samples/method_channel/battery_level_screen.dart';

enum SampleType {
  batteryLevel("バッテリーレベル取得", BatteryLevelScreen()),
  confirmed("TODOリストサンプル", ItemListPage());

  final String buttonText;
  final Widget navigator;

  const SampleType(this.buttonText, this.navigator);
}

class SampleListPage extends HookConsumerWidget {
  const SampleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<int> list = [1, 2, 3];

    Map map = {
      1: 'first',
      2: 'second',
      3: 'third',
    };

    // const test = MaterialPageRoute(
    //   builder: (context) => const BatteryLevelScreen(),
    // )

    const test = BatteryLevelScreen();

    // Function test = () => {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const BatteryLevelScreen(),
    //         ),
    //       )
    //     };

// forEach
//     list.forEach((int value) {
//       print(value);
//     });
//     map.forEach((key, value) {
//       print('$key : $value');
//     });

    final listItems = [
      'Item 1',
      'Item 2',
      'Item 3',
    ];

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("サンプル一覧"),
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: false),
      body: Container(
          alignment: Alignment.center,
          child: ListView.builder(
            itemCount: SampleType.values.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  // test();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SampleType.values[index].navigator,
                    ),
                  );
                },
                child: Text(SampleType.values[index].buttonText),
              );
            },
          )

          // ListView(
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const BatteryLevelScreen(),
          //           ),
          //         );
          //       },
          //       child: const Text("バッテリーレベル取得"),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const ItemListPage(),
          //           ),
          //         );
          //       },
          //       child: const Text("TODOリストサンプル"),
          //     ),
          //   ],
          // ),

          ),
    );
  }
}
