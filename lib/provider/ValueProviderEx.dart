import 'package:flutter/material.dart';
import 'package:flutter_advanced/provider/ChangeNotifierEx.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierEx());
}

class ChangeNotifierEx extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangeNofitierExState();
}

class ChangeNofitierExState extends State<ChangeNotifierEx> {
  @override
  Widget build(BuildContext context) {
    print('ChangeNofitierExState build');
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Change notifier ex'),
          ),
          body: Provider<CounterNotifier>(
            create: (context) => CounterNotifier(),
            child:Consumer<CounterNotifier>(
              builder: (context, countNotifier, child) {
                return Column(
                  children: [
                    ValueListenableProvider<int>.value(
                      value: countNotifier.count,
                      child: Consumer<int>(
                        builder: (context, value, child) {
                          return Text(value.toString());
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        countNotifier.increament();
                      },
                      child: Text('Increament'),
                    )
                  ],
                );
              },
            ),
          )),
    );
  }
}

class CounterNotifier {
  var count = ValueNotifier(0);

  void increament() {
    count.value++;
    count.notifyListeners();
  }

  void decreament() {
    count.value--;
    count.notifyListeners();
  }
}
