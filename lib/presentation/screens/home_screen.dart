import 'package:blocsecond/cubit/counter_cubit.dart';
import 'package:blocsecond/presentation/screens/Scond_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title,required this.color}) : super(key: key);

  

  final String title;
  final Color color;


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var scaffold2 = Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if(state.wasIncremented==true){
            Scaffold.of(context).showSnackBar(SnackBar
            (content:Text('incremented'),
            duration:Duration(milliseconds: 300),),);
          }
           if(state.wasIncremented==true){
            Scaffold.of(context).showSnackBar(SnackBar
            (content:Text('decremented'),
            duration:Duration(milliseconds: 300),),);
          }
          // TODO: implement listener
        },
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener:  (context, state) {
          if(state.wasIncremented==true){
            Scaffold.of(context).showSnackBar(SnackBar
            (content:Text('incremented'),
            duration:Duration(milliseconds: 300),),);
          }
           else if(state.wasIncremented==true){
            Scaffold.of(context).showSnackBar(SnackBar
            (content:Text('decremented'),
            duration:Duration(milliseconds: 300),),);
          }
          // TODO: implement listener
        }, 
                  builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    //'$_counter',
                    'BRR,NEGAIVE' + state.counterValue.toString(),
                    //state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    
                    'yaaay' + state.counterValue.toString(),
                    //state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    
                    'Hm,number5' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                   
                  
              }),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      //context.bloc<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    heroTag: Text('${widget.title}#2'),
                    backgroundColor: widget.color,
                    onPressed: () {
                      //BlocProvider.of<CounterCubit>(context).increment();
                      context.bloc<CounterCubit>().increment();
                    },
                    tooltip: 'increment',
                    child: Icon(Icons.add),
                  )
                ],
              ),
              SizedBox(
                height:24,
              ),
              MaterialButton(
                color:widget.color,
                onPressed:(){ Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> BlocProvider.value(
                      value: CounterCubit(),
                      child: SecondScreen (
                      title:'second screen',
                      color: Colors.redAccent),
                      )}
                      child:Text('Go to Second screen'),
               //
               
               
                      ),
                      );},
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
    var scaffold = scaffold2;
    return scaffold;
  }