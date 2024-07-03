import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawdo333/models/data_model.dart';
import 'package:mawdo333/modules/chat/binding/chat_binding.dart';
import 'package:mawdo333/modules/chat/view/chat_view.dart';
import 'package:mawdo333/modules/home/controller/home_controller.dart';
import 'package:mawdo333/modules/login/binding/login_binding.dart';
import 'package:mawdo333/modules/login/view/login_view.dart';
import 'package:mawdo333/utils/constant/app_colors.dart';
import 'package:mawdo333/utils/constant/app_images.dart';
import 'package:mawdo333/utils/widgets/custom_text_field.dart';
import 'package:mawdo333/utils/widgets/loading.dart';
import 'package:mawdo333/utils/widgets/main_text.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final filteredData = <DataModel>[].obs;
    filteredData.value = controller.dataList;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.bg,
              fit: BoxFit.cover,
            ),
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: true,
                            hintText: 'Search by title',
                            activeBorderColor:
                                const Color.fromRGBO(20, 196, 123, 0.8),
                            suffixIcon: const Icon(Icons.search),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(Icons.search),
                            ),
                            controller: controller.searchController,
                            onChanged: (val) {
                              filteredData.value = controller.dataList
                                  .where((search) =>
                                      search.title
                                          ?.toLowerCase()
                                          .contains(val.toLowerCase()) ??
                                      false)
                                  .toList();
                            },
                          ).paddingOnly(top: 10),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.logout,
                            color: AppColors.white,
                          ),
                          onPressed: () async {
                            Get.offAll(() => const LoginView(),
                                binding: LoginBinding());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 16),
                          width: Get.width,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(29, 131, 135, 0.8),
                                Color.fromRGBO(20, 196, 123, 0.8)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const MainText(
                                        text: 'Id : ',
                                        fontSize: 16,
                                      ),
                                      MainText(
                                        text: filteredData[index].id.toString(),
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const MainText(
                                        text: 'User id : ',
                                        fontSize: 16,
                                      ),
                                      MainText(
                                        text: filteredData[index]
                                            .userId
                                            .toString(),
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 24),
                                child: MainText(
                                  text: filteredData[index].title ?? '',
                                  fontSize: 14,
                                ),
                              ),
                              MainText(
                                text: filteredData[index].body ?? '',
                                fontSize: 14,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Loading(
            appLoading: controller.appLoadingController,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => const ChatView(),
            binding: ChatBinding(),
            transition: Transition.downToUp,
          );
        },
        child: const Icon(
          Icons.chat,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
