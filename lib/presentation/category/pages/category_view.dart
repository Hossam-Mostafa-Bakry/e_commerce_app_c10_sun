import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../widgets/category_title.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    var currentIndex = 0;
    return Scaffold(
        body: Material(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/Group 5.png"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: Constants.mediaQuery.width * 0.8,
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(color: Color(0xff004182))),
                          prefixIcon: Icon(Icons.search, size: 40),
                          prefixIconColor: Color(0xff004182),
                          hintText: "What do you search for?",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Color(0xff06004F),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/shoping_Cart.png",
                        scale: 2.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CategoryTitle(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            //backgroundColor: Color(0xff004182),
            currentIndex: currentIndex = 1,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: currentIndex == 0
                    ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                          AssetImage(
                              "assets/images/bottomNavBarIcons/home.png"),
                        ))
                    : const ImageIcon(
                        AssetImage("assets/images/bottomNavBarIcons/home.png"),
                      ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 1
                    ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                          AssetImage(
                              "assets/images/bottomNavBarIcons/menu.png"),
                        ))
                    : const ImageIcon(
                        AssetImage("assets/images/bottomNavBarIcons/menu.png"),
                      ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 2
                    ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                          AssetImage("assets/images/bottomNavBarIcons/fav.png"),
                        ))
                    : const ImageIcon(
                        AssetImage("assets/images/bottomNavBarIcons/fav.png"),
                      ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 3
                    ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                          AssetImage(
                              "assets/images/bottomNavBarIcons/profile.png"),
                        ))
                    : const ImageIcon(
                        AssetImage(
                            "assets/images/bottomNavBarIcons/profile.png"),
                      ),
                label: "",
              ),
            ],
          ),
        ));
  }
}
