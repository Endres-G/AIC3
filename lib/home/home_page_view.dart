import 'package:aic_lll/core/themes/app_assets.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:aic_lll/home/view/home_view.dart';
import 'package:aic_lll/home/view/my_profile_view.dart';
import 'package:aic_lll/home/view/products_list.dart';
import 'package:aic_lll/home/view/request_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePageView extends GetView<HomeController> {
  HomePageView({super.key});

  final PageController _pageController = PageController();

  final RxBool isFetched = false.obs; // Controla se o fetch foi feito
  final RxInt currentIndex = 0.obs;

  void _onItemTapped(int index) {
    controller.currentIndex.value = index; // Atualiza o índice no controlador
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          currentIndex.value = index; // Atualiza o índice
          // Chama o fetch quando for para a página 2
          // if (index == 2 && !isFetched.value) {
          //   controller.fetchProducts();
          //   isFetched.value = true; // Marca o fetch como feito
          // }
        },
        children: const [
          HomeView(), // A HomeView é a primeira página
          RequestList(),
          ProductsList(),
          Center(
              child: Text(
            'Tela 3',
            style: TextStyle(fontSize: 50),
          )),
          MyProfileView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 75,
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Column(
            children: [
              Container(
                height: 1,
                color: Colors.grey,
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(
                    () => IconButton(
                      icon: SvgPicture.asset(
                        AppAssets.homeIcon,
                        height: 24,
                        width: 24,
                        color: controller.currentIndex.value == 0
                            ? Colors.blue
                            : Colors.black,
                      ),
                      onPressed: () => _onItemTapped(0),
                    ),
                  ),
                  Obx(
                    () => IconButton(
                      icon: SvgPicture.asset(
                        AppAssets.newProdIcon,
                        height: 24,
                        width: 24,
                        color: controller.currentIndex.value == 1
                            ? Colors.blue
                            : Colors.black,
                      ),
                      onPressed: () => _onItemTapped(1),
                    ),
                  ),
                  Obx(
                    () => IconButton(
                      icon: SvgPicture.asset(
                        AppAssets.pedidos,
                        height: 24,
                        width: 24,
                        color: controller.currentIndex.value == 2
                            ? Colors.blue
                            : Colors.black,
                      ),
                      onPressed: () => _onItemTapped(2),
                    ),
                  ),
                  Obx(
                    () => IconButton(
                      icon: SvgPicture.asset(
                        AppAssets.salesIcon,
                        height: 24,
                        width: 24,
                        color: controller.currentIndex.value == 3
                            ? Colors.blue
                            : Colors.black,
                      ),
                      onPressed: () => _onItemTapped(3),
                    ),
                  ),
                  Obx(
                    () => IconButton(
                      icon: SvgPicture.asset(
                        AppAssets.profileIcon,
                        height: 24,
                        width: 24,
                        color: controller.currentIndex.value == 4
                            ? Colors.blue
                            : Colors.black,
                      ),
                      onPressed: () => _onItemTapped(4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
