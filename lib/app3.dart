import 'package:flutter/material.dart';

/*
  Stateful Widget đc tạo thành từ 2 class:
  + public class đc kế thừa từ StatefulWidget
  + private class dùng để vẽ giao diện qua hàm build
*/

class MyApp3 extends StatefulWidget {
  const MyApp3({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp3();
  }
}

class _MyApp3 extends State<MyApp3> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // add observer
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this); // remove observer
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My App'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(labelText: 'Content'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Amount(money)'),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Text('Insert transaction'),
              ),
            ],
          )),
    );
  }
}
