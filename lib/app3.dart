import 'package:flutter/material.dart';
import 'package:my_app/model/transaction.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _contentControler = TextEditingController();
  final _amountControler = TextEditingController();

  String _content = '';
  double _amount = 0;
  final List<Transaction> _transactions = [];

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
          key: _scaffoldKey,
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
                      _amount = double.tryParse(text) ?? 0;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Amount(money)'),
                ),
                TextButton(
                  onPressed: () {
                    // print(_content);
                    // print(_amount);

                    // _scaffoldKey.currentState!.showSnackBar(SnackBar(
                    //   content: Text(
                    //       'Insert Transaction Successfully: $_content - $_amount'),
                    //   duration: const Duration(seconds: 1),
                    // ));

                    setState(() {
                      _transactions
                          .add(Transaction(content: _content, amount: _amount));

                      _contentControler.clear();
                      _amountControler.clear();
                    });

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Insert Transaction Successfully: $_content - $_amount'),
                      duration: const Duration(seconds: 1),
                    ));
                  },
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
