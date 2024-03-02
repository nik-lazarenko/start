import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

enum Figure {
  redCircle,
  purpleRectangle;
}

extension on Figure {
  BoxDecoration get decoration => switch (this) {
    Figure.redCircle => BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(100),
    ),
  Figure.purpleRectangle => BoxDecoration(
    color: Colors.deepPurple,
    borderRadius: BorderRadius.zero,
  )
  };
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Figure figure = Figure.purpleRectangle;

  void _setRedCircle() {
    setState(() {
      figure = Figure.redCircle;
    });
  }
  void _setPurpleRectangle() {
    setState(() {
      figure = Figure.purpleRectangle;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: AnimatedContainer(
          width: 200,
          height: 200,
          decoration: figure.decoration,
          duration: const Duration(milliseconds: 500),
          ),
        ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: _setRedCircle,
          tooltip: 'Increment',
          child: const Icon(Icons.circle),
          ),
        const SizedBox(width: 8,),
        FloatingActionButton(
          onPressed: _setPurpleRectangle,
          tooltip: 'Increment',
          child: const Icon(Icons.rectangle),
        ),
        ],
      )
    );

  }
}
