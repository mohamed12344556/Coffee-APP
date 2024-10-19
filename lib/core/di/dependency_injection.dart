import 'package:coffee_shop_app/data/models/coffee_model.dart';
import 'package:get_it/get_it.dart';

import '../../data/database_helper/sql_helper.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => DatabaseHelper());
  locator.registerLazySingleton(
    () => CoffeeModel.fromMap(
        locator<DatabaseHelper>().readDB() as Map<String, dynamic>),
  );
}
