import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class updateForm extends StatefulWidget {
  @override
  State<updateForm> createState() => _updateFormState();
}

class _updateFormState extends State<updateForm> {
  CollectionReference petsCollection =
      FirebaseFirestore.instance.collection('Pets');

  @override
  Widget build(BuildContext context) {
    final petsData = ModalRoute.of(context)!.settings.arguments as dynamic;

    final nameController = TextEditingController(text: petsData['name']);
    final ageController = TextEditingController(text: petsData['age']);

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
                  'Update DATA',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    icon: Icon(Icons.title),
                  ),
                ),
                SizedBox(height: 10),
                 TextFormField(
                  controller: ageController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Age',
                    icon: Icon(Icons.numbers),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    petsCollection.doc(petsData.id).update({
                      'name': nameController.text,
                      'age' : ageController.text
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
