
import 'dart:async';
import '../model/movie_model.dart'; //here model + api

import 'package:rxdart/rxdart.dart';

class MovieBloc{
final API api;

//create the stream
Stream<List<MovieModel>> _results = Stream.empty();
Stream<String> _log = Stream.empty();

Stream<List<MovieModel>> get results => _results;
Stream<String> get log => _log;

//create the sink, replay subjet when user is typing
ReplaySubject<String> _query = ReplaySubject<String>();
Sink<String> get query => _query;

MovieBloc(this.api){
  _results = _query
          .distinct()  //remove duplicate 
          .asyncMap(api.get) //map the parameter in query with the get method
          .asBroadcastStream(); //allow multiple listener

  _log = Observable(results)
      .withLatestFrom(_query.stream, (_, query)=> 'Results for $query')
      .asBroadcastStream();
}

//stream need to be closed... to avoid memory leaks
void dispose(){
  //dispose only this one because it is coming from the UI. 
  //basicaly dispose the sink
  _query.close();
}

}
