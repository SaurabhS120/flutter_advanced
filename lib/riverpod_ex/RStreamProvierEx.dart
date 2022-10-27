import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(
    ProviderScope(child: RStreamProvierEx())
  );
}
var nearbyDestinations = StreamProvider.autoDispose((ref) => Stream.value(['Mulshi','Sinhgad treak','Bird velly guarden','Mulshi','Pawana night camping']));
class RStreamProvierEx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text('RStreamProvierEx')),
        body:Center(
          child: NearByDestinationsWidget()
        ),
      ),
    );
  }

}
class NearByDestinationsWidget extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var destinations = ref.watch(nearbyDestinations);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nearby travel destinations : ',style: TextStyle(fontWeight: FontWeight.bold),),
        ListView(
          shrinkWrap: true,
          children: [
            for(var d in destinations.value??[])
              Text(d),
          ],
        ),
      ],
    );
  }

}