import 'package:coffee_shop_app/data/models/coffee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit() : super(CoffeeInitial());
}
