import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawdo333/models/data_model.dart';
import 'package:mawdo333/modules/home/provider/data_provider.dart';
import 'package:mawdo333/utils/widgets/loading.dart';

class HomeController extends GetxController {
  AppLoadingController appLoadingController = AppLoadingController();
  TextEditingController searchController = TextEditingController();
  RxList<DataModel> dataList = <DataModel>[].obs;

  @override
  Future<void> onReady() async {
    super.onReady();
    await getData();
  }

  Future<void> getData() async {
    appLoadingController.loading();
    DataProvider().getData(
      onSuccess: (response) async {
        appLoadingController.stop();
        try {
          dataList.value = RxList<DataModel>.from(
            (response.data as List).map((x) => DataModel.fromJson(x)).toList(),
          );
          print(response);
        } catch (e) {
          print("Error parsing data: $e");
        }
      },
      onError: (error) {
        appLoadingController.stop();
        print(error);
      },
    );
  }
}
