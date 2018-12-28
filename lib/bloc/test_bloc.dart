import 'package:flutter/material.dart';
import 'dart:async';
import '../model/home_card_model.dart';

abstract class BlocBase{
void mout();

}

class Test implements BlocBase {
  @override
  void mout() {
    // TODO: implement mout
    StreamController<List<HomeCardModel>> streamController = new StreamController.broadcast(); 
    StreamSubscription ss;
    ss = streamController.stream.listen((onData){
      String hh = onData[1].avatarUrl;
    },
    onDone:()=> debugPrint('data'),
    onError: ()=> debugPrint('error')
    );
    ss.cancel();
    
  }


}