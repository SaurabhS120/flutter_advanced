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
        StreamProvider<CounterState>(
          initialData: CounterState(),
          create: (context) => increament(),
          builder: (context, child) {
            print('ChangeNotifierProvider build');
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Consumer<CounterState>(builder: (context, CounterState value, child) {
                    print("counsumer");
                    return Text(value.count.toString());
                  },
                  ),
                  SizedBox(height: 12,),
                  Consumer<CounterState>(
                    builder: (context, CounterState value, child) {
                      return ElevatedButton(
                        onPressed: value.finished?(){increament();}:null,
                        child: Text('Increament'),
                      );
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
Stream<CounterState> increament(){
  return Stream<CounterState>.periodic(Duration(seconds: 1),(computationCount) => CounterState(count: computationCount,finished: computationCount==9),)
      .take(10);
}
class CounterState{
  int count;
  bool finished;
  CounterState({this.count=0,this.finished=true});
}