import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/*
  Stateful Widget đc tạo thành từ 2 class:
  + public class đc kế thừa từ StatefulWidget
  + private class dùng để vẽ giao diện qua hàm build
*/

class MyApp extends StatefulWidget {
  String name;
  int age;

  MyApp({super.key, required this.name, required this.age});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> with WidgetsBindingObserver {
  /* 
    When a Widget State created and running, there a 3 function will be called:
    + initState(): called when widget created (after constructor)
    + build(): called when widget created and updated
    + dispose(): called when widget destroyed
  */

  String _email = ''; // this is state

  final emailEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // add observer

    if (kDebugMode) {
      print('initState');
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this); // remove observer
    emailEditingController.dispose();

    if (kDebugMode) {
      print('dispose ');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build');
    }

    return MaterialApp(
      title: 'My App',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //mainAxisAlignment: chiều cột
          crossAxisAlignment:
              CrossAxisAlignment.center, // mainAxisAlignment: chiều hàng
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                controller: emailEditingController,
                onChanged: (text) {
                  setState(() {
                    _email = text;
                  });
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Enter your email'),
              ),
            ),
            Text(
              'Email: $_email',
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
            Text(
              'Name ${widget.name} - Age: ${widget.age}',
              style: const TextStyle(fontSize: 20, color: Colors.greenAccent),
            )
          ],
        ),
      ),
    );
  }

  /*
    When I khown the app in background or foreground (active or inactive) mode
    with WidgetsBindingObserver (with = interface in java)
  */

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      // app in background
      print('app in background');
    }

    if (state == AppLifecycleState.resumed) {
      // app in foreground
      print('app in foreground');
    }

    if (kDebugMode) {
      print('didChangeAppLifecycleState: $state');
    }
  }
}
