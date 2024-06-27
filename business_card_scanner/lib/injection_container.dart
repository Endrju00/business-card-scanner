import 'package:core/secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:settings/settings.dart';

final getIt = GetIt.instance;

void setup() {
  _setupExternalServices();
  _setupSettings();
}

void _setupSettings() {
  // Use cases
  getIt.registerLazySingleton(() => GetLocale(getIt()));
  getIt.registerLazySingleton(() => SaveLocale(getIt()));

  // Repositories
  getIt.registerLazySingleton<ILocaleRepository>(
      () => LocaleRepository(localDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<ISettingsLocalDataSource>(
      () => SettingsLocalDataSource(storage: getIt()));
}

void _setupExternalServices() {
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
}
