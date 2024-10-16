part of 'coffee_cubit.dart';

@immutable
sealed class CoffeeState {}

final class CoffeeInitial extends CoffeeState {}

final class CoffeeLoading extends CoffeeState {}

final class CoffeeLoaded extends CoffeeState {
  final List<Coffee> coffees;

  CoffeeLoaded({required this.coffees});
}

final class CoffeeError extends CoffeeState {
  final String message;

  CoffeeError({required this.message});
}

final class CoffeeAdded extends CoffeeState {
  final Coffee coffee;

  CoffeeAdded({required this.coffee});
}
