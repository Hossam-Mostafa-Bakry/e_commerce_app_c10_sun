import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../domain/entities/category_model.dart';
import '../../../domain/entities/item_model.dart';
import 'category_grid_view.dart';

class CategoryTitle extends StatefulWidget {
  const CategoryTitle({super.key});

  @override
  State<CategoryTitle> createState() => _CategoryTitleState();
}

class _CategoryTitleState extends State<CategoryTitle> {
  int currentIndex = 0;
  List<Items> menItems = [
    const Items(title: "T-shirts", image: "assets/images/men/t-shirt.png"),
    const Items(title: "Shorts", image: "assets/images/men/shorts.png"),
    const Items(title: "Jeans", image: "assets/images/men/jeans.png"),
    const Items(title: "Pants", image: "assets/images/men/Pants.png"),
    const Items(title: "Footwear", image: "assets/images/men/footwar.png"),
    const Items(title: "Suits", image: "assets/images/men/suits.png"),
    const Items(title: "Watches", image: "assets/images/men/watches.png"),
    const Items(title: "Bags", image: "assets/images/men/bags.png"),
    const Items(title: "Eyewears", image: "assets/images/men/Eyewears.png"),
  ];
  List<Items> womanitems = [
    const Items(title: "Dresses", image: "assets/images/woman/dresses.png"),
    const Items(title: "Jeans", image: "assets/images/woman/jeans.png"),
    const Items(title: "skirts", image: "assets/images/woman/skirts.png"),
    const Items(title: "pijamas", image: "assets/images/woman/pijama.png"),
    const Items(title: "Bags", image: "assets/images/woman/bags.png"),
    const Items(title: "T-shirts", image: "assets/images/woman/t-shirt.png"),
    const Items(title: "Footwear", image: "assets/images/woman/footwear.png"),
    const Items(title: "Eyewear", image: "assets/images/woman/Eyewear.png"),
    const Items(title: "Watches", image: "assets/images/woman/watches.png"),
  ];
  List<Items> laptopitems = [
    const Items(title: "airpod", image: "assets/images/electronics/airpod.png",),
    const Items(title: "Camera", image: "assets/images/electronics/camera.png"),
    const Items(title: "class", image: "assets/images/electronics/class.png"),
    const Items(title: "headset", image: "assets/images/electronics/headset.png"),
    const Items(title: "laptop", image: "assets/images/electronics/lap1.jpg"),
    const Items(title: "mobile", image: "assets/images/electronics/mobile.png"),
    const Items(title: "tablet", image: "assets/images/electronics/tablet.jpg"),
    const Items(title: "iphone", image: "assets/images/electronics/iphone.jpg"),
    const Items(title: "Laptop", image: "assets/images/electronics/lapt2.jpg"),

  ];
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(categoryTitle: "Men’s Fashion", items: menItems,itemCover: "assets/images/men/young-handsome-man-choosing-clothes-shop_1303-19720.jpg"),
      CategoryModel(categoryTitle: "Women’s Fashion", items: womanitems,itemCover: "assets/images/woman/cover 2.jpg"),
      CategoryModel(
        categoryTitle: "Skincare",
        items: laptopitems,
         itemCover:  "assets/images/men/young-handsome-man-choosing-clothes-shop_1303-19720.jpg"
      ),
      CategoryModel(
        categoryTitle: "Beauty",
        items: menItems,
          itemCover:  "assets/images/men/young-handsome-man-choosing-clothes-shop_1303-19720.jpg"
      ),
      CategoryModel(
        categoryTitle: "Cameras",items: menItems,
          itemCover:  "assets/images/electronics/cover.jpg",
      ),
      CategoryModel(
        categoryTitle: "Laptops & Electronics",
        items: laptopitems,
          itemCover:  "assets/images/electronics/cover.jpg"
      ),
      CategoryModel(
        categoryTitle: "Baby & Toys",
        items:menItems ,
          itemCover:  "assets/images/men/young-handsome-man-choosing-clothes-shop_1303-19720.jpg"
      )
    ];
    return Expanded(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        //height: Constants.mediaQuery.height*0.7,
        width: Constants.mediaQuery.width * 0.33,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            border: Border(
                top: BorderSide(
                  color: Color(0xff004182),
                  width: 2,
                ),
                left: BorderSide(
                  color: Color(0xff004182),
                  width: 2,
                ),

            )),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        color: currentIndex == index ? null : const Color(0xffEDF1F5),
                        child:
                        ListTile(
                          title: Text(
                            categories[index].categoryTitle,
                            style: currentIndex == index
                                ? Constants.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                        color: Constants.theme.primaryColor)
                                : Constants.theme.textTheme.bodyMedium,
                            textAlign: TextAlign.start,
                          ),
                          titleTextStyle: Constants.theme.textTheme.bodyMedium,
                          contentPadding: currentIndex == index ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 2),
                          leading:currentIndex == index ?
                          const VerticalDivider(
                            color: Color(0xff004182),
                            indent: 2,
                            thickness: 4,
                            endIndent: 2,
                          ) :null,
                          dense: true,
                          style:ListTileStyle.list,
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: categories.length,
            ),
          ),
        ]),
      ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      height: Constants.mediaQuery.height*0.15,
                      width: Constants.mediaQuery.width*0.6,
                      decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey,
                          image: DecorationImage(image: AssetImage(categories[currentIndex].itemCover),fit: BoxFit.fill)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categories[currentIndex].categoryTitle,style: Constants.theme.textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                          ),
                            overflow: TextOverflow.visible,
                          ),
                          const SizedBox(height: 20,),
                          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff004182),

                          ), child: Text("Shop Now",style: Constants.theme.textTheme.bodyMedium?.copyWith(color: Colors.white),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                CategoryGridView(items: categories[currentIndex].items),
              ],
            ),
          ),
        ),

    ]
        )
    );
  }
}
