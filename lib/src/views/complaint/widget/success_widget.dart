import 'package:flutter/material.dart';

import '../../../common/style/colors.dart';
import '../complaint_vm.dart';

class SuccessWidget extends StatelessWidget {
  final ComplaintVM pr;
  const SuccessWidget({Key? key, required this.pr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/images/check_success.png"),
            height: 64,
            width: 64,
          ),
          const SizedBox(height: 24,),
          const Text(
            "Спасибо!",
            style: TextStyle(
                color: AppColor.n011936,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12,),
          const Text(
            "Модераторы скоро рассмотрят вашу жалобу.",
            style: TextStyle(
                color: AppColor.n011936,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 24,),
          MaterialButton(
            height: 52,
            minWidth: double.infinity,
            color: AppColor.n3A86FF,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)),
            onPressed: () => pr.navigator("", 0),
            child: const Text(
              "Закрыть",
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
