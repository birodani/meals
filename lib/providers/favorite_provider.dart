import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavortieMealNotifier extends StateNotifier<List<Meal>> {
  FavortieMealNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isMealCurrentlyFavorite = state.contains(meal);

    if (isMealCurrentlyFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealProvider = StateNotifierProvider<FavortieMealNotifier, List<Meal>>((ref) {
  return FavortieMealNotifier();
});
