// To parse this JSON data, do
//
//     final gameModel = gameModelFromJson(jsonString);
import 'dart:convert';

GameModel gameModelFromJson(String str) => GameModel.fromJson(json.decode(str));

String gameModelToJson(GameModel data) => json.encode(data.toJson());

class GameModel {
  GameModel({
    required this.status,
    required this.gameFile,
  });

  String? status;
  String? gameFile;

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        status: json["status"],
        gameFile: json["game_file"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "game_file": gameFile,
      };
}
