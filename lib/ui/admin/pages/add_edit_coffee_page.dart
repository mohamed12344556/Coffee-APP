import '../../../cubit/coffee_cubit.dart';
import '../../../data/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddEditCoffeePage extends StatefulWidget {
  final CoffeeModel? coffee;

  const AddEditCoffeePage({super.key, this.coffee});

  @override
  State<AddEditCoffeePage> createState() => _AddEditCoffeePageState();
}

class _AddEditCoffeePageState extends State<AddEditCoffeePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _typeController;
  late TextEditingController _priceController;
  late TextEditingController _imageController;
  late TextEditingController _rateController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.coffee?.name ?? '');
    _typeController = TextEditingController(text: widget.coffee?.type ?? '');
    _priceController = TextEditingController(text: widget.coffee?.price.toString() ?? '');
    _imageController = TextEditingController(text: widget.coffee?.image ?? '');
    _rateController = TextEditingController(text: widget.coffee?.rate.toString() ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _priceController.dispose();
    _imageController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  void _saveCoffee() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final type = _typeController.text.trim();
      final price = double.parse(_priceController.text.trim());
      final image = _imageController.text.trim();
      final rate = double.parse(_rateController.text.trim());

      final coffee = CoffeeModel(
        id: widget.coffee?.id ?? 0, 
        name: name,
        type: type,
        price: price,
        image: image,
        rate: rate,
      );

      if (widget.coffee == null) {
        context.read<CoffeeCubit>().addCoffee(coffee);
      } else {
        context.read<CoffeeCubit>().updateCoffee(coffee);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.coffee != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Coffee' : 'Add Coffee'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Coffee Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter coffee name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _typeController,
                decoration: const InputDecoration(
                  labelText: 'Type',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter coffee type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                  labelText: 'Image Path',
                  border: OutlineInputBorder(),
                  hintText: 'e.g., assets/images/coffee.png',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter image path';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _rateController,
                decoration: const InputDecoration(
                  labelText: 'Rate',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter rate';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveCoffee,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(isEditing ? 'Update Coffee' : 'Add Coffee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
