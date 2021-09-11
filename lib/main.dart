import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_studing/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProvider>(create: (_) => MyProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(context.watch<MyProvider>().defaultText),
          TextButton(
            onPressed: () {
              context.read<MyProvider>().changeText();
            },
            child: Text('テキストを変化させる'),
          ),
        ],
      ),
    ));
  }
}

//Provider側
//Todo
//todo:1 =>class 〇〇(任意のクラス名) extends ChangeNotifier {}
//todo:2 => {}の中に　〇〇(変数の型、例：String,bool) △△(任意の変数名) = 初期値(例：false,"初期値")
//todo:3 => 状態変化させる関数を書く
//todo  void 〇〇「任意の関数名」(){
//todo △△(任意の変数名) = □□(新規の値「例："New Text"」「△△がboolなら　!△△(任意の変数名)」)
//todo  notifyListener(); //おまじない
// }

//main.dartにてProvider定義
//todo main.dartのMaterialAppの上に
//todo  MultiProvider(
//todo       providers: [
//todo         ChangeNotifierProvider<〇〇(任意のクラス名)>(create: (_) => 〇〇(任意のクラス名)())
//<>のなかでどこの何のProviderを使うか定義する
//todo       ],

//UI側
//todo context.watch<〇〇(任意のクラス名)>().△△(任意の変数名)　にて状態を監視
//監視する状態は変数を監視する
//例：Text(context.watch<〇〇(任意のクラス名)>().△△(任意の変数名));
//todo context.read<〇〇(任意のクラス名)>().〇〇(任意の関数名)(); にてChangeNotifier の関数を叩く
//例：TextButton(
//             onPressed: () {
//               context.read<〇〇(任意のクラス名)>().〇〇(任意の関数名)();
//             },
//             child: Text('テキストを変化させる'),
//           );

//三項演算子
//todo: 〇〇(条件「例：「△△ == true,△△ != 0」) ? 条件の通りの場合の処理 : 条件の通りじゃない時の処理
//例1：　onPress == true ? Text("trueです"): Text("falseです")
//例2：　onPress != 0 ? Text("0じゃないです"): Text("0です")
