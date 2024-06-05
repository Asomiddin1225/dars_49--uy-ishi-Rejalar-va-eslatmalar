import 'package:dars_49/lib1/screen/Widgets/home_screen.dart';
import 'package:dars_49/lib1/screen/Widgets/profile_screen.dart';
import 'package:dars_49/lib1/screen/Widgets/reports_screen.dart';
import 'package:dars_49/lib2/controllers/settings_controller.dart';
import 'package:dars_49/lib2/views/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final SettingsController settingsController;

  const HomePage(this.settingsController, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> get screens => [
        HomeScreen(settingsController: widget.settingsController),
        ReportsScreen(),
        ProfileScreen(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.settingsController.appBarColor,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: widget.settingsController.appBarColor,
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'Menyu',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/asom.png'),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.edit_note_sharp,
                          size: 40,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Sozlamalar'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingsPage(widget.settingsController)),
                );
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: widget.settingsController.appBarColor,
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("Home"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart),
                label: Text("Natijalar"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text("Person"),
              ),
            ],
          ),
          Expanded(
            child: screens[_selectedIndex],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Natijalar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
