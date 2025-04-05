import 'dart:convert';

class RoutineTestModel {
    final List<RoutineTestDatum> routineTestData;
    final int ack;
    final String msg;

    RoutineTestModel({
        required this.routineTestData,
        required this.ack,
        required this.msg,
    });

    RoutineTestModel copyWith({
        List<RoutineTestDatum>? routineTestData,
        int? ack,
        String? msg,
    }) => 
        RoutineTestModel(
            routineTestData: routineTestData ?? this.routineTestData,
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory RoutineTestModel.fromJson(String str) => RoutineTestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RoutineTestModel.fromMap(Map<String, dynamic> json) => RoutineTestModel(
        routineTestData: List<RoutineTestDatum>.from(json["RoutineTestData"].map((x) => RoutineTestDatum.fromMap(x))),
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "RoutineTestData": List<dynamic>.from(routineTestData.map((x) => x.toMap())),
        "Ack": ack,
        "msg": msg,
    };
}

class RoutineTestDatum {
    final String testId;
    final String testName;
    final String originalPrice;
    final String price;

    RoutineTestDatum({
        required this.testId,
        required this.testName,
        required this.originalPrice,
        required this.price,
    });

    RoutineTestDatum copyWith({
        String? testId,
        String? testName,
        String? originalPrice,
        String? price,
    }) => 
        RoutineTestDatum(
            testId: testId ?? this.testId,
            testName: testName ?? this.testName,
            originalPrice: originalPrice ?? this.originalPrice,
            price: price ?? this.price,
        );

    factory RoutineTestDatum.fromJson(String str) => RoutineTestDatum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RoutineTestDatum.fromMap(Map<String, dynamic> json) => RoutineTestDatum(
        testId: json["test_id"],
        testName: json["test_name"],
        originalPrice: json["original_price"],
        price: json["price"],
    );

    Map<String, dynamic> toMap() => {
        "test_id": testId,
        "test_name": testName,
        "original_price": originalPrice,
        "price": price,
    };
}
