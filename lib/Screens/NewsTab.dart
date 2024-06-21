import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Models/CatogaryModel.dart';
import 'package:news_app/Screens/home/Cubit/cubit.dart';
import 'package:news_app/Screens/home/Cubit/states.dart';
import 'package:news_app/Screens/home/repo/dataSources/remoteDs.dart';

import '../Shared/network/remote/Api_manager.dart';
import 'Tab_Controller.dart';

class NewsTab extends StatelessWidget {
  String catId;

  String txt;

  NewsTab(this.catId, this.txt);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RemoteDS())..getSources(catId),
      child: BlocConsumer<HomeCubit, HomeStates>(
        //check states
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is HomeGetSourcesSuccessState ||
              state is HomeChangeSourceState) {
            HomeCubit.get(context).getNews(txt);
          }


        },

        //build ui
        builder: (context, state) {
          if (state is HomeGetSourcesLoadingState ||
              state is HomeGetNewsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tab_Controller(txt!),
          );
        },
      ),
    );
  }
}
