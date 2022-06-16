import 'package:flutter/material.dart';
import 'package:purchase_list/food.dart';
import 'package:purchase_list/main.dart';

class AddItem extends StatelessWidget {
  AddItem({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          title: const ListTile(
            leading: Icon(
              Icons.monetization_on,
              color: Colors.white,
            ),
            title: Text(
              'Add item',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldsWidget(
                controller: nameController,
                labelText: 'Which product do you wanna buy? Ex: Water'),
            TextFieldsWidget(
                controller: typeController,
                labelText: 'What is the type of product? Ex: Drinks'),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: TextButton(
                  onPressed: () {
                    if (nameController.text != '' && nameController != null) {
                      Food newFood = Food(
                          name: nameController.text, type: typeController.text);
                      Navigator.of(context).pop<Food>(newFood);
                    } else {}
                  },
                  child: const Text(
                    'Add to list',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class TextFieldsWidget extends StatelessWidget {
  const TextFieldsWidget(
      {Key? key, required this.controller, required this.labelText})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: labelText),
        controller: controller,
      ),
    );
  }
}
