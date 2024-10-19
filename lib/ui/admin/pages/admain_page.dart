import 'package:coffee_shop_app/ui/pages/welcome_page.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../data/database_helper/sql_helper.dart';
import '../../../data/models/coffee_model.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  static const String id = "admin_page";

  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  List<CoffeeModel> _coffeeList = [];
  CoffeeModel? _selectedCoffee;
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    _fetchCoffees();
  }

  Future<void> _fetchCoffees() async {
    final coffees = await locator<DatabaseHelper>().readDB();
    setState(() {
      _coffeeList = coffees;
    });
  }

  void _resetForm() {
    _nameController.clear();
    _typeController.clear();
    _priceController.clear();
    _rateController.clear();
    _imageController.clear();
    setState(() {
      _selectedCoffee = null;
      isEditMode = false;
    });
  }

  Future<void> _addCoffee() async {
    if (_formKey.currentState!.validate()) {
      await locator<DatabaseHelper>().insertDB(
        rate: double.parse(_rateController.text),
        name: _nameController.text,
        type: _typeController.text,
        price: double.parse(_priceController.text),
        image: _imageController.text,
      );
      _fetchCoffees();
      _resetForm();
    }
  }

  Future<void> _editCoffee() async {
    if (_formKey.currentState!.validate() && _selectedCoffee != null) {
      await locator<DatabaseHelper>().updateDB(
        rate: double.parse(_rateController.text),
        name: _nameController.text,
        type: _typeController.text,
        price: double.parse(_priceController.text),
        image: _imageController.text,
        id: _selectedCoffee!.id,
      );
      _fetchCoffees();
      _resetForm();
    }
  }

  Future<void> _deleteCoffee(int id) async {
    await locator<DatabaseHelper>().deleteFDB(id: id);
    _fetchCoffees();
  }

  void _populateFields(CoffeeModel coffee) {
    _nameController.text = coffee.name;
    _typeController.text = coffee.type;
    _priceController.text = coffee.price.toString();
    _rateController.text = coffee.rate.toString();
    _imageController.text = coffee.image;
    setState(() {
      _selectedCoffee = coffee;
      isEditMode = true;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _priceController.dispose();
    _rateController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin - Manage Coffee',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, WelcomePage.id);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration:
                          const InputDecoration(labelText: 'Coffee Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a coffee name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _typeController,
                      decoration: const InputDecoration(labelText: 'Type'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the type';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the price';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _rateController,
                      decoration: const InputDecoration(labelText: 'Rate'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Rate';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _imageController,
                      decoration:
                          const InputDecoration(labelText: 'Image Path'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the image path';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: isEditMode ? _editCoffee : _addCoffee,
                          child:
                              Text(isEditMode ? 'Update Coffee' : 'Add Coffee'),
                        ),
                        if (isEditMode)
                          ElevatedButton(
                            onPressed: _resetForm,
                            child: const Text('Cancel'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _coffeeList.length,
                itemBuilder: (context, index) {
                  final coffee = _coffeeList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(coffee.image),
                    ),
                    title: Text(coffee.name),
                    subtitle: Text(coffee.type),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                          onPressed: () => _populateFields(coffee),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () => _deleteCoffee(coffee.id),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
