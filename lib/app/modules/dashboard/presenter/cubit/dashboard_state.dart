import 'package:equatable/equatable.dart';
import 'package:marvelheroes_app/app/modules/dashboard/domain/errors.dart';
import 'package:marvelheroes_app/app/modules/dashboard/infra/model/characters_response_model/characters_response_model.dart';

abstract class DashboardState extends Equatable {}

class DashboardInitialState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardLoadingState extends DashboardState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class DashboardSuccessState extends DashboardState {
  CharactersResponse? charactersResponse;

  DashboardSuccessState({
    required this.charactersResponse,
  });

  @override
  List<Object> get props => [];
}

class DashboardErrorState extends DashboardState {
  final DashboardFailure failure;
  DashboardErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}
