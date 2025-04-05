import 'package:diagnostic_app/data/model/pathology_test_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pathologyTestProvider = FutureProvider.autoDispose<PathologyTestModel>(
  (ref) async {
    final result = await ref.watch(apiHelperProvider).getPathologyTest();
    return result.when(
      (PathologyTestModel) async {
        return PathologyTestModel;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "pathologyTestProvider",
);
