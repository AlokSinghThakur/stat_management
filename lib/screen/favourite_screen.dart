import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stat_management/screen/myFavourite_screen.dart';

import '../provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selecteditem = [];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: Text("Favourite App"),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavouriteScreen()));
   },child: Icon(Icons.favorite)),
                
            SizedBox(width: 20,)
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount:10,itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(builder: (context,value,child){
                  return  ListTile(
                    onTap: (){
                      if(value.selectedItem.contains(index)){
                        value.removeItem(index);

                      }else{
                        value.addItem(index);
                      }
                    },
                    title: Text(
                      " item" + index.toString(),
                    ),
                    trailing: Icon(value.selectedItem.contains(index) ?Icons.favorite: Icons
                        .favorite_border_outlined),);
                });
              }),
            )
          ],
        ));
  }
}
