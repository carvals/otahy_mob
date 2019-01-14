import '../model/movie_model.dart';
import 'movie_bloc.dart';

import 'package:flutter/widgets.dart';


class MovieProvider extends InheritedWidget{
  final MovieBloc movieBloc;
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //static allow to access anywhere in the app, singleton?
  static MovieBloc of(BuildContext context)=>
        (context.inheritFromWidgetOfExactType(MovieProvider) as MovieProvider) //cast asmovie provider
        .movieBloc; // return movieBloc

  //normal instance

MovieProvider({Key key, MovieBloc movieBloc, Widget child}) //optional parameter
  : this.movieBloc = movieBloc ?? MovieBloc(API()), //if null create a new one
  super(child:child, key:key); // child passed to the constructor
 


}