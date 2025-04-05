/// This class helping putting all
/// the urls needed in apps
class AppUrls {
  AppUrls._();
  //get the base urls from the env file
  static const String imgBaseUrlForRoutineTest = 'https://www.sanitascare.health/uploads/banner/';
  static const String imgBaseUrlForPathoTest = 'https://www.sanitascare.health/uploads/package/';

  static const String getCarousel = '/webservice/service.php?action=home_slider';
  static const String getRoutineTest = '/webservice/service.php?action=routine_test';
  static const String getPathoTest = '/webservice/service.php?action=pathology_test';
}
