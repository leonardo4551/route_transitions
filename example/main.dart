import 'package:flutter/material.dart';
import 'package:route_transition_lmg/route_transition_lmg.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pap',
      initialRoute: 'page1',
      routes: {
        'page1': ( _ ) => Page1(),
        'page2': ( _ ) => Page2(),
      },
    );
  }
}

 
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( ' Page 1 ' ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: MaterialButton(
          child: Text('papu1 listo para ir a papu2'),
          color: Colors.white,
          onPressed: () {


             RuteTransitions(
             context: context,
             child: Page2(),
             animation: AnimationType.fadeIn,
             duracion: Duration( milliseconds: 100 ),
             replacement: true
           );


          } 
        )
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text( ' Page 2 ' ),
        backgroundColor: Colors.transparent,
       ),
      backgroundColor: Colors.yellowAccent,
      body: Center(
        child: Text( 'papu2' ),
      ),
    );
  }
}