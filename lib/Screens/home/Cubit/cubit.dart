import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/Screens/home/Cubit/states.dart';
import '../../../Models/NewsResponse.dart';
import '../../../Models/SourceResponse.dart';
import '../../../Shared/Components/constant.dart';
import '../repo/repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitSate());

  //عملنا اوبجكت من ال cubit  ب static function عشان اقدر انادي عليه

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Sources> sources = [];
  List<Articles> articals = [];
  int selectedIndex = 0;

  void changSource(int value) {
    emit(HomeInitSate());
    selectedIndex = value;

    emit(HomeChangeSourceState());
  }

  Future<void> getSources(String category) async {
    emit(HomeGetSourcesLoadingState());
    try {
      SourceResponse sourceResponse = await homeRepo.getSources(category);
      sources = sourceResponse.sources ?? [];
      emit(HomeGetSourcesSuccessState());
    }
    //return data;
    catch (e) {
      emit(HomeGetSourcesErrorState());
      throw e;
    }
  }

  Future<void> getNews(String txt) async {
    emit(HomeGetNewsLoadingState());

    try {
      NewsResponse newsResponse =
          await homeRepo.getNews(txt, sources[selectedIndex].id ?? "");
      articals = newsResponse.articles ?? [];
      emit(HomeGetNewsSuccessState());
    } catch (e) {
      emit(HomeGetNewsErrorState());
      throw e;
    }
  }
}
