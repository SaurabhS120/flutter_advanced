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
        ChangeNotifierProvider(
          create: (context) => CounterNotifier(),
          builder: (context, child) {
            print('ChangeNotifierProvider build');
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Consumer<CounterNotifier>(builder: (context, CounterNotifier value, child) {
                    print("counsumer");
                    return Text(value.count.toString());
                  },
                  ),
                  SizedBox(height: 12,),
                  ElevatedButton(
                    onPressed: (){
                      context.read<CounterNotifier>().increament();
                    },
                    child: Text('Increament'),
                  ),
                  SizedBox(height: 12,),
                  ElevatedButton(
                    onPressed: (){
                      context.read<CounterNotifier>().decreament();
                    },
                    child: Text('Decreament'),
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
class CounterNotifier with ChangeNotifier{
  int count = 0;
  void increament(){
    count++;
    notifyListeners();
  }
  void decreament(){
    count--;
    notifyListeners();
  }
}