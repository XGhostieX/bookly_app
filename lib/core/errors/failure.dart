import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;

  Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection Timeout with Api Server');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout with Api Server');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timeout with Api Server');
      case DioErrorType.badCertificate:
        return ServerFailure('badCertificate with Api Server');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to Api Server Was Cancelled');
      case DioErrorType.connectionError:
        return ServerFailure('Connection Error with Api Server');
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Unexpected Error, Please Try Again Later');
        }
      default:
        return ServerFailure(
            'Opps There Were an Error, Please Try Again Later');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Request not Found, Please Try Again Later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please Try Again Later');
    } else {
      return ServerFailure('Opps There Were an Error, Please Try Again Later');
    }
  }
}
