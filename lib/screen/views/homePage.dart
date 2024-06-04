// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//   List<Widget> screens = [
//     Center(
//       child: Text("Bosh Sahifa"),
//     ),
//     Center(
//       child: Text("Izlash Sahifa"),
//     ),
//     Center(
//       child: Text("Profil Sahifa"),
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: const Text('Home Page'),
//         centerTitle: true,
//       ),
//       body: Row(
//         children: <Widget>[
//           NavigationRail(
//             backgroundColor: Colors.grey[200],
//             selectedIndex: _selectedIndex,
//             onDestinationSelected: _onItemTapped,
//             labelType: NavigationRailLabelType.selected,
//             destinations: const <NavigationRailDestination>[
//               NavigationRailDestination(
//                 icon: Icon(
//                   Icons.home,
//                 ),
//                 label: Text("Home"),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(
//                   Icons.bar_chart,
//                 ),
//                 label: Text("Natijalar"),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(
//                   Icons.person,
//                 ),
//                 label: Text("Person"),
//               ),
//             ],
//           ),
//           Expanded(
//             child: screens[_selectedIndex], //RELOAD  usuli

//           )
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bar_chart),
//             label: "Natijalar",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "Person",
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.red,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

/*
RELOAD   usulida
icon: Icon(Icons.home), bosganda
 GridView ichida ikkita contenor chiqsin 1-contenor RELOAD usulda bosganda rejalar oynasi ochilsin
 4 ta reja  bo'lsin 2 tasi bajarilgan 
rejalar nechta bajarilgan ga pitichka qo'yish ioji bo'lsin va
bajarilmagan, Reja qo'shish va o'zgartirish iloji bo'lsin rejalar  
 2-contenor RELOAD usulda bosganda Eslatmalarlar oynasi ochilsin
3 ta eslatma bo'lsin
 eslatmalar qo'shish va o'zgartirish iloji bo'lsin rejalar  


icon: Icon(Icons.bar_chart), bosganda 
a rejalar haqida hisobot (nechta bajarilgan va
bajarilmagan rejalar mavjud) va nechta eslatmalar mavjudligi ko’rinib tursin


icon: Icon(Icons.person), bosganda 
 foydalanuvchi haqida ma’lumotlar (ism, familiya, telefon
raqam, rasm) va ushbu ma’lumotlarini o’zgartirish uchun tugma bo’lishi kerak.


Foydalanuvchi ma’lumotlarini o’zgartira olishi uchun
showModalBottomSheet’dan foydalangan holda kerakli textfield’larni ko’rsatib
ma’lumotlarni yangilashga imkon yarating

*/

import 'package:dars_49/screen/Widgets/profile_screen.dart';
import 'package:dars_49/screen/Widgets/reminder_screen.dart';
import 'package:dars_49/screen/Widgets/reports_screen.dart';
import 'package:dars_49/screen/Widgets/task_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
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
        backgroundColor: Colors.amber,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.grey[200],
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskScreen()),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  'Rejalar',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReminderScreen()),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: Center(
                child: Text(
                  'Eslatmalar',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
