import 'package:flutter/material.dart';

import '../../data/models/profile_recipe_model.dart';
import '../../data/repositories/profile_recipe_repository.dart';

class ProfileRecipeViewModel extends ChangeNotifier {
  ProfileRecipeViewModel({
    required ProfileRecipeRepository repo,
  }) : _repo = repo {
    load();
  }

  final ProfileRecipeRepository _repo;
  bool loading = true;
  ProfileRecipeModel? recipe;

  Future<void> load() async {
    recipe = await _repo.fetchRecipeById();
    loading = false;
    notifyListeners();
  }
}
