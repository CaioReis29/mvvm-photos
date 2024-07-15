import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_example/repositories/photo_repository.dart';
import 'package:mvvm_example/viewmodels/photo_screen_viewmodel.dart';


GetIt getIt = GetIt.instance;

Future<void> setupInjection() async {
  await getIt.reset();

  final dio = Dio();

  getIt.registerLazySingleton<PhotoRepository>(() => PhotoRepository(dio: dio));

  getIt.registerFactory<PhotoScreenViewmodel>(() => PhotoScreenViewmodel(repository: getIt<PhotoRepository>()));

}