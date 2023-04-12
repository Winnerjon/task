import 'package:flutter/material.dart';

import '../../../common/style/colors.dart';
import '../complaint_vm.dart';

class CategoryWidget extends StatefulWidget {
  final ComplaintVM pr;
  const CategoryWidget({Key? key, required this.pr}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<String> categories = [
    "Спам",
    "Мошенничество",
    "Оскорбления",
    "Откровенное изображение",
    "Проблема с профилем",
    "Нарушение интеллектуальных прав",
    "Прочее",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          const Text(
            "Что на странице Контантина кажется вам недопустимым?",
            style: TextStyle(
                color: AppColor.n011936,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => widget.pr.navigator(categories[index], 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      categories[index],
                      style: const TextStyle(
                          color: AppColor.n011936,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
