import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelheroes_app/app/core/mock/mock_dashboard.dart';
import 'package:marvelheroes_app/app/modules/dashboard/dashboard.dart';

DashboardFailure getFailureError(Response? response) {
  if (response == null) return DashboardUnkownError();
  switch (response.statusCode) {
    case 400:
      return DashboardRequestError(
          message: response.statusMessage, data: response.data);
    case 401:
      return DashboardUnauthorizedError(
          message: response.statusMessage, data: response.data);
    case 403:
      return DashboardForbiddenError(
          message: response.statusMessage, data: response.data);
    case 404:
      return DashboardRequestError(
          message: response.statusMessage, data: response.data);
    case 429:
      return DashboardRequestError(
          message: response.statusMessage, data: response.data);
    case 500:
      return DashboardInternalError(
          message: response.statusMessage, data: response.data);
    default:
      return DashboardUnkownError(
          message: response.statusMessage, data: response.data);
  }
}

class DashboardDatasourceImp implements DashboardDatasource {
  Dio client = Modular.get<Dio>();

  @override
  Future<Either<DashboardFailure, CharactersResponse>>
      getCharactersResponse() async {
    /* final Map<String, dynamic> _queryParameters = {
      "ts": 1,
      "apikey": ApiConstants.apiKey,
      "hash": ApiConstants.hash
    };
      /* ROUTE FORMAT
    characters => "?offset=5&"
    comics => "/1016823/comics"
  */
    const int limit = 30;
    var response = await _dio.get(
      GlobalVariables.url("?offset=${model.offset}&limit=$limit"),
      queryParameters: _queryParameters,
    ); */

    /* Response? response = await client.get(
      '${ApiRoutes.cep}$cep/json/',
    );*/

    final MockDashboard mockDashboard = MockDashboard();
    final Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: mockDashboard.getDashboardSuccess(),
        statusCode: 200);

    try {
      if (response == null ||
          response.statusCode != 200 ||
          response.data == null) {
        final DashboardFailure failure = getFailureError(response);
        return left(failure);
      } else {
        CharactersResponse charactersResponse =
            CharactersResponse.fromMap(response.data);
        return right(charactersResponse);
      }
    } catch (e) {
      return left(DashboardUnkownError(message: e.toString()));
    }
  }
}
