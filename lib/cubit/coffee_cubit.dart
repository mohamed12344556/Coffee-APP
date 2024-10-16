import '../data/database_helper/sql_helper.dart';
import '../data/models/coffee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit({required this.databaseHelper}) : super(CoffeeInitial());

  final DatabaseHelper databaseHelper;

  Future<void> deleteCoffee(int id) async {
    try {
      emit(CoffeeLoading());
      await databaseHelper.deleteFDB(id: id);
      final coffees = await databaseHelper.readDB();
      emit(CoffeeLoaded(coffees: coffees));
    } on Exception catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }

  Future<void> updateCoffee(CoffeeModel coffee) async {
    try {
      emit(CoffeeLoading());
      await databaseHelper.updateDB(
        title: coffee.name,
        type: coffee.type,
        price: coffee.price,
        image: coffee.image,
        id: coffee.id,
      );
      final coffees = await databaseHelper.readDB();
      emit(CoffeeLoaded(coffees: coffees));
    } on Exception catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }

  Future<void> fetchCoffees() async {
    try {
      emit(CoffeeLoading());
      final coffees = await databaseHelper.readDB();
      emit(CoffeeLoaded(coffees: coffees));
    } on Exception catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }

  Future<void> addCoffee(CoffeeModel coffee) async {
    try {
      emit(CoffeeLoading());
      await databaseHelper.insertDB(
        name: coffee.name,
        type: coffee.type,
        price: coffee.price,
        image: coffee.type,
      );
      final coffees = await databaseHelper.readDB();
      emit(CoffeeLoaded(coffees: coffees));
    } on Exception catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }
}
