import 'package:flutter/material.dart';
import '../model/home_card_model.dart';
import '../ui/select_item.dart';


class Home extends StatefulWidget {
  @override

  Home({Key key}) : super(key:key);
  
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _inputSearchController = new TextEditingController(); 
  List<HomeCardModel>_homeCardList = new List<HomeCardModel>();

  @override
  Widget build(BuildContext context) {
    //initialize the list
  if(_homeCardList.length == 0){
   String _avatarUrl = 'https://cdn.pixabay.com/photo/2016/03/31/19/58/avatar-1295429_1280.png';
  String _itemPicUrl = 'http://cdn.programme-television.org/var/premiere/storage/images/tele-7-jours/news-tv/audiences-tv-avatar-tf1-en-tete-barnaby-et-france-3-frolent-les-trois-millions-4578821/94344866-1-fre-FR/Audiences-TV-Avatar-TF1-en-tete-Barnaby-et-France-3-frolent-les-trois-millions_news_full.jpg';
  HomeCardModel _firstCard = new HomeCardModel('_guid', '_userCategory',
   'carvals', '_type', '_name', 5.0, '_shortDesc', _avatarUrl, _itemPicUrl, 
   '_rankingText', 'Tournefeuille', 1.3, 11.2); 
  _firstCard.shortDesc = 'new avatar movie ready to get downloaded!!!';

  for(int i =0; i<5; i++)
  {
  _homeCardList.add(_firstCard);
  
  }
  }


    return new Scaffold(
      appBar: new AppBar(
        title: new Container(
          child:  new TextField(
              controller: _inputSearchController,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 22.2,
              ),
              decoration: new InputDecoration(
                hintText: 'Search',
                hintStyle: new TextStyle(
                  color: Colors.white,
                ),
                contentPadding: EdgeInsets.all(12.0),
                suffixIcon: new IconButton(
                  onPressed: () => debugPrint('search'),
                  icon: new Icon(Icons.search,
                  color:Colors.white),
                ),                
              ),
            ),
        ),
      ),
    drawer: new Drawer(),
    floatingActionButton: new FloatingActionButton(
      onPressed: () => showAddItemForm(context),
      backgroundColor: Colors.amber,
      child: new Text('+',
      style: new TextStyle(
        fontSize: 32.0,
      ),

    ),
    ),
   
    body: new ListView.builder(
      itemCount: _homeCardList.length,
      itemBuilder: (BuildContext context, int position){
        HomeCardModel _tempCard = _homeCardList[position];
        return new Card(
         // color: Colors.amber,
         //main column
          child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //first row with avatar etc
            new Row(
              children: <Widget>[
                new Expanded(
                  flex: 1,                  
                child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   new Padding(padding: EdgeInsets.all(3),),
                   new CircleAvatar(
                  radius: 20.0,
                  child:  new Image.network(_tempCard.avatarUrl)
                   ),
                    new Padding(padding: EdgeInsets.all(5.0),),                  
                    new Text('${_tempCard.type}',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    
                  ],
                )
                ),
                new Expanded(
                  flex: 4,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('${_tempCard.userName} / ${_tempCard.userCategory}',
                    style: new TextStyle(
                      fontSize: 18.0
                    ),),
                    new Text('Score: ${_tempCard.rankingDouble.toString()}'),
                    new Text('${_tempCard.location}'), 
                  ],
                )
                ),
              ],
            ),//end of 1st row
          //second row
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('${_tempCard.shortDesc}'),
            ],
          ), //end of second row
          //third row
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
              child: Image.network(_tempCard.itemPicUrl,
              ),
              ),
            ],
          ), // end of 3rd row
          //4th row
          new Row(
            children: <Widget>[
              new Icon(Icons.thumb_up),
              new Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),),
              new Text('Like'),
            ],
          ),
          ],
         
          ),
          );
      },
        ),
      
    
    );




  }
void showAddItemForm(BuildContext context) async{
  Map resulTask = await Navigator.of(context).push(
    MaterialPageRoute<Map>(builder: (BuildContext context)
    => new SelectItemForm())
 ); // end push

  //do someting when task come back
    if(resulTask != null && resulTask.containsKey("taskname"))
    {
    //   print(resulTask["taskname"].toString());
    //   print(resulTask["duedate"].toString());
    // notoModel.NoToDoModel _user =  notoModel.NoToDoModel.map(resulTask);
    // print('print after cast: ${_user.taskname}');
    
    
    // print("This is a " +resulTask["${ni.Database.taskName}"]);

    // widget.noToDo.add(_user);

    }
}

}