import 'package:flutter/material.dart';

import '../../../common/style/colors.dart';
import '../complaint_vm.dart';

class CommentWidget extends StatefulWidget {
  final ComplaintVM pr;

  const CommentWidget({Key? key, required this.pr}) : super(key: key);

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.pr.category,
            style: const TextStyle(
                color: AppColor.n011936,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            """Отправьте жалобу, если пользователь рассылает рекламные сообщения, комментарии или другим способом распространяет рекламу в непредназначенных для этого местах.""",
            style: TextStyle(
                color: AppColor.n011936,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Комментарий (необязательно)",
            style: TextStyle(
                color: AppColor.n808C9A,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          Container(
            height: 112,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColor.nE6E8EB,
            ),
            child: TextField(
              controller: controller,
              maxLines: null,
              style: const TextStyle(
                  color: AppColor.n011936,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Опишите причину жалобы",
                  hintStyle: TextStyle(
                      color: AppColor.n808C9A,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          MaterialButton(
            height: 52,
            minWidth: double.infinity,
            color: AppColor.n3A86FF,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            onPressed: () {
              widget.pr.sendMessage(controller.text.toString());
              FocusScope.of(context).requestFocus(FocusNode());
              controller.clear();
            },
            child: widget.pr.isLoading
                ? const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColor.white,
                    ),
                  )
                : const Text(
                    "Отправить жалобу",
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
