import 'package:dartz/dartz.dart';
import 'package:marvelheroes_app/app/modules/dashboard/dashboard.dart';

abstract class DashboardDatasource {
  Future<Either<DashboardFailure, CharactersResponse>> getCharactersResponse();
}
