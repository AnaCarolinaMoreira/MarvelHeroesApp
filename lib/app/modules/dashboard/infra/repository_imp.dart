import 'package:dartz/dartz.dart';
import 'package:marvelheroes_app/app/modules/dashboard/dashboard.dart';

class DashboardRepositoryImp implements DashboardRepository {
  final DashboardDatasource datasource;
  DashboardRepositoryImp({required this.datasource});

  @override
  Future<Either<DashboardFailure, CharactersResponse>>
      getCharactersResponse() async {
    try {
      final result = await datasource.getCharactersResponse();
      return result.fold((l) {
        return left(l);
      }, (r) {
        return right(r);
      });
    } catch (e) {
      return left(DashboardUnkownError(message: e.toString()));
    }
  }
}
