import 'package:flutter/material.dart';

import '../../utils/misc/component.dart';

abstract class BaseController extends ChangeNotifier
    with WidgetsBindingObserver {
  BaseController() {
    _isMounted = true;
    // onInitListeners();
  }

  late BuildContext _context;
  BuildContext get context => _context;

  late double _sizeWidth;
  double get sizeWidth => _sizeWidth;
  late double _sizeHeight;
  double get sizeHeight => _sizeHeight;

  late double _scaleWidth;
  double get scaleWidth => _scaleWidth;
  late double _scaleHeight;
  double get scaleHeight => _scaleHeight;
  
  bool _isTablet = true;
  bool get isTablet => _isTablet;

  bool _isMounted = false;
  bool get isMounted => _isMounted;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void onInitState() {}

  @protected
  void onInitListeners() {}

  void setContext(BuildContext newContext) {
    _context = newContext;
    _sizeWidth = Component.sizeWidth(context);
    _sizeHeight = Component.sizeHeight(context);
    _scaleWidth = Component.scaleWidth(context);
    _scaleHeight = Component.scaleHeight(context);
    _isTablet = Component.isTablet(context);
  }

  // @override
  // void dispose() {
  //   _isMounted = false;
  //   super.dispose();
  // }

  @protected
  void refreshUI() {
    if (_isMounted) {
      notifyListeners();
    }
  }

  @protected
  void hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  @protected
  void showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void loadOnStart() {
    _isLoading = true;
  }

  void dismissLoading() {
    _isLoading = false;
    refreshUI();
  }
}
