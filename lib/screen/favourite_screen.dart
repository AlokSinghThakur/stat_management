import 'package:flutter/material.dart';

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
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount:10,itemBuilder: (context, index) {
                return ListTile(
                  onTap: (){
                    selecteditem.add(index);
                    setState(() {

                    });

                  },
                    title: Text(
                  " ittem" + index.toString(),
                ),
                trailing: Icon(selecteditem.contains(index) ?Icons.favorite: Icons
                    .favorite_border_outlined),);
              }),
            )
          ],
        ));
  }
}
