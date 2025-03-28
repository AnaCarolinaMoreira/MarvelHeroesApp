import 'package:dartz/dartz.dart';
import 'package:marvelheroes_app/app/modules/dashboard/dashboard.dart';

class DashboardUsecaseImp implements DashboardUsecase {
  final DashboardRepository repository;

  DashboardUsecaseImp({required this.repository});

  @override
  Future<Either<DashboardFailure, CharactersResponse>>
      getCharactersResponse() async {
    try {
      final result = await repository.getCharactersResponse();
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
