// home_model.dart
class HomeBanner {
  final String imageUrl;
  final String title;

  HomeBanner({required this.imageUrl, required this.title});

  factory HomeBanner.fromJson(Map<String, dynamic> json) {
    return HomeBanner(
      imageUrl: json['imageUrl'],
      title: json['title'],
    );
  }
}

class HomeResponse {
  final List<HomeBanner> banners;

  HomeResponse({required this.banners});

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    var bannersList = json['banners'] as List;
    List<HomeBanner> banners = bannersList.map((i) => HomeBanner.fromJson(i)).toList();

    return HomeResponse(banners: banners);
  }
}
