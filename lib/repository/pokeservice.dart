import 'package:pokeapi_fernando_avila_bloc/models/ability_model.dart';
import 'package:pokeapi_fernando_avila_bloc/models/pagination_model.dart';
import 'package:pokeapi_fernando_avila_bloc/models/pokemon_model.dart';
import 'package:pokeapi_fernando_avila_bloc/models/type_model.dart';
import 'package:pokeapi_fernando_avila_bloc/repository/services.dart';

class PokemonService {
  static Future<List<PokemonModel>> getAllPokemon(String url) async {
    final response = await Services().httpGet(url);
    final json = Services().jsondecode(response.body);
    final pokemons = json['results'] as List;
    return pokemons.map((pokemon) => PokemonModel.fromJson(pokemon)).toList();
  }

  //get pagination
  static Future<PaginationModel> getPagination(String url) async {
    final response = await Services().httpGet(url);
    final json = Services().jsondecode(response.body);
    final pokemons = json['results'] as List;

    List<PokemonModel> pokemonss = [];
    for (var pokemon in pokemons) {
      pokemonss.add(await getPokemon(pokemon['url']));
    }
    var pagination = PaginationModel.fromJson(json);
    pagination.results = pokemonss;
    return pagination;
  }

  //get pokemons with pagination
  static Future<List<PokemonModel>> getAllPokemonPagination(
      PaginationModel pagination) async {
    final response = await Services().httpGet(pagination.next);
    final json = Services().jsondecode(response.body);

    final pokemons = json['results'] as List;
    pokemons.map((pokemon) => print(pokemon));
    return pokemons.map((pokemon) => PokemonModel.fromJson(pokemon)).toList();
  }

  static Future<List<PokemonModel>> searchPokemon(String name) async {
    final response =
        await Services().httpGet('https://pokeapi.co/api/v2/pokemon/$name');
    final json = Services().jsondecode(response.body);
    final pokemons = json['results'] as List;
    return pokemons.map((pokemon) => PokemonModel.fromJson(pokemon)).toList();
  }

  //get pokemon with link
  static Future<PokemonModel> getPokemon(String url) async {
    final response = await Services().httpGet(url);
    final json = Services().jsondecode(response.body);
    json['url'] = url;

    return PokemonModel.fromJson(json);
  }

  //get ability with url https://pokeapi.co/api/v2/ability/34/ and return AbilityModel
  static Future<AbilityModel> getAbility(String url) async {
    final response = await Services().httpGet(url);
    final json = Services().jsondecode(response.body);
    return AbilityModel.fromJson(json);
  }

  //get ability with url https://pokeapi.co/api/v2/type/12/ and return TypeModel
  static Future<TypeModel> getType(String url) async {
    final response = await Services().httpGet(url);
    final json = Services().jsondecode(response.body);
    return TypeModel.fromJson(json);
  }
}
