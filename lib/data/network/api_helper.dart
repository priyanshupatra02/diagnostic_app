import 'dart:convert';

import 'package:diagnostic_app/const/app_urls.dart';
import 'package:diagnostic_app/data/model/carousel_model.dart';
import 'package:diagnostic_app/data/model/pathology_test_model.dart';
import 'package:diagnostic_app/data/model/routine_test_model.dart';
import 'package:diagnostic_app/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

class ApiHelper {
  final Dio dio;

  ApiHelper({required this.dio});

  //get carousel
  Future<Result<CarouselModel, APIException>> getCarousel() async {
    final result = await dio.get(AppUrls.getCarousel);
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(CarouselModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
  //get routine test
  Future<Result<RoutineTestModel, APIException>> getRoutineTest() async {
    final result = await dio.get(AppUrls.getRoutineTest);
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(RoutineTestModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
  //get pathology test
  Future<Result<PathologyTestModel, APIException>> getPathologyTest() async {
    final result = await dio.get(AppUrls.getPathoTest);
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(PathologyTestModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
}

/*
class ProductMessage implements BaseMessage {
  @override
  final String? role;
  ProductModel? _content;
  @override
  final dynamic refusal;

  @override
  ProductModel? get content => _content;

  set content(dynamic value) {
    if (value is String) {
      try {
        final parsedJson = jsonDecode(value);
        _content = ProductModel.fromMap(parsedJson);
      } catch (e) {
        _content = null;
      }
    } else if (value is ProductModel) {
      _content = value;
    } else {
      _content = null;
    }
  }

  ProductMessage({
    this.role,
    dynamic content,
    this.refusal,
  }) {
    this.content = content;
  }

  factory ProductMessage.fromMap(Map<String, dynamic> json) => ProductMessage(
        role: json["role"],
        content: json["content"],
        refusal: json["refusal"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "role": role,
        "content": _content?.toJson(),
        "refusal": refusal,
      };
}
*/
