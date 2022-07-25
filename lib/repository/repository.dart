import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sua_musica_desafio_games/model/game.dart';
import 'package:sua_musica_desafio_games/model/game_models/plataforma_model.dart';

import 'package:sua_musica_desafio_games/model/game_response.dart';



class GameRepository {
  static String mainUrl = "https://api-v4.igdb.com";
  var gameListUrl = '$mainUrl/games';
  final String apiKey = "d2l2wc1ys6rqkuw9sxxg6ok3u92fqs";


  // Future<GameResponse> getGames() async {
  //   try {
  //     _dio.interceptors
  //         .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
  //       options.headers["user-key"] = "$apiKey";
  //       _dio.interceptors.requestLock.unlock();
  //       return options;
  //     }));
  //     Response response =
  //     await _dio.post(gameListUrl, data: "fields artworks,bundles,category,checksum,collection,cover.*,created_at,first_release_date,follows,game_engines.*,game_modes.*,genres.*,hypes,keywords.*,multiplayer_modes,name,parent_game,platforms.*, platforms.platform_logo.*, player_perspectives.*,popularity,rating,rating_count,screenshots.*,slug,standalone_expansions,status,storyline,summary,tags,time_to_beat,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos.*; sort popularity desc;");
  //     return GameResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return GameResponse.withError("$error");
  //   }
  // }

  Future< GameResponse> getGames2() async {
    var client = http.Client();
   try{
     var  response = await client.post(Uri.parse( "https://api.igdb.com/v4/games/?fields=*&name=*"),
        headers: {"Accept": "application/json",  'Client-ID': 'sdvq04oind5o4fsts5g4uh46frsx42',
          'Authorization': 'Bearer d2l2wc1ys6rqkuw9sxxg6ok3u92fqs',}, body:"fields age_ratings,aggregated_rating,aggregated_rating_count,alternative_names,artworks,bundles,category,checksum,collection,cover,created_at,dlcs,expanded_games,expansions,external_games,first_release_date,follows,forks,franchise,franchises,game_engines,game_modes,genres,hypes,involved_companies,keywords,multiplayer_modes,name,parent_game,platforms,player_perspectives,ports,rating,rating_count,release_dates,remakes,remasters,screenshots,similar_games,slug,standalone_expansions,status,storyline,summary,tags,themes,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos,websites;");

    // var decodedResponse = jsonDecode(response.body) ;
     print("${response.statusCode}");
     return GameResponse.fromJson(jsonDecode(response.body));
  } finally {
  client.close();
  }
  }



  // Future< GameResponse> getGames2() async {
  //
  //
  //
  //   var response = await http.post(Uri.parse( "https://api.igdb.com/v4/platforms"),
  //       headers: {"Accept": "application/json",  'Client-ID': 'sdvq04oind5o4fsts5g4uh46frsx42',
  //         'Authorization': 'Bearer d2l2wc1ys6rqkuw9sxxg6ok3u92fqs',
  //
  //
  //       },
  //      body:"fields abbreviation,alternative_name,category,checksum,created_at,generation,name,platform_family,platform_logo,slug,summary,updated_at,url,versions,websites;");
  //
  //
  //   //  List jsonResponse = json.decode(response.body);
  //   // print("${response.statusCode}");
  //   // print(jsonResponse);
  //   // print("${response.statusCode}");
  //   print(response.body);
  //   return GameResponse.fromJson(jsonDecode(response.body));
  //   //  return GameResponse.fromJson(jsonDecode(response.body) as List);
  // }

}