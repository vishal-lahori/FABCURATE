import 'dart:convert';

import 'package:fabcurate/model/homescreenmodel.dart';
import 'package:fabcurate/services/restApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class HomeScreenProvider extends ChangeNotifier {
  RestAPI restAPI;

  List<SliderImages> sliderImages = List<SliderImages>();
  List<OfferCodeBanner> offerCodeBanner = List<OfferCodeBanner>();
  List<Designs> designs = List<Designs>();
  List<Ranges> ranges = List<Ranges>();
  List<MostPopularViewed> mostPopularViewed = List<MostPopularViewed>();
  List<Banners> banners = List<Banners>();
  List<JustArrived> justArrived = List<JustArrived>();

  homePageData(BuildContext context) async {
    restAPI = RestAPI(context: context);
    Response response = await restAPI.getHomeScreenData();

    if (response != null && response.body != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        HomeScreenModel homeScreenModel =
            HomeScreenModel.fromJson(jsonDecode(response.body));

        if (homeScreenModel.sliderImages != null) {
          sliderImages = homeScreenModel.sliderImages;
          for (int i = 0; i < sliderImages.length; i++) {
            print(sliderImages[i].title);
          }
        }
        if (homeScreenModel.offerCodeBanner != null) {
          offerCodeBanner = homeScreenModel.offerCodeBanner;
        }
        if (homeScreenModel.designs != null) {
          designs = homeScreenModel.designs;
        }
        if (homeScreenModel.ranges != null) {
          ranges = homeScreenModel.ranges;
        }

        if (homeScreenModel.mostPopularViewed != null) {
          mostPopularViewed = homeScreenModel.mostPopularViewed;
        }
        if (homeScreenModel.banners != null) {
          banners = homeScreenModel.banners;
        }
        if (homeScreenModel.justArrived != null) {
          justArrived = homeScreenModel.justArrived;
        }

        notifyListeners();
      }
    }
  }
}
