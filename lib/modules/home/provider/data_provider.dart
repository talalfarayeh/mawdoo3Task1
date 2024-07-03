import 'package:mawdo333/services/api_service.dart';

class DataProvider {
  Future<void> getData({
    Function()? beforeSend,
    Function(dynamic response)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    await ApiService(
      apiName: 'https://jsonplaceholder.typicode.com/posts',
    ).get(
      beforeSend: () async {
        return {if (beforeSend != null) await beforeSend()};
      },
      onSuccess: (response) => {if (onSuccess != null) onSuccess(response)},
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
