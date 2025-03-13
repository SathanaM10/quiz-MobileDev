import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addForm extends StatefulWidget {
  @override
  State<addForm> createState() => _addFormState();
}

class _addFormState extends State<addForm> {
  final nameController = TextEditingController();
  final breedController = TextEditingController();
  final ageController = TextEditingController();

  CollectionReference petsCollection =
      FirebaseFirestore.instance.collection('Pets');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 136, 137, 1),
        title: Center(
          child: Text(
            'Pets WIKI',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Column(
              children: [
                Text(
                  'Add DATA',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Add a Name',
                    icon: Icon(Icons.title),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: breedController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'breed',
                    icon: Icon(Icons.description),
                  ),
                ),
                SizedBox(height: 10),
                 TextFormField(
                  controller: ageController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Pls input age your Pets',
                    icon: Icon(Icons.numbers),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    petsCollection.add({
                      'name': nameController.text,
                      'breed': breedController.text,
                      'age': ageController.text
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
