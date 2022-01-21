import 'package:dash_widget/store/listing_store.dart';
import 'package:flutter/material.dart';
import 'package:dash_widget/dash_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import './journey.dart';
import 'store/dash_store.dart';
import 'screens/applicants_listing.dart';
import 'screens/jobs_listing.dart';
import 'screens/admin_listing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ListingStore _listingStore = ListingStore();
  final DashStore _dashStore = DashStore();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ListingStore>(create: (_) => _listingStore),
        Provider<DashStore>(create: (_) => _dashStore),
      ],
      child: Observer(
          name: 'global-observer',
          builder: (context) {
            return MaterialApp(
              title: 'Flutter Demo',
              initialRoute: '/',
              routes: {
                // When navigating to the "/" route, build the FirstScreen widget.
                '/': (context) => AdminListing(),
                // When navigating to the "/second" route, build the SecondScreen widget.
                '/second': (context) => const Journey(),
                '/job': (_) => ListingScreen(),
                '/application': (_) => ApplicationsListingScreen(),
                // '/quiz': (_) => WizardForm(),
                '/timer': (_) => CountdownPage(),
                '/landing': (_) => CountdownPage(),
                '/calling_page': (_) => ListingScreen(
                    mode: 'company_role', pushRouteName: '/candidates_page'),
                '/client_page': (_) => ListingScreen(
                    mode: 'company_role', pushRouteName: '/candidates_page'),
                '/candidates_page': (_) => ListingScreen(
                      mode: 'candidate',
                    ),
              },

              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'ListingStore value in example/main initial',
              ),
              Text(
                '${Provider.of<ListingStore>(context, listen: false).value}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Observer(
                  builder: (_) => Text(
                        '${Provider.of<ListingStore>(context, listen: false).selectedItem} dynamic Jobs store value in example/main',
                      )),
              // Observer(
              //     builder: (_) => Text(
              //           '${Provider.of<DashStore>(context, listen: false).jobSelected} dynamic Jobs store value in example/main',
              //         )),
              Observer(
                  builder: (_) => Text(
                        '${Provider.of<ListingStore>(context, listen: false).value} dynamic Jobs store value in example/main',
                      )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
