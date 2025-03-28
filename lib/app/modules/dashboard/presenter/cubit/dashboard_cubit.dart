import 'package:bloc/bloc.dart';
import 'package:marvelheroes_app/app/modules/dashboard/domain/errors.dart';
import 'package:marvelheroes_app/app/modules/dashboard/domain/usecase.dart';
import 'package:marvelheroes_app/app/modules/dashboard/infra/model/characters_response.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/cubit/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardUsecase usecase;
  DashboardCubit({required this.usecase, required DashboardState initialState})
      : super(initialState);
  CharactersResponse? charactersResponse;

  void resetState() {
    emit(DashboardInitialState());
  }

  void cleanState() {
    emit(DashboardInitialState());
    charactersResponse = null;
  }

  void emitSuccess() {
    emit(DashboardSuccessState(
      charactersResponse: charactersResponse,
    ));
  }

  Future<void> getCharactersResponse() async {
    try {
      emit(DashboardLoadingState());
      final result = await usecase.getCharactersResponse();
      result.fold((l) {
        emit(DashboardErrorState(l));
        return;
      }, (r) {
        charactersResponse = r;
        emitSuccess();
        return;
      });
    } catch (e) {
      emit(DashboardErrorState(DashboardUnkownError(message: e.toString())));
    }
  }
}
