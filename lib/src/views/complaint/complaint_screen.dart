import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/style/colors.dart';
import 'complaint_vm.dart';
import 'widget/category_widget.dart';
import 'widget/comment_widget.dart';
import 'widget/success_widget.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ComplaintVM(),
      child: Consumer<ComplaintVM>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 132,
              centerTitle: true,
              leading: Container(
                width: 20,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: IconButton(
                  onPressed: provider.back,
                  icon: Icon(
                    provider.currentIndex == 0 ? Icons.close : Icons.arrow_back,
                    size: 25,
                    color: AppColor.n011936,
                  ),
                ),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColor.nE6E8EB,
                    child: Text(
                      "K",
                      style: TextStyle(
                          color: AppColor.n011936,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Константин Володарский",
                    style: TextStyle(
                        color: AppColor.n011936,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                  height: 1,
                  color: AppColor.nE6E8EB,
                ),
              ),
            ),
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: provider.pageController,
              children: [
                CategoryWidget(pr: provider,),
                CommentWidget(pr: provider,),
                SuccessWidget(pr: provider,),
              ],
            ),
          );
        }
      ),
    );
  }
}
