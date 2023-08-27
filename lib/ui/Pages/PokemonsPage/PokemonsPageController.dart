// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pokemon/main_sdk/apis/Pokemons/models/pokemonsModel.dart';
import 'package:pokemon/main_sdk/apis/Pokemons/services/pokemonsApis.dart';
import 'package:pokemon/main_sdk/apis/core/models/common/message_model.dart';
import 'package:pokemon/main_sdk/apis/core/models/common/result_class.dart';

class PokemonsPageController extends ControllerMVC {
  late GlobalKey<FormState> formKey;
  late GlobalKey<ScaffoldState> scaffoldKey;
  bool loading = false;
  List<PokemonsModel?> pokemonsList = [];
  PokemonsPageController() {
    formKey = GlobalKey<FormState>();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }
  //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png
  //https://pokeapi.co/api/v2/pokemon/1/
  getPokemons() async {
    loading = true;
    setState(() {});
    ResponseState<MessageModel> response = await PokemonsApi().getPokemons();
    if (response is SuccessState) {
      SuccessState<MessageModel> res = response as SuccessState<MessageModel>;
      if (res.data.results.length > 0) {
        for (var i = 0; i < res.data.results.length; i++) {
          pokemonsList.add(
            PokemonsModel.fromJson(res.data.results[i]),
          );
          String oldUrl = pokemonsList[i]!
              .url!
              .substring(0, pokemonsList[i]!.url!.length - 1);
          pokemonsList[i]!.url =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${oldUrl.substring(oldUrl.lastIndexOf('/') + 1, oldUrl.length)}.png";
        }
      } else {
        ScaffoldMessenger.of(state!.context).showSnackBar(
          SnackBar(
            content: Text(res.data.message),
          ),
        );
      }
    } else if (response is ErrorState) {
      ErrorState<MessageModel> res = response as ErrorState<MessageModel>;
      if (res.errorMessage.error!.message == "Unauthenticated.") {
        ScaffoldMessenger.of(state!.context).showSnackBar(
          const SnackBar(
            content: Text(""),
          ),
        );
      } else {
        ScaffoldMessenger.of(state!.context).showSnackBar(
          SnackBar(
            content: Text(res.errorMessage.error!.message),
          ),
        );
      }
    }
    loading = false;
    setState(() {});
  }
}
