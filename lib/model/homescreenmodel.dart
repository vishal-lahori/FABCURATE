class HomeScreenModel {
  List<SliderImages> sliderImages;
  List<OfferCodeBanner> offerCodeBanner;
  List<Designs> designs;
  List<Ranges> ranges;
  List<Banners> banners;
  List<JustArrived> justArrived;
  List<FavouriteSearch> favouriteSearch;
  List<MostPopularViewed> mostPopularViewed;
  List<Null> bestSeller;
  String status;
  String message;

  HomeScreenModel(
      {this.sliderImages,
      this.offerCodeBanner,
      this.designs,
      this.ranges,
      this.banners,
      this.justArrived,
      this.favouriteSearch,
      this.mostPopularViewed,
      this.bestSeller,
      this.status,
      this.message});

  HomeScreenModel.fromJson(Map<String, dynamic> json) {
    if (json['slider_images'] != null) {
      sliderImages = new List<SliderImages>();
      json['slider_images'].forEach((v) {
        sliderImages.add(new SliderImages.fromJson(v));
      });
    }
    if (json['offer_code_banner'] != null) {
      offerCodeBanner = new List<OfferCodeBanner>();
      json['offer_code_banner'].forEach((v) {
        offerCodeBanner.add(new OfferCodeBanner.fromJson(v));
      });
    }
    if (json['designs'] != null) {
      designs = new List<Designs>();
      json['designs'].forEach((v) {
        designs.add(new Designs.fromJson(v));
      });
    }
    if (json['ranges'] != null) {
      ranges = new List<Ranges>();
      json['ranges'].forEach((v) {
        ranges.add(new Ranges.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    if (json['just_arrived'] != null) {
      justArrived = new List<JustArrived>();
      json['just_arrived'].forEach((v) {
        justArrived.add(new JustArrived.fromJson(v));
      });
    }
    if (json['favourite_search'] != null) {
      favouriteSearch = new List<FavouriteSearch>();
      json['favourite_search'].forEach((v) {
        favouriteSearch.add(new FavouriteSearch.fromJson(v));
      });
    }
    if (json['most_popular_viewed'] != null) {
      mostPopularViewed = new List<MostPopularViewed>();
      json['most_popular_viewed'].forEach((v) {
        mostPopularViewed.add(new MostPopularViewed.fromJson(v));
      });
    }
    // if (json['best_seller'] != null) {
    //   bestSeller = new List<Null>();
    //   json['best_seller'].forEach((v) {
    //     bestSeller.add(new Null.fromJson(v));
    //   });
    // }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sliderImages != null) {
      data['slider_images'] = this.sliderImages.map((v) => v.toJson()).toList();
    }
    if (this.offerCodeBanner != null) {
      data['offer_code_banner'] =
          this.offerCodeBanner.map((v) => v.toJson()).toList();
    }
    if (this.designs != null) {
      data['designs'] = this.designs.map((v) => v.toJson()).toList();
    }
    if (this.ranges != null) {
      data['ranges'] = this.ranges.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.justArrived != null) {
      data['just_arrived'] = this.justArrived.map((v) => v.toJson()).toList();
    }
    if (this.favouriteSearch != null) {
      data['favourite_search'] =
          this.favouriteSearch.map((v) => v.toJson()).toList();
    }
    if (this.mostPopularViewed != null) {
      data['most_popular_viewed'] =
          this.mostPopularViewed.map((v) => v.toJson()).toList();
    }
    // if (this.bestSeller != null) {
    //   data['best_seller'] = this.bestSeller.map((v) => v.toJson()).toList();
    // }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class SliderImages {
  String title;
  String image;
  String sortOrder;
  String sliderType;
  String sliderId;

  SliderImages(
      {this.title, this.image, this.sortOrder, this.sliderType, this.sliderId});

  SliderImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    sliderType = json['slider_type'];
    sliderId = json['slider_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    data['slider_type'] = this.sliderType;
    data['slider_id'] = this.sliderId;
    return data;
  }
}

class OfferCodeBanner {
  String bannerImage;
  String type;

  OfferCodeBanner({this.bannerImage, this.type});

  OfferCodeBanner.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_image'] = this.bannerImage;
    data['type'] = this.type;
    return data;
  }
}

class Designs {
  String designId;
  String name;
  String image;

  Designs({this.designId, this.name, this.image});

  Designs.fromJson(Map<String, dynamic> json) {
    designId = json['design_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['design_id'] = this.designId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Ranges {
  String rangeId;
  String name;
  String image;

  Ranges({this.rangeId, this.name, this.image});

  Ranges.fromJson(Map<String, dynamic> json) {
    rangeId = json['range_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['range_id'] = this.rangeId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class MostPopularViewed {
  String product_id;
  String name;
  String image;

  MostPopularViewed({this.product_id, this.name, this.image});

  MostPopularViewed.fromJson(Map<String, dynamic> json) {
    product_id = json['range_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['range_id'] = this.product_id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Banners {
  String bannerImage;
  String bannerType;
  String bannerId;

  Banners({this.bannerImage, this.bannerType, this.bannerId});

  Banners.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    bannerType = json['banner_type'];
    bannerId = json['banner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_image'] = this.bannerImage;
    data['banner_type'] = this.bannerType;
    data['banner_id'] = this.bannerId;
    return data;
  }
}

class JustArrived {
  String productId;
  String image;
  String name;
  int rating;
  String isFavourites;

  JustArrived(
      {this.productId, this.image, this.name, this.rating, this.isFavourites});

  JustArrived.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    image = json['image'];
    name = json['name'];
    rating = json['rating'];
    isFavourites = json['is_favourites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['is_favourites'] = this.isFavourites;
    return data;
  }
}

class FavouriteSearch {
  String favSearch;

  FavouriteSearch({this.favSearch});

  FavouriteSearch.fromJson(Map<String, dynamic> json) {
    favSearch = json['fav_search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fav_search'] = this.favSearch;
    return data;
  }
}
