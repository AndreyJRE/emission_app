import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qq_ui/src/router/ActivityType.dart';
import 'package:qq_ui/src/views/add_view.dart';
import 'package:qq_ui/src/views/calendar_screen.dart';
import 'package:qq_ui/src/views/task_screen.dart';

import '../sample_feature/sample_item_details_view.dart';
import '../sample_feature/sample_item_list_view.dart';
import '../settings/settings_controller.dart';
import '../settings/settings_view.dart';

/// The Widget that configures your application.
/// 
class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreen> {
  int _counter = 0;
  int index = 0;
  Widget page = EmissionListView();
  var creating = false;
  void switchOffScreen(){
       setState(() {
    creating = false;});
  }

  

  void switchState(int state) {
    if(!creating){
    setState(() {
      index = state;
      switch (index) {
        case 0:
          page = EmissionListView();
          break;
        case 1:
         page = AddView();
          break;
        case 2:
          page = CalendarScreen();
          break;
        default:

      }
    });}
  }

  

  void prompting(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Enter your Task'),
              content: TextField(
                controller: _textFieldController,
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                    child: Text('Submit'),
                    onPressed: () {
                      //TODO
                      Navigator.pop(context);
                    })
              ]);
        });
  }



  @override
  Widget build(BuildContext context) {
      List<IconData> iconList = [Icons.add_box_outlined, Icons.announcement_outlined, Icons.ac_unit_outlined,Icons.access_alarm_rounded];
   

    return MaterialApp(
      theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black, brightness: Brightness.dark,),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
              ),
            ),

            home: Scaffold(
              body: page,
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () => {},
        ),
      ),
         bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            backgroundColor: Colors.black,
            tabBuilder: (int index, bool isActive) {
              return Icon(
                iconList[index],
                size: 24,
                color: isActive ? Colors.amber : Colors.white,
              );},
            activeIndex: index,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            borderColor: Colors.grey.shade300,
            borderWidth: 3,
            notchMargin: 4,
            leftCornerRadius: 0,
            rightCornerRadius: 0,
            onTap: (index) => switchState(index)),
            //other params
         ),

              
              /* BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_box_outlined),
                    activeIcon: Icon(Icons.add_box_rounded),
                    label: 'Emissions',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.announcement_outlined),
                    activeIcon: Icon(Icons.announcement_rounded),
                    label: 'Calendar',
                  ),
                ],
                backgroundColor: Theme.of(context).primaryColor,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black,
                currentIndex: index,
                onTap: ((value) => switchState(value)),
              ),*/
          );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return const SampleItemListView();
                }
              },
            );
          },
        );
      },
    );
  }
}
