import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*
  Stateful Widget đc tạo thành từ 2 class:
  + public class đc kế thừa từ StatefulWidget
  + private class dùng để vẽ giao diện qua hàm build
*/

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp2();
  }
}

class _MyApp2 extends State<MyApp2> with WidgetsBindingObserver {
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
    DateTime now = DateTime.now();
    DateTime now2 = DateTime(2023, 10, 22);

    return MaterialApp(
      title: 'My App',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My App'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(now.toString()),
              Text(DateFormat('dd/MM/yyyy').format(now2)),
              Text(NumberFormat.currency(locale: 'vi_VN').format(123456789)),
              Text(NumberFormat('#,###.##', 'vi_VN').format(123456789)),
              Text(NumberFormat('###.0#', 'en_US').format(12.562356)),
            ],
          )),
    );
  }
}
