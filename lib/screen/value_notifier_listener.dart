import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
   NotifyListenerScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateLess Widget'),
      ),
      body:

      Column(
        children: [
          ValueListenableBuilder(valueListenable: toggle, builder: (context, value,child){
return  TextFormField(
  obscureText:toggle.value,
  decoration: InputDecoration(
      hintText: 'Password',
      suffixIcon: InkWell(
          onTap: (){
            toggle.value = !toggle.value;
          },
          child: Icon(toggle.value? Icons.visibility_off_outlined: Icons.visibility))
  ),
);
          }),


          Center(
            child: ValueListenableBuilder(
              builder: (context, value,child){
                return Text(_counter.value.toString(),style: TextStyle(fontSize: 30),);
              }, valueListenable: _counter,

            )

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
