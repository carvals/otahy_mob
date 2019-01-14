import 'package:flutter/material.dart';
import 'add_shop.dart';
import 'show_movie.dart';


class SelectItemForm extends StatefulWidget {
  @override
  _SelectItemFormState createState() => _SelectItemFormState();
}

class _SelectItemFormState extends State<SelectItemForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Select Items'),
      ),
      body: new Container(
        padding: EdgeInsets.symmetric(horizontal:8.0, vertical:20.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem('Event', Icons.new_releases,CardType.Event),
            makeDashboardItem('Shop', Icons.store, CardType.Shop),
            makeDashboardItem('Product', Icons.queue, CardType.Product),
            makeDashboardItem('Services', Icons.room_service, CardType.Services),
          ],
        ),
      ),
    );
  }

//new method here



Card makeDashboardItem(String title, IconData icon, CardType cardType) {
    
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: ()  {
                switch(cardType)
                {
                  case CardType.Event:
                  debugPrint("event");
                  break;

                  case CardType.Product:
                  debugPrint("product");
                  break;

                  case CardType.Services:
                  showMovieForm(context, 'Services' );
                  break;
                  
                  case CardType.Shop:
                  showAddShopForm(context, 'store');
                  break;

                }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
//route
void showAddShopForm(BuildContext context, String store) async{
  Map resulTask = await Navigator.of(context).push(
    MaterialPageRoute<Map>(builder: (BuildContext context)
    => new AddShop())
 ); // end push

  //do someting when task come back
    if(resulTask != null && resulTask.containsKey("taskname"))
    {
    

    }
}

void showMovieForm(BuildContext context, String store) async{
  Map resulTask = await Navigator.of(context).push(
    MaterialPageRoute<Map>(builder: (BuildContext context)
    => new ShowMovie())
 ); // end push

}



  
}

enum CardType{
  Event,
  Product,
  Services,
  Shop

}