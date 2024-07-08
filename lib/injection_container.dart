import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  sl.allowReassignment = true;

  ///////////////
  ///! Bloc / Cubit
  ///////////////

  //? Movie List
  // sl.registerFactory(
  //   () => GetNowPlayingCubit(getNowPlayingUseCase: sl()),
  // );

  ///////////////
  //! Usecase
  ///////////////

  //? Movie List
  // sl.registerLazySingleton(
  //     () => GetNowPlayingUseCase(movieListRepository: sl()));

  ///////////////
  //! Repository
  ///////////////

  //? Movie List
  // sl.registerLazySingleton<MovieListRepository>(
  //   () => MovieListReposisoryImpl(movieListDataSource: sl()),
  // );

  ///////////////
  //! DataSource
  ///////////////

  //? Movie List
  // sl.registerLazySingleton<MovieListDataSource>(
  //   () => MovieListDataSourceImpl(baseApi: sl()),
  // );
}
