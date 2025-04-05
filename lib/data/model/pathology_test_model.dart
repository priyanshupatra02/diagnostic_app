import 'dart:convert';

class PathologyTestModel {
    final List<PathologyTestDatum> pathologyTestData;
    final int ack;
    final String msg;

    PathologyTestModel({
        required this.pathologyTestData,
        required this.ack,
        required this.msg,
    });

    PathologyTestModel copyWith({
        List<PathologyTestDatum>? pathologyTestData,
        int? ack,
        String? msg,
    }) => 
        PathologyTestModel(
            pathologyTestData: pathologyTestData ?? this.pathologyTestData,
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory PathologyTestModel.fromJson(String str) => PathologyTestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PathologyTestModel.fromMap(Map<String, dynamic> json) => PathologyTestModel(
        pathologyTestData: List<PathologyTestDatum>.from(json["PathologyTestData"].map((x) => PathologyTestDatum.fromMap(x))),
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "PathologyTestData": List<dynamic>.from(pathologyTestData.map((x) => x.toMap())),
        "Ack": ack,
        "msg": msg,
    };
}

class PathologyTestDatum {
    final String packageId;
    final String testName;
    final String originalPrice;
    final String price;
    final String discount;
    final String testPhoto;
    final List<Package> packages;

    PathologyTestDatum({
        required this.packageId,
        required this.testName,
        required this.originalPrice,
        required this.price,
        required this.discount,
        required this.testPhoto,
        required this.packages,
    });

    PathologyTestDatum copyWith({
        String? packageId,
        String? testName,
        String? originalPrice,
        String? price,
        String? discount,
        String? testPhoto,
        List<Package>? packages,
    }) => 
        PathologyTestDatum(
            packageId: packageId ?? this.packageId,
            testName: testName ?? this.testName,
            originalPrice: originalPrice ?? this.originalPrice,
            price: price ?? this.price,
            discount: discount ?? this.discount,
            testPhoto: testPhoto ?? this.testPhoto,
            packages: packages ?? this.packages,
        );

    factory PathologyTestDatum.fromJson(String str) => PathologyTestDatum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PathologyTestDatum.fromMap(Map<String, dynamic> json) => PathologyTestDatum(
        packageId: json["package_id"],
        testName: json["test_name"],
        originalPrice: json["original_price"],
        price: json["price"],
        discount: json["discount"],
        testPhoto: json["test_photo"],
        packages: List<Package>.from(json["Packages"].map((x) => Package.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "package_id": packageId,
        "test_name": testName,
        "original_price": originalPrice,
        "price": price,
        "discount": discount,
        "test_photo": testPhoto,
        "Packages": List<dynamic>.from(packages.map((x) => x.toMap())),
    };
}

class Package {
    final String testId;
    final String testName;

    Package({
        required this.testId,
        required this.testName,
    });

    Package copyWith({
        String? testId,
        String? testName,
    }) => 
        Package(
            testId: testId ?? this.testId,
            testName: testName ?? this.testName,
        );

    factory Package.fromJson(String str) => Package.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Package.fromMap(Map<String, dynamic> json) => Package(
        testId: json["test_id"],
        testName: json["test_name"],
    );

    Map<String, dynamic> toMap() => {
        "test_id": testId,
        "test_name": testName,
    };
}
