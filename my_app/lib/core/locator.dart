import 'package:get_it/get_it.dart';
import 'package:my_app/services/local_storage_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(localStorageService);
}
