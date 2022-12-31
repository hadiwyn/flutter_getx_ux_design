import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  // ValueNotifier untuk mengetahui indeks item yang dipilih
  final ValueNotifier<int> selectedIndexNotifier;
  // PageController untuk mengontrol halaman yang ditampilkan
  final PageController pageController;

  const MyBottomNavBar({
    Key? key,
    required this.selectedIndexNotifier,
    required this.pageController,
  }) : super(key: key);

  void _onItemTapped(int index) {
    // Ubah nilai ValueNotifier saat item dipilih
    selectedIndexNotifier.value = index;
    // Ganti halaman saat item dipilih
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // Gunakan nilai ValueNotifier sebagai currentIndex
      currentIndex: selectedIndexNotifier.value,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 35,
            color: selectedIndexNotifier == 0 ? Colors.lightBlue : Colors.grey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
            size: 35,
            color: selectedIndexNotifier == 1 ? Colors.lightBlue : Colors.grey,
          ),
          label: '',
        ),
      ],
    );
  }
}
