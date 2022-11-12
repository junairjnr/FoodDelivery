



import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedPrdctRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedPrdctRepo({required this.apiClient});

  Future<Response> getRecommendedPrdctList() async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}