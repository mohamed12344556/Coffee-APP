import 'package:coffee_shop_app/data/database_helper/sql_helper.dart';
import 'package:coffee_shop_app/data/models/coffee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit({required this.databaseHelper}) : super(CoffeeInitial());

  final DatabaseHelper databaseHelper;
  Future<List<Coffee>> fetchCoffees() async {
    emit(CoffeeLoading());
    List<Coffee> coffees = await databaseHelper.getAllCoffees();
    emit(CoffeeLoaded(coffees: coffees));
  }

  Future<void> addCoffee(Map<String, dynamic> coffee) async {
    await databaseHelper.addCoffee(coffee);
    fetchCoffees();
  }
}
