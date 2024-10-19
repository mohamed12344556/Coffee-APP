import '../core/di/dependency_injection.dart';

import '../data/database_helper/sql_helper.dart';
import '../data/models/coffee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit({required DatabaseHelper databaseHelper})
      : super(CoffeeInitial());

  final databaseHelper = locator<DatabaseHelper>();

  /// Fetch all coffees from the database
  Future<void> fetchCoffees() async {
    try {
      emit(CoffeeLoading());
      final coffees = await databaseHelper.readDB();

      if (coffees.isEmpty) {
        emit(CoffeeEmpty());
      } else {
        emit(CoffeeLoaded(coffees: coffees));
      }
    } on Exception catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }

  /// Add a new coffee to the database
  Future<void> addCoffee(CoffeeModel coffee) async {
    try {
      emit(CoffeeLoading());
      await databaseHelper.insertDB(
        name: coffee.name,
        type: coffee.type,
        price: coffee.price,
        rate: coffee.rate, 
        image: coffee.image,
      );
      final coffees = await databaseHelper.readDB();

      if (coffees.isEmpty) {
        emit(CoffeeEmpty());
      } else {
        emit(CoffeeLoaded(coffees: coffees));
      }
    } on Exception catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }

  /// Delete a coffee by its ID
  Future<void> deleteCoffee(int id) async {
    try {
      emit(CoffeeLoading());
      await databaseHelper.deleteFDB(id: id);
      final coffees = await databaseHelper.readDB();

      if (coffees.isEmpty) {
        emit(CoffeeEmpty());
      } else {
        emit(CoffeeLoaded(coffees: coffees));
      }
    } on Exception catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }

  /// Update an existing coffee
  Future<void> updateCoffee(CoffeeModel coffee) async {
    try {
      emit(CoffeeLoading());
      await databaseHelper.updateDB(
        name: coffee.name,
        type: coffee.type,
        price: coffee.price,
        image: coffee.image,
        id: coffee.id,
        rate: coffee.rate, // Add rate if required
      );
      final coffees = await databaseHelper.readDB();

      if (coffees.isEmpty) {
        emit(CoffeeEmpty());
      } else {
        emit(CoffeeLoaded(coffees: coffees));
      }
    } on Exception catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }
}
