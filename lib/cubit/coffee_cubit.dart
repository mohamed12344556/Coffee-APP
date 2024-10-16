import 'package:coffee_shop_app/data/database_helper/sql_helper.dart';
import 'package:coffee_shop_app/data/models/coffee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit({required this.databaseHelper}) : super(CoffeeInitial());

  final DatabaseHelper databaseHelper;

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
          title: coffee.name, description: coffee.type);
      final coffees = await databaseHelper.readDB();
      emit(CoffeeLoaded(coffees: coffees));
    } on Exception catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }
}
