import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/cart/widgets/cart_screen.dart';
import 'package:education/presentation/screens/me/me_screen.dart';
import 'package:education/presentation/screens/subscription/widgets/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        icon: SvgPicture.asset(
            ImageAssets.home,
          // colorFilter: ColorFilter.mode(Colors.white, BlendMode.colorBurn),
        ),
        title: AppStrings.bottomBarHome,
        activeColorPrimary: ColorManager.white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(ImageAssets.subscription,),
        title: AppStrings.bottomBarSubscription,
        activeColorPrimary: ColorManager.white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(ImageAssets.fav,),
        title: AppStrings.bottomBarCart,
        activeColorPrimary: ColorManager.white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(ImageAssets.me,),
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
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
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
