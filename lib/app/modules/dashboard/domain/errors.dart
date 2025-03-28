abstract class DashboardFailure implements Exception {
  String? get message;
  String? get code;
  get data;
}

class DashboardRequestError implements DashboardFailure {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic data;
  DashboardRequestError({this.message, this.code, this.data});
}

class DashboardUnauthorizedError implements DashboardFailure {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic data;
  DashboardUnauthorizedError({this.message, this.code, this.data});
}

class DashboardForbiddenError implements DashboardFailure {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic data;
  DashboardForbiddenError({this.message, this.code, this.data});
}

class DashboardInternalError implements DashboardFailure {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic data;
  DashboardInternalError({this.message, this.code, this.data});
}

class DashboardUnkownError implements DashboardFailure {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic data;
  DashboardUnkownError({this.message, this.code, this.data});
}
