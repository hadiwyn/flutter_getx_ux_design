import 'package:get/get.dart';

import '../modules/add_data_kehilangan/bindings/add_data_kehilangan_binding.dart';
import '../modules/add_data_kehilangan/views/add_data_kehilangan_view.dart';
import '../modules/add_data_penemuan/bindings/add_data_penemuan_binding.dart';
import '../modules/add_data_penemuan/views/add_data_penemuan_view.dart';
import '../modules/detail_data_penemuan/bindings/detail_data_penemuan_binding.dart';
import '../modules/detail_data_penemuan/views/detail_data_penemuan_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/more_barang_ditemukan/bindings/more_barang_ditemukan_binding.dart';
import '../modules/more_barang_ditemukan/views/more_barang_ditemukan_view.dart';
import '../modules/more_barang_hilang/bindings/more_barang_hilang_binding.dart';
import '../modules/more_barang_hilang/views/more_barang_hilang_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DATA_KEHILANGAN,
      page: () => AddDataKehilanganView(),
      binding: AddDataKehilanganBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DATA_PENEMUAN,
      page: () => AddDataPenemuanView(),
      binding: AddDataPenemuanBinding(),
    ),
    GetPage(
      name: _Paths.MORE_BARANG_DITEMUKAN,
      page: () => MoreBarangDitemukanView(),
      binding: MoreBarangDitemukanBinding(),
    ),
    GetPage(
      name: _Paths.MORE_BARANG_HILANG,
      page: () => const MoreBarangHilangView(),
      binding: MoreBarangHilangBinding(),
    ),
  ];
}
