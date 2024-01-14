import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/cart/widgets/cart_screen.dart';
import 'package:education/presentation/screens/me/me_screen.dart';
import 'package:education/presentation/screens/subscription/widgets/subscription_screen.dart';
import 'package:education/presentation/widgets/app_bar_actions.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../resources/color_manager.dart';
import '../resources/constants_manager.dart';
import 'home/home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SubscriptionScreen(),
      const CartScreen(),
      const MeScreen(),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home, color: ColorManager.white,),
        title: AppStrings.bottomBarHome,
        activeColorPrimary: ColorManager.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.subscriptions_outlined, color: ColorManager.white,),
        title: AppStrings.bottomBarSubscription,
        activeColorPrimary: ColorManager.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart, color: ColorManager.white,),
        title: AppStrings.bottomBarCart,
        activeColorPrimary: ColorManager.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person, color: ColorManager.white,),
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
        backgroundColor: ColorManager.primary,
        decoration: const NavBarDecoration(
          colorBehindNavBar: ColorManager.white,
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
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
