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
          MultiProvider(
            providers: [
                ChangeNotifierProvider<DummyProvider>(create: (context) => DummyProvider(5),),
              ChangeNotifierProxyProvider<DummyProvider,SquareNum>(create: (context) => SquareNum(0), update: (context, DummyProvider dummyProvider, previous) {
                return SquareNum(dummyProvider.num);

              },)
            ],
            child:Center(
              child: Consumer<DummyProvider>(
                builder: (context, dummyProvider, child) {
                  return Consumer<SquareNum>(
                    builder: (context, squareNum, child) {
                      return Text('Square of ${dummyProvider.num} is ${squareNum.square}');
                      } ,
                  );
                  },
              ),
            ),
          )
      ),
    );
  }

}
class DummyProvider extends ChangeNotifier{
  int num;
  DummyProvider(this.num);
}
class SquareNum extends ChangeNotifier{
  int _num;
  int square=0;
  SquareNum(this._num){
    square = _num*_num;
  }
}