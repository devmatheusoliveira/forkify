import 'package:dio/dio.dart';
import 'package:forkify_app/app/services/api/config_dio.dart';
import 'package:forkify_app/app/shared/models/recipe_tile/recipe_tile_model.dart';

class SearchRecipes {
  static Future<dynamic> fetch(String food) async {
    try {
      Dio dio = InitDio.dio();

      Response response = await dio.get(
        "/search",
        queryParameters: {"q": food},
      );
      if (response.statusCode != 200) return {"error": response.data["error"]};

      return List<RecipeTileModel>.generate(
        response.data["recipes"].length,
        (index) => RecipeTileModel.fromJson(response.data["recipes"][index]),
      );
    } catch (e) {
      return {"error": e.toString()};
    }
  }
}
