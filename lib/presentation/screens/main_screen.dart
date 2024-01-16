import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/cart/widgets/cart_screen.dart';
import 'package:education/presentation/screens/fav/widgets/fav_screen.dart';
import 'package:education/presentation/screens/me/me_screen.dart';
import 'package:education/presentation/screens/subscription/widgets/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../resources/color_manager.dart';
import '../resources/constants_manager.dart';
import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  int _selectedIndex = 0;

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SubscriptionScreen(),
      const FavScreen(),
      const MeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        onPressed: (BuildContext? context) {
          setState(() {
            _selectedIndex = 0;
            _controller.index = 0;
          });
        },
        icon: _selectedIndex == 0 ? SvgPicture.asset(ImageAssets.homeSelected,) : SvgPicture.asset(ImageAssets.home,),
        title: AppStrings.bottomBarHome,
        activeColorPrimary: ColorManager.white,
      ),
      PersistentBottomNavBarItem(
        onPressed: (BuildContext? context) {
          setState(() {
            _selectedIndex = 1;
            _controller.index = 1;
          });
        },
        icon: _selectedIndex == 1 ? SvgPicture.asset(ImageAssets.subscriptionSelected,) : SvgPicture.asset(ImageAssets.subscription,),
        title: AppStrings.bottomBarSubscription,
        activeColorPrimary: ColorManager.white,
      ),
      PersistentBottomNavBarItem(
        onPressed: (BuildContext? context) {
          setState(() {
            _selectedIndex = 2;
            _controller.index = 2;
          });
        },
        icon: _selectedIndex == 2 ? SvgPicture.asset(ImageAssets.favSelected,) : SvgPicture.asset(ImageAssets.fav,),
        title: AppStrings.bottomBarCart,
        activeColorPrimary: ColorManager.white,
      ),
      PersistentBottomNavBarItem(
        onPressed: (BuildContext? context) {
          setState(() {
            _selectedIndex = 3;
            _controller.index = 3;
          });
        },
        icon: _selectedIndex == 3 ? SvgPicture.asset(ImageAssets.meSelected,) : SvgPicture.asset(ImageAssets.me,),
        title: AppStrings.bottomBarMe,
        activeColorPrimary: ColorManager.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        // backgroundColor: ColorManager.primary,
        decoration: const NavBarDecoration(
          colorBehindNavBar: ColorManager.white,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 12, spreadRadius: 4),
          ],
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: AppConstants.sliderAnimationTime),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: AppConstants.sliderAnimationTime),
        ),
        navBarStyle: NavBarStyle.style13, // Choose the nav bar style with this property.
      ),
    );
  }
}
