import 'package:dio/dio.dart';
import 'package:forkify_app/app/services/api/config_dio.dart';
import 'package:forkify_app/app/shared/models/recipe_details/recipe_details_model.dart';

class RecipeGet {
  static Future fetch(String recipeId) async {
    try {
      Dio dio = InitDio.dio();
      Response response = await dio.get(
        "/get",
        queryParameters: {"rId": recipeId},
      );
      if (response.statusCode != 200) return {"error": "Status code error!"};
      if (response.data["error"] != null) {
        return {"error": response.data["error"]};
      }

      return RecipeDetailsModel.fromJson(response.data["recipe"]);
    } catch (e) {
      return {"error": e.toString()};
    }
  }
}
