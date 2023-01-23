import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  late Failure failure;

  ErrorHandler.handle(Exception error) {
    if (error is DioError) {
      failure = _handleDioError(error);
    } else {
      failure = ErrorType.unKnown.getFailure();
    }
  }

  Failure _handleDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ErrorType.connectTimeOut.getFailure();
      case DioErrorType.sendTimeout:
        return ErrorType.sendTimeOut.getFailure();
      case DioErrorType.receiveTimeout:
        return ErrorType.receiveTimeOut.getFailure();
      case DioErrorType.response:
        {
          if (dioError.response?.statusMessage != null && dioError.response?.statusCode != null) {
            return Failure(dioError.response!.statusCode!, dioError.response!.data["message"]);
          } else {
            return ErrorType.unKnown.getFailure();
          }
        }
      case DioErrorType.cancel:
        return ErrorType.cancel.getFailure();
      case DioErrorType.other:
        return Failure(ResponseCode.unKnown, dioError.message);
    }
  }
}

enum ErrorType {
  cancel,
  connectTimeOut,
  receiveTimeOut,
  sendTimeOut,
  noInternetConnection,
  unKnown,
}

extension ErrorTypeException on ErrorType {
  Failure getFailure() {
    switch (this) {
      case ErrorType.connectTimeOut:
        return Failure(ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case ErrorType.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case ErrorType.receiveTimeOut:
        return Failure(ResponseCode.receiveTimeOut, ResponseMessage.receiveTimeOut);
      case ErrorType.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case ErrorType.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection);
      case ErrorType.unKnown:
        return Failure(ResponseCode.unKnown, ResponseMessage.unKnown);
    }
  }
}

class ResponseCode {
  static const int unAuthorized = 401;
  static const int cancel = -1;
  static const int connectTimeOut = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int noInternetConnection = -5;
  static const int unKnown = -6;
}

class ResponseMessage {
  static const String cancel = "AppStrings.requestCancelled";
  static const String connectTimeOut = "AppStrings.connectTimeout";
  static const String receiveTimeOut = "AppStrings.receiveTimeout";
  static const String sendTimeOut = "AppStrings.sendTimeOut";
  static const String noInternetConnection = "AppStrings.noInternet";
  static const String unKnown = "AppStrings.unknownError";
}
