import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pokemon/Constants/app_theme.dart';
import 'package:pokemon/Constants/assets.dart';
import 'package:pokemon/ui/Pages/PokemonsPage/PokemonsPageController.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({super.key});

  @override
  StateMVC<PokemonsPage> createState() => _PokemonsPageState();
}

PageController? pageController;

class _PokemonsPageState extends StateMVC<PokemonsPage> {
  late PokemonsPageController con;

  _PokemonsPageState() : super(PokemonsPageController()) {
    con = controller as PokemonsPageController;
  }

  @override
  void initState() {
    con.getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokemons',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.whiteColor,
      ),
      body: con.loading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.blue,
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gray.withOpacity(0.7),
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      )
                    ],
                    color: AppColors.whiteColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                          color: AppColors.gray.withOpacity(0.4),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 130,
                            progressIndicatorBuilder:
                                (context, url, progress) => const Center(
                                    child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.photo_outlined,
                              size: 36,
                            ),
                            imageUrl: con.pokemonsList[index]!.url ?? '',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(con.pokemonsList[index]!.name ?? ''),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: con.pokemonsList.length),
    );
  }
}
