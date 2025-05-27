import 'package:fluro/fluro.dart';
import 'package:flutter_boilerplate_code/src/features/cart/presentation/screens/screen_cart.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/screens/screen_categoory_women_tops_grid_view.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/screens/screen_category.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/screens/screen_category_brand.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/screens/screen_category_filters.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/screens/screen_category_list.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/screens/screen_category_women_tops.dart';
import 'package:flutter_boilerplate_code/src/features/errors/presentation/screens/screen_error.dart';
import 'package:flutter_boilerplate_code/src/features/favourite/presentation/screens/screen_favourite.dart';
import 'package:flutter_boilerplate_code/src/features/products/presentation/screens/screen_product_details.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/screens/screen_home.dart';
import 'package:flutter_boilerplate_code/src/features/products/presentation/screens/screen_review.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/screens/screen_my_order.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/screens/screen_order_details.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/screens/screen_profile.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/screens/screen_profile_setting.dart';
import 'package:flutter_boilerplate_code/src/routes/routes.dart';

class RouterHelper {
  static final FluroRouter router = FluroRouter();

  ///Handlers
  static final Handler _homeScreenHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenHome();
  });
  static final Handler _cartScreenHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenCart();
  });
  static final Handler _favouriteScreenHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenFavourite();
  });
  static final Handler _profileScreenHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenProfile();
  });

  static final Handler _profileScreenSettingHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenProfileSetting();
  });

  static final Handler _profileMyOrderHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenMyOrder();
  });

  static final Handler _orderDetailsHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenOrderDetails();
  });

  static final Handler _categoriesHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenCategory();
  });

  static final Handler _productDetailsHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenProductDetails();
  });

  static final Handler _reviewsHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreensReviews();
  });

  static final Handler _categoriesListHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenCategoryList();
  });

  static final Handler _categoriesWomenTopsHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenCategoryWomenTops();
  });

  static final Handler _categoriesFiltersHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenCategoryFilters();
  });

  static final Handler _categoriesBrandsHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenCategoryBrands();
  });

  static final Handler _notFoundHandler =
      Handler(handlerFunc: (context, parameters) => const ScreenError());

  void setupRouter() {
    router.notFoundHandler = _notFoundHandler;

    //main-nav flow
    router.define(
      Routes.homeScreen,
      handler: _homeScreenHandler,
      transitionType: TransitionType.fadeIn,
    );

    // product details page
    router.define(
      Routes.productDetails,
      handler: _productDetailsHandler,
      transitionType: TransitionType.inFromBottom,
    );

    // reviews and rating page
    router.define(
      Routes.reviews,
      handler: _reviewsHandler,
      transitionType: TransitionType.inFromBottom,
    );

    // Categories page
    router.define(
      Routes.categories,
      handler: _categoriesHandler,
      transitionType: TransitionType.fadeIn,
    );

    // Categories List page
    router.define(
      Routes.categoriesList,
      handler: _categoriesListHandler,
      transitionType: TransitionType.cupertino,
    );

    // Categories Women Tops page
    router.define(
      Routes.categoriesWomenTops,
      handler: _categoriesWomenTopsHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      Routes.categoriesFilters,
      handler: _categoriesFiltersHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      Routes.categoriesBrands,
      handler: _categoriesBrandsHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      Routes.cart,
      handler: _cartScreenHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      Routes.favourite,
      handler: _favouriteScreenHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      Routes.profile,
      handler: _profileScreenHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      Routes.profileSetting,
      handler: _profileScreenSettingHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      Routes.profileMyOrder,
      handler: _profileMyOrderHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      Routes.orderDetails,
      handler: _orderDetailsHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
