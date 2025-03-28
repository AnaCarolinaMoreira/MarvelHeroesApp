//flutter_modular
import 'package:dio/dio.dart';
//flutter_modular
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelheroes_app/app/modules/splash/screen/splash_screen.dart';
//shared_preferences
import 'package:shared_preferences/shared_preferences.dart';
// onboarding
import 'package:marvelheroes_app/app/modules/dashboard/dashboard.dart';

class AppModule extends Module {
  final SharedPreferences onboardingSharedPreferences;

  AppModule({
    required this.onboardingSharedPreferences,
  });
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        // login
        Bind.lazySingleton((i) => DashboardCubit(
            initialState: DashboardInitialState(),
            usecase: Modular.get<DashboardUsecase>())),
        Bind.lazySingleton<DashboardUsecase>(((i) => DashboardUsecaseImp(
            repository: Modular.get<DashboardRepository>()))),
        Bind.lazySingleton<DashboardRepository>((i) => DashboardRepositoryImp(
            datasource: Modular.get<DashboardDatasource>())),
        Bind.lazySingleton<DashboardDatasource>(
            (i) => DashboardDatasourceImp()),
      ];
  @override
  List<ModularRoute> get routes => [
        // splash
        ChildRoute('/', child: (context, args) => const SplashScreen()),
        ChildRoute('/dashboard',
            child: (context, args) => const DashboardScreen()),
      ];
}
