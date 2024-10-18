import 'package:get_it/get_it.dart';

import '../../data/database_helper/sql_helper.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => DatabaseHelper());
}
