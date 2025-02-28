import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_shimmer.dart';
import 'package:greengrocer/src/pages/home/controller/home_controller.dart';
import 'package:greengrocer/src/pages/home/view/components/category_tile.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;
import 'package:greengrocer/src/pages/home/view/components/item_tile.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  void initState() {
    super.initState();

    //Get.find<HomeController>().printExample(); Chama para teste
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: CustomColors.customContrastColor,
                label: Text(
                  '777',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: CustomColors.customContrastColorNomeApp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //PESQUISA
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Buscar por...',
                hintStyle: GoogleFonts.satisfy(
                  color: Colors.grey.shade400,
                  fontSize: 18,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
          //CATEGORIAS
          GetBuilder<HomeController>(
            builder: (controller) {
              return Container(
                padding: const EdgeInsets.only(left: 25),
                height: 40,
                child: !controller.isLoading
                    ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return CategoryTile(
                            onPressed: () {
                              controller.selectedCategory(
                                  controller.allCategories[index]);
                            },
                            category: controller.allCategories[index].title,
                            isSelected: controller.allCategories[index] ==
                                controller.currentCategory,
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(width: 10),
                        itemCount: controller.allCategories.length,
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          10,
                          (index) => Container(
                            margin: EdgeInsets.only(right: 12),
                            child: Align(
                              alignment: Alignment.center,
                              child: CustomShimmer(
                                height: 25,
                                width: 40,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
              );
            },
          ),
          //GRID
          GetBuilder<HomeController>(
            builder: (controller) {
              return Expanded(
                child: !controller.isLoading
                    ? GridView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                        ),
                        itemCount: app_data.items.length,
                        itemBuilder: (_, index) {
                          return ItemTile(
                            item: app_data.items[index],
                          );
                        },
                      )
                    : GridView.count(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                        children: List.generate(
                          10,
                          (index) => CustomShimmer(
                            height: double.infinity,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
