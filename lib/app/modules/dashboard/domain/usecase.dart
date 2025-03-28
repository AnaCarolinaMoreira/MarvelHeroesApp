import 'package:dartz/dartz.dart';
import 'package:marvelheroes_app/app/modules/dashboard/dashboard.dart';

abstract class DashboardUsecase {
  Future<Either<DashboardFailure, CharactersResponse>> getCharactersResponse();
}
