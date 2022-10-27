import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      ChangeNotifierEx()
  );
}
class ChangeNotifierEx extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>ChangeNofitierExState();
}
class ChangeNofitierExState extends State<ChangeNotifierEx>{
  @override
  Widget build(BuildContext context) {
    print('ChangeNofitierExState build');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Change notifier ex'),
        ),
        body:
        FutureProvider<int>(
          initialData: 0,
          create: (context) => test(),
          builder: (context, child) {
            print('ChangeNotifierProvider build');
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Consumer<int>(builder: (context, int value, child) {
                    print("counsumer");
                    return Text(value.toString());
                  },
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }

}
Future<int> test() async{
  await Future.delayed(Duration(seconds: 3));
  return 5;
}