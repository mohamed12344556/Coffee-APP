part of 'coffee_cubit.dart';

@immutable
sealed class CoffeeState {}

final class CoffeeInitial extends CoffeeState {}

final class CoffeeLoading extends CoffeeState {}

final class CoffeeLoaded extends CoffeeState {
  final List<CoffeeModel> coffees;

  bool get isEmpty => coffees.isEmpty;
  
  CoffeeLoaded({required this.coffees});
}

final class CoffeeError extends CoffeeState {
  final String message;

  CoffeeError({required this.message});
}

final class CoffeeEmpty extends CoffeeState {
  CoffeeEmpty();
}

final class CoffeeUpdated extends CoffeeState {
  final CoffeeModel updatedCoffee;

  CoffeeUpdated({required this.updatedCoffee});
}