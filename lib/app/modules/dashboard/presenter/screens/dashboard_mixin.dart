import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelheroes_app/app/modules/dashboard/dashboard.dart';

mixin DashboardMixin {
  final DashboardCubit cubit = Modular.get<DashboardCubit>();
  List<Result> resultsList = [];
}
