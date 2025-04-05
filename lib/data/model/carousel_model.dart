import 'dart:convert';

class CarouselModel {
  
    final List<BannerData> bannerData;
    final int ack;
    final int totalQuantity;
    final String totalAmount;
    final String msg;

    CarouselModel({
        required this.bannerData,
        required this.ack,
        required this.totalQuantity,
        required this.totalAmount,
        required this.msg,
    });

    CarouselModel copyWith({
        List<BannerData>? bannerData,
        int? ack,
        int? totalQuantity,
        String? totalAmount,
        String? msg,
    }) => 
        CarouselModel(
            bannerData: bannerData ?? this.bannerData,
            ack: ack ?? this.ack,
            totalQuantity: totalQuantity ?? this.totalQuantity,
            totalAmount: totalAmount ?? this.totalAmount,
            msg: msg ?? this.msg,
        );

    factory CarouselModel.fromJson(String str) => CarouselModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CarouselModel.fromMap(Map<String, dynamic> json) => CarouselModel(
        bannerData: List<BannerData>.from(json["BannerData"].map((x) => BannerData.fromMap(x))),
        ack: json["Ack"],
        totalQuantity: json["TotalQuantity"],
        totalAmount: json["TotalAmount"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "BannerData": List<dynamic>.from(bannerData.map((x) => x.toMap())),
        "Ack": ack,
        "TotalQuantity": totalQuantity,
        "TotalAmount": totalAmount,
        "msg": msg,
    };
}

class BannerData {
    final String bannerId;
    final String bannerPhoto;

    BannerData({
        required this.bannerId,
        required this.bannerPhoto,
    });

    BannerData copyWith({
        String? bannerId,
        String? bannerPhoto,
    }) => 
        BannerData(
            bannerId: bannerId ?? this.bannerId,
            bannerPhoto: bannerPhoto ?? this.bannerPhoto,
        );

    factory BannerData.fromJson(String str) => BannerData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BannerData.fromMap(Map<String, dynamic> json) => BannerData(
        bannerId: json["banner_id"],
        bannerPhoto: json["banner_photo"],
    );

    Map<String, dynamic> toMap() => {
        "banner_id": bannerId,
        "banner_photo": bannerPhoto,
    };
}
