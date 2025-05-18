import 'package:fluro/fluro.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/screens/screen_category.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/screens/screen_category_list.dart';
import 'package:flutter_boilerplate_code/src/features/errors/presentation/screens/screen_error.dart';
import 'package:flutter_boilerplate_code/src/features/products/presentation/screens/screen_product_details.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/screens/screen_home.dart';
import 'package:flutter_boilerplate_code/src/features/products/presentation/screens/screen_review.dart';
import 'package:flutter_boilerplate_code/src/routes/routes.dart';

class RouterHelper {
  static final FluroRouter router = FluroRouter();

  ///Handlers
  static final Handler _homeScreenHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenHome();
  });

  static final Handler _productDetailsHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenProductDetails();
  });

  static final Handler _reviewsHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreensReviews();
  });

  static final Handler _categoriesHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenCategory();
  });

  static final Handler _categoriesListHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenCategoryList();
  });

  static final Handler _notFoundHandler =
      Handler(handlerFunc: (context, parameters) => const ScreenError());

  void setupRouter() {
    router.notFoundHandler = _notFoundHandler;

    //main-nav flow
    router.define(Routes.homeScreen,
        handler: _homeScreenHandler,
        transitionType: TransitionType.inFromBottom);

    // product details page
    router.define(Routes.productDetails,
        handler: _productDetailsHandler,
        transitionType: TransitionType.inFromBottom);

    // reviews and rating page
    router.define(Routes.reviews,
        handler: _reviewsHandler, transitionType: TransitionType.inFromBottom);

    // Categories page
    router.define(Routes.categories,
        handler: _categoriesHandler,
        transitionType: TransitionType.inFromBottom);

    // Categories List page
    router.define(Routes.categoriesList,
        handler: _categoriesListHandler,
        transitionType: TransitionType.inFromBottom);
  }
}
