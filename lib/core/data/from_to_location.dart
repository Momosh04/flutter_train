import 'package:herry_up/core/data/search.dart';

class ShortestPath {
  List<Map<String, List<String>>> listPaths = [];

  List<String> startPath = [];
  List<String> goalPath = [];

  fromLocation(String start, List<Map<String, List<String>>> data) {
    SearchingEntity().searchingMethod(start, data);
  }

  toLocation(String goal, List<Map<String, List<String>>> data) {
    SearchingEntity().searchingMethod(goal, data);
  }

  suggestionResult() {
    listPaths.add({"start suggest": startPath, "goal suggest": goalPath});
  }
}
