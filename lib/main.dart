import 'package:flutter/material.dart';
import 'add_item.dart';
import 'food.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  final List<Food> _foods = [];
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 116, 151, 84),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15))),
            title: const ListTile(
              leading: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Shopping List',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 116, 151, 84),
            onPressed: (() {
              addFood(context);
            }),
            child: const Text('Add')),
        body: SingleChildScrollView(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget._foods.length,
              itemBuilder: buildItem),
        ));
  }

  Widget buildItem(context, index) {
    final food = widget._foods[index];
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
          color: Colors.red,
          child: const Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(Icons.delete, color: Colors.white),
          )),
      direction: DismissDirection.startToEnd,
      child: ListTile(
        title: Text(widget._foods[index].name),
        subtitle: Text(widget._foods[index].type),
      ),
      onDismissed: (startToEnd) {
        widget._foods.removeAt(index);
      },
    );
  }

  Future<void> addFood(BuildContext context) async {
    Food? food = await Navigator.push<Food>(
        context, MaterialPageRoute(builder: (context) => AddItem()));
    if (food != null ) {
      setState(() {
        widget._foods.add(food);
        widget._foods.sort((previews, next) {
          return previews.type.compareTo(next.type);
        });
      });
    } else {}
  }
}
