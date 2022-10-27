import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main(){
  runApp(ProviderScope(child: RStateNotifierEx()));
}
class RStateNotifierEx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text('RStateNotifierEx')),
        body: Center(child: InventoryWidget()),
      ),
    );
  }
}
@immutable
class InventoryItem{
  int id;
  String name;
  InventoryItem(this.id,this.name);
}
class Inventory extends StateNotifier<List<InventoryItem>>{
  int _new_id_counter=0;

  Inventory():super([]);


  void addItem(String itemName){
    state=[...state,InventoryItem(_new_id_counter++,itemName)];
  }

}
var inventoryNotifier = StateNotifierProvider.autoDispose <Inventory,List<InventoryItem>>((ref){
    return Inventory();
});
class InventoryWidget extends ConsumerWidget{

  var itemNameController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var inventoryItems = ref.watch(inventoryNotifier);
    return  Column(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            for(var inventoryItem in inventoryItems)
              Text(inventoryItem.name)
          ],
        ),
        Form(
          child: Column(
            children: [
              TextFormField(controller: itemNameController,),
              ElevatedButton(onPressed: (){
                var name = itemNameController.text;
                // itemNameController.clear();
                ref.read(inventoryNotifier.notifier).addItem(name);
              }, child: Text('Add'))
            ],
          ),
        ),
      ],
    );
  }

}