import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawdo333/modules/chat/controller/chat_controller.dart';
import 'package:mawdo333/utils/constant/app_colors.dart';
import 'package:mawdo333/utils/constant/app_images.dart';
import 'package:mawdo333/utils/widgets/main_text.dart';

import '../../../utils/widgets/custom_text_field.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppImages.bg,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(height: Get.height * 0.06),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          )),
                      const MainText(
                        text: 'Chat Screen',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox()
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        final message = controller.messages[index];
                        return ListTile(
                          title: Align(
                            alignment: message.role == 'user'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: message.role == 'user'
                                    ? const Color(0xff1D8387)
                                    : Colors.grey[300],
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: Text(
                                message.content,
                                style: TextStyle(
                                  color: message.role == 'user'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                        controller: controller.textController,
                        hintText: 'Type here...',
                        activeBorderColor: const Color(0xff1D8387),
                      )),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: controller.sendMessage,
                        child: const Icon(
                          Icons.send,
                          color: Color(0xff1D8387),
                        ).paddingSymmetric(vertical: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
