import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
void main(){
  runApp(ProviderScope(child: RFutureProviderEx()));
}
class RFutureProviderEx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(''),),
        body: Center(
          child: BalanceConsumerWidget(),
        ),
      ),
    );
  }
}
final balanceProvider = FutureProvider.autoDispose<String>((ref) async{
  await Future.delayed(Duration(seconds: 3));
  int randomNum = Random().nextInt(100);
  switch(randomNum%2){
    case 0:
      return "\$5000";
    case 1:
      throw Exception('Network exception');
  }
  return '';
});
class BalanceConsumerWidget extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<String> config = ref.watch(balanceProvider);

    return config.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (text) {
        return Text(text);
      },
    );
  }
}