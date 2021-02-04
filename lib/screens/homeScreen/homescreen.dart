import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fabcurate/provider/homescreenprovider.dart';
import 'package:fabcurate/screens/categoryScreen/categoryscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (selectedIndex == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CategoryScreen()));
    }
  }

  void afterBuildFunction(BuildContext context) async {
    var homeProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    homeProvider.homePageData(context);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => afterBuildFunction(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Text(
          "FABCURATE",
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 10),
              Icon(Icons.shopping_bag_outlined, color: Colors.grey),
              SizedBox(width: 10)
            ],
          )
        ],
      ),
      body: Consumer<HomeScreenProvider>(
          builder: (context, homeScreenData, child) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height + 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: homeScreenData.sliderImages.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Image.network(homeScreenData
                                            .sliderImages[index].image),
                                        width: 80,
                                      ),
                                      Container(
                                        child: Text(homeScreenData
                                            .sliderImages[index].title),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeScreenData.banners.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Image.network(
                            homeScreenData.banners[index].bannerImage,
                          ),
                        );
                      }),
                ),
                // Expanded(
                //   child: Container(
                //     height: 100,
                //     child: Swiper(
                //       outer: false,
                //       autoplay: true,
                //       viewportFraction: 1.0,
                //       scale: 0.9,
                //       itemCount: homeScreenData.banners.length,
                //       itemBuilder: (context, index) {
                //         return Image.network(
                //             homeScreenData.banners[index].bannerImage);
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeScreenData.mostPopularViewed.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Image.network(
                            homeScreenData.mostPopularViewed[index].image,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Shop By Category",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: homeScreenData.offerCodeBanner.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Image.network(homeScreenData
                              .offerCodeBanner[index].bannerImage),
                        );
                      }),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: homeScreenData.ranges.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child:
                              Image.network(homeScreenData.ranges[index].image),
                        );
                      }),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Shop By Fabric Material",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: homeScreenData.justArrived.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Image.network(
                              homeScreenData.justArrived[index].image),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        color: Colors.white,

        // backgroundColor: Colors.white,
        backgroundColor: Colors.black12,
        // buttonBackgroundColor: Colors.black,
        height: 60,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.easeOutSine,
        items: <Widget>[
          Icon(Icons.home, size: 25, color: Colors.grey),
          Icon(Icons.menu, size: 25, color: Colors.grey),
          Icon(Icons.account_balance_rounded, size: 25, color: Colors.grey),
          Icon(Icons.thumbs_up_down, size: 25, color: Colors.grey),
          Icon(Icons.more_horiz_rounded, size: 25, color: Colors.grey),
        ],
        onTap: (index) {
          onItemTapped(index);
        },
      ),
    );
  }
}
