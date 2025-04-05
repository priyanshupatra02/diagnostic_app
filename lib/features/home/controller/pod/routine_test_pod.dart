import 'package:diagnostic_app/data/model/routine_test_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routineTestProvider = FutureProvider.autoDispose<RoutineTestModel>(
  (ref) async {
    final result = await ref.watch(apiHelperProvider).getRoutineTest();
    return result.when(
      (routineTestModelResponse) async {
        return routineTestModelResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "routineTestProvider",
);
