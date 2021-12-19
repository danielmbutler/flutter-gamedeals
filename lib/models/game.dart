
class Game {
  int? id;
  bool saved;
  String? cheapest;
  String? cheapestDealID;
  String? external;
  String? gameId;
  String? internalName;
  String? steamAppID;
  String? thumb;


  Game({required this.saved, this.cheapest,
       this.cheapestDealID, this.external, this.gameId, this.steamAppID,
       this.internalName, this.thumb, this.id,
  });


  Game.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        saved = (res["isSaved"] == 1) ? true : false,
        internalName = res["internalName"],
        thumb = res["thumb"],
        steamAppID = res["steamAppID"],
        cheapest = res["cheapest"],
        cheapestDealID = res["cheapestDealID"],
        external = res["external"],
        gameId = res["gameID"];

  Map<String, Object?> toMap() {
    return {
      'isSaved': 1, // set game as saved
      'internalName': internalName,
      'thumb': thumb,
      'steamAppID': steamAppID,
      'cheapest': cheapest,
      'cheapestDealID': cheapestDealID,
      'gameID': gameId,
      'external': external
    };
  }


  factory Game.fromJson(Map<String, dynamic> json){
    return Game(
        saved: false,
        cheapest:json['cheapest'],
        cheapestDealID: json['cheapestDealID'],
        external: json['external'],
        gameId: json['gameID'],
        internalName: json['internalName'],
        steamAppID: json['steamAppID'],
        thumb: json['thumb']
    );
  }

}