class Favorite{
  String name;
  bool fovoriteicon;
  Favorite({this.name,this.fovoriteicon});
  static List<Favorite> allFavorite(){
    var lstOfCities = new List<Favorite>();
    
    lstOfCities.add(new Favorite(name: "Kalem",fovoriteicon: false));
    lstOfCities.add(new Favorite(name: "Gül",fovoriteicon: false));
    lstOfCities.add(new Favorite(name: "Selam",fovoriteicon: false));
    lstOfCities.add(new Favorite(name: "Rüzgar",fovoriteicon: false));
    lstOfCities.add(new Favorite(name: "Feyz",fovoriteicon: false));

    return lstOfCities;
  }
}