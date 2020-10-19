import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/secondScreen': (context) => SecondScreen(),
        '/secondScreenWithData': (context) => SecondScreenWthData(),
        '/returnDataScreen': (context) => ReturnDataScreen(),
        '/replacementScreen': (context) => ReplacementScreen(),
        '/anotherScreen': (context) => AnotherScreen()
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Navigation & Routing"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('Go To Second Screen'),
                onPressed: () {
                  Navigator.pushNamed(context, '/secondScreen');
                }),
            RaisedButton(
                child: Text('Navigation with Data'),
                onPressed: () {
                  Navigator.pushNamed(context, '/secondScreenWithData',
                      arguments: 'Annyeong from first screen');
                }),
            RaisedButton(
              child: Text('Return Data from Another Screen'),
              onPressed: () async {
                final result =
                    await Navigator.pushNamed(context, '/returnDataScreen');
                Snackbar snackbar = SnackBar(content: Text('$result'));
                _scaffoldKey.currentState.showSnackbar(snackbar);
              },
            ),
            RaisedButton(
              child: Text('Replace Screen'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}

class SecondScreenWthData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data),
            RaisedButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}

class ReturnDataScreen extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(labelText: 'Enter your name'),
              ),
            ),
            RaisedButton(
                child: Text('Send'),
                onPressed: () {
                  Navigator.pop(context, textController.text);
                })
          ],
        ),
      ),
    );
  }
}

class ReplacementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text('Open Another Screen'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/anotherScreen');
            }),
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Back to First Screen'),
            RaisedButton(
                child: Text("back"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
