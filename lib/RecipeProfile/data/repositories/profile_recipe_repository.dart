
import '../../../core/client.dart';
import '../models/profile_recipe_model.dart';

class ProfileRecipeRepository {
  ProfileRecipeRepository({
    required this.client,
  });

  final ApiClient client;

  late ProfileRecipeModel recipe;

  Future<ProfileRecipeModel> fetchRecipeById() async {
    var rawRecipe = await client.fetchProfileRecipe();
    recipe = ProfileRecipeModel.fromJson(rawRecipe);
    return recipe;
  }
}
