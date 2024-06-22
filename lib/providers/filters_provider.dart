import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/enums/filter_enum.dart';

const Map<Filter,bool> initState = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false
};

class FilterNotifier extends StateNotifier<Map<Filter,bool>>{
  FilterNotifier(): super(initState);

  void setFilters(Map<Filter,bool> newFilters) {
    state = newFilters;
  }
  
  void setFilter(Filter filter, bool isActive) {
    state = { ...state, filter: isActive };
  }

  void toggleFilter(Filter filter) {
    bool? filterCurrentValue = state[filter];
    state = { ...state, filter: !filterCurrentValue! };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier,Map<Filter,bool>>((ref) {
  return FilterNotifier();
});