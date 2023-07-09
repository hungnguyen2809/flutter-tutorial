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
  final _contentControler = TextEditingController();
  final _amountControler = TextEditingController();

  String _content = '';
  String _amount = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // add observer
  }

  @override
  void dispose() {
    super.dispose();
    _contentControler.dispose();
    _amountControler.dispose();
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
          body: SafeArea(
            // minimum: const EdgeInsets.all(16.0),
            // minimum: const EdgeInsets.symmetric(horizontal: 16.0),
            // minimum: const EdgeInsets.only(left: 16.0),
            // minimum: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            // minimum: const EdgeInsets.only(
            //     left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _contentControler,
                  onChanged: (text) {
                    setState(() {
                      _content = text;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Content'),
                ),
                TextField(
                  controller: _amountControler,
                  onChanged: (text) {
                    setState(() {
                      _amount = text;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Amount(money)'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Insert Transaction'),
                )
              ],
            ),
          )),
    );
  }
}
