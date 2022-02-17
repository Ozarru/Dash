import 'package:dash/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../widgets/input_field.dart';

class NewDispatch extends StatefulWidget {
  const NewDispatch({Key? key}) : super(key: key);

  @override
  _NewDispatchState createState() => _NewDispatchState();
}

class _NewDispatchState extends State<NewDispatch> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  final List<Map<String, dynamic>> _sizes = [
    {
      'value': 'extra-small',
      'label': 'Extra small',
    },
    {
      'value': 'small',
      'label': 'Small',
    },
    {
      'value': 'medium',
      'label': 'Medium',
    },
    {
      'value': 'medium-large',
      'label': 'Medium Large',
    },
    {
      'value': 'large',
      'label': 'Large',
    },
    {
      'value': 'extra-large',
      'label': 'Extra Large',
    },
    {
      'value': 'humongous',
      'label': "I need a truck",
    },
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: MyDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 16),
            Text('New dispatch', style: Theme.of(context).textTheme.headline2),
            SizedBox(height: 16),
            TextInputField(
              title: 'Package name *',
              hint: 'Name',
              controller: _nameController,
            ),
            TextInputField(
              title: 'Package type *',
              hint: 'what kind of package is it?',
              controller: _typeController,
            ),
            SelectFormField(
              type: SelectFormFieldType.dropdown, // or can be dialog
              initialValue: 'small',
              icon: Icon(TablerIcons.box),
              labelText: 'Package size',
              items: _sizes,
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
            ),
            NumInputField(
              title: 'Package weight *',
              hint: 'how heavy is it?',
              controller: _weightController,
            ),
            NumInputField(
              title: 'Number of packages *',
              hint: 'how many packages are there?',
              controller: _quantityController,
            ),
            SizedBox(height: 16),
            TextButton(
                onPressed: () {
                  _validate();
                },
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    primary: Colors.white,
                    padding: EdgeInsets.all(24)),
                child: Text('Get a dispatcher'))
          ],
        ),
      ));

  _validate() {
    if (_nameController.text.isEmpty ||
        _quantityController.text.isEmpty ||
        _weightController.text.isEmpty) {
      Get.snackbar('Required 🤨', 'All fields are required !!!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red[800],
          icon: Icon(Icons.warning_rounded, color: Colors.red));
    } else {
      // _addToDB();
      Get.snackbar('Nice 😎', 'Dispatch was ordered successfully !!!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: Colors.green[800],
          icon: Icon(Icons.check_circle, color: Colors.green));
      Get.toNamed('/dispatches');
    }
  }
}
