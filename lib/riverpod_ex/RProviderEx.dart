import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: RiverpodProviderEx()));
}
// final counterProvider = StateNotifierProvider<Counter, int>((ref) {
//   return Counter(ref);
// });
//
// class Counter extends StateNotifier<int> {
//   Counter(this.ref): super(0);
//
//   final Ref ref;
//
//   void increment() {
//     // Counter can use the "ref" to read other providers
//     final repository = ref.read(repositoryProvider);
//     repository.post('...');
//   }
// }
class RiverpodProviderEx extends ConsumerWidget {
  final counterProvider = StateProvider.autoDispose<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Riverpod provider ex'),
        ),
        body: Column(
          children: [
            Text("count " + ref.watch(counterProvider).toString()),
            ElevatedButton(onPressed: (){
                ref.read(counterProvider.notifier).state= ref.read(counterProvider.notifier).state+1;
            }, child: Text('Increament')),
          ],
        ),
      ),
    );
  }
}
