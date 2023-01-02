import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {

  @override
  Widget build(BuildContext context) {
   final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Favourite App"),
          // actions: [
          //   InkWell(
          //       onTap: () {
          //         Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavouriteScreen()));
          //       },child: Icon(Icons.favorite)),
          //
          //   SizedBox(width: 20,)
          // ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount:favouriteProvider.selectedItem.length,itemBuilder: (context,
                  index) {
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

