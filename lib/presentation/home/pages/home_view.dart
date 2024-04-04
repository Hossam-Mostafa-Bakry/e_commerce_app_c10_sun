import 'package:e_commerce_app_c10_sun/core/extenions/padding_ext.dart';
import 'package:flutter/material.dart';

import '../widgets/carousel_slider_offer.dart';
import '../widgets/category_widget.dart';
import '../widgets/home_appliance.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "home";

  HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    List<CategoryData> categoryDataList = [];
    for (int i = 0; i <= 7; i++) {
      categoryDataList.add(CategoryData(
          title: 'Women’s fashion', imagePath: 'assets/images/test.jpg'));
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: theme.primaryColor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: theme.primaryColor, width: 1),
                        ),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Color(0xFF004182),
                          size: 20,
                        ),
                        hintText: 'What do you search for?',
                        hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF06004F).withOpacity(0.4),
                        ),
                        hintMaxLines: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: theme.primaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CarouselSliderOffer(),
              Row(
                children: [
                  Text(
                    'Categories',
                    style: theme.textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Text('view all', style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.primaryColor,
                    fontSize: 12
                  )),
                ],
              ).setVerticalPadding(context, 0.025),
              SizedBox(
                height: 250,
                width: mediaQuery.width,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.1
                  ),
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                        categoryData: categoryDataList[index]);
                  },
                  itemCount: categoryDataList.length,
                ),
              ),

              Text(
                'Home Appliance',
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.start,
              ).setVerticalPadding(context, 0.025),


              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(2),
                      child: HomeAppliance(),
                    );
                  },
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                ),
              ),

              // using grid view
              // SizedBox(
              //   height: 180,
              //   width: 150,
              //   child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1,
              //     crossAxisSpacing: 5,
              //     mainAxisSpacing: 5
              //   ),itemBuilder: (context, index){
              //     return HomeAppliance();
              //   }, itemCount: 3,
              //   scrollDirection: Axis.horizontal,),
              // ),

              // SingleChildScrollView with row
              //  const SingleChildScrollView(
              //    scrollDirection: Axis.horizontal,
              //    child: Row(
              //      children: [
              //        HomeAppliance(),
              //        SizedBox(
              //          width: 3,
              //        ),
              //        HomeAppliance(),
              //        SizedBox(
              //          width: 3,
              //        ),
              //        HomeAppliance(),
              //        SizedBox(
              //          width: 3,
              //        ),
              //        HomeAppliance(),
              // ],
              //    ),
              //  ),
            ],
          ),
        ),
      ),
    );
  }
}
