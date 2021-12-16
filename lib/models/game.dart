
class Game {
  String? id;
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


  factory Game.fromJson(Map<String, dynamic> json){
    return Game(
        id: '',
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