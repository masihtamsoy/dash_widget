import 'package:dash_widget/store/listing_store.dart';
import 'package:flutter/material.dart';
import 'package:dash_widget/dash_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import './journey.dart';
import 'store/dash_store.dart';
import 'screens/applicants_listing.dart';
import 'screens/jobs_listing.dart';

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
                '/': (context) => JobsListingScreen(),
                // When navigating to the "/second" route, build the SecondScreen widget.
                '/second': (context) => const Journey(),
                '/job': (_) => JobsListingScreen(),
                '/application': (_) => ApplicationsListingScreen(),
              },

              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              //INFO: Pass app context or state
              // Idea is that User can access current state of JobStore
              // JobStoreWidgetWrapper(clientContext: context),
              // LnativelistingStore = dash_widget.store(_listingStore);
              // LnativelistingStore.value
              // INFO: This strategy does not work JobStoreWidgetWrapper is child?
              // const JobStoreWidgetWrapper(),

              // ListingUiStoreWizard(
              //     mode: "application",
              //     pushRouteName: '/job',
              //     getCallbackStore: () =>
              //         Provider.of<DashStore>(context, listen: false)),

              // ListingUiStoreWizard(
              //     mode: "job",
              //     pushRouteName: '/application',
              //     getCallbackStore: () {
              //       return Provider.of<DashStore>(context, listen: false);
              //     }
              //     // Provider.of<DashStore>(context, listen: false)
              //     ),

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
