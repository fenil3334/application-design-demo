import 'package:application_design_demo/bloc/dio_cubit.dart';
import 'package:application_design_demo/bloc/dio_statement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DioScreen extends StatelessWidget {
  const DioScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
            child: BlocProvider<DioCubit>(
              create: (context) => DioCubit()..getApiCallingList(),
              child: const RecipeList(),
            )
        ),
      ),
    );
  }
}



class RecipeList extends StatelessWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0
          ),
          color: const Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 28.0,
                        bottom: 28.0
                    ),
                    child: const Center(
                      child: Text('Dio Using Api Call'),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<DioCubit, DioStatement>(
                        builder: (context, state) {
                          if (state is OnLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is OnFauilure) {
                            return const Center(
                              child: Icon(Icons.close),
                            );
                          } else if (state is OnSuccess) {
                            final recipes = state.diomodel;
                            return ListView.builder(
                              padding: EdgeInsets.only(bottom: 14),
                              itemCount: recipes.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    /*Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider<RecipeCubit>(
                                            create: (context) => RecipeCubit(RecipeRepository()),
                                            child: RecipeDetail(recipe: recipes[index]),
                                          );
                                        }
                                    ));*/
                                  },

                                  child: Container(
                                    margin: EdgeInsets.only(top: 12),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue
                                    ),
                                    child: Column(
                                      children: [
                                        Text(recipes[index].id.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),

                                        SizedBox(height: 8,),

                                        Text(recipes[index].title.toString(),
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],

                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Text('Loading recipes error');
                          }
                        }
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

