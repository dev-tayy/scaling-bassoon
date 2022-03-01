
import 'package:defi/screens/history_screen.dart';
import 'package:defi/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = const [
    HistoryScreen(),
    HistoryScreen(),
    HistoryScreen(),
    HistoryScreen(),
  ];

  setStateIfMounted(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: _children, index: _currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setStateIfMounted(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.blackShade3,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart,
                color: _currentIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.blackShade3),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language,
                color: _currentIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.blackShade3),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_sharp,
                color: _currentIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.blackShade3),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,
                color: _currentIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.blackShade3),
            label: '',
          ),
        ],
      ),
    );
  }
}
