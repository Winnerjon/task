import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../common/style/colors.dart';
import '../complaint/complaint_screen.dart';
import 'main_vm.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainVM(),
      child: Consumer<MainVM>(
        builder: (context, provider, child) {
          return Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: provider.pageController,
              children: const [
                Center(child: Text("Home"),),
                ComplaintScreen(),
                Center(child: Text("Add"),),
                Center(child: Text("Search"),),
                Center(child: Text("Profile"),),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: 57,
              child: Column(
                children: [
                  const Divider(
                    height: 1,
                    color: AppColor.nE6E8EB,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _bottomNav(provider, 0),
                      _bottomNav(provider, 1),
                      _bottomNav(provider, 2),
                      _bottomNav(provider, 3),
                      _bottomNav(provider, 4),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _bottomNav(MainVM pr, int index) {
    return IconButton(
      splashRadius: 25,
      onPressed: () => pr.onSelect(index),
      icon: SvgPicture.asset(
          "assets/icons/main_$index.svg",
        color: pr.currentIndex == index ? AppColor.n3A86FF : AppColor.nBFC5CD,
      ),
    );
  }
}
