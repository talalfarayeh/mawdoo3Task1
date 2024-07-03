import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as mp;

class ApiService {
  final String apiName;
  final Map<String, dynamic>? data;
  final String? singleValue;
  final mp.FormData? formData;
  final Map<String, dynamic>? queryParameters;

  ApiService({
    required this.apiName,
    this.data,
    this.formData,
    this.singleValue,
    this.queryParameters,
  });

  String get getEndPointURL => apiName;
  Dio _dio() {
    return Dio();
  }

  Future<void> get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    CancelToken? cancelToken,
    OptionsEnum? optionsEnum,
  }) async {
    try {
      await _dio()
          .get(getEndPointURL,
              options: getOptions(
                optionsEnum,
              ),
              data: singleValue ?? formData ?? data,
              queryParameters: queryParameters,
              cancelToken: cancelToken)
          .then((response) {
        if (onSuccess != null) onSuccess(response);
      });
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response?.statusCode == 401) {
          print('error 404');
        } else {
          if (onError != null) onError(error);
        }
      } else {
        if (onError != null) onError(error);
      }
    }
  }

  Options apiOptions({String? fcm}) {
    return Options(
      headers: {
        'fcmToken': fcm,
        'accept': '/',
        'Content-Type': 'application/json-patch+json',
      },
    );
  }

  Options? getOptions(OptionsEnum? optionsEnum, {String? fcm}) {
    switch (optionsEnum) {
      case OptionsEnum.login:
        return loginApiOptions();

      case OptionsEnum.normal:
        return apiOptions(fcm: fcm);
      default:
        return null;
    }
  }

  Options loginApiOptions() {
    return Options(
      sendTimeout: const Duration(milliseconds: 18 * 1000),
      receiveTimeout: const Duration(milliseconds: 18 * 1000),
      responseType: ResponseType.plain,
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
      },
    );
  }
}

enum OptionsEnum {
  login,
  loginOtp,
  auth,
  normal,
}
