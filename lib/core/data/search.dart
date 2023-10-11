
class SearchingEntity {

  List searchResult = [];


  searchingMethod (String location, List<Map<String,List<String>>> data ){

      data.forEach((element) {
        element.values.forEach((e) { 
         if( e.contains(location)){
          searchResult.add(element);
         }
        });
      });
  return searchResult;

  }
}