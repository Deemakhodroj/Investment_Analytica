import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//change notifier class this will make the change to app
class LanguageChangeProvider with ChangeNotifier {
  Locale _currentLocal = Locale('en');
  Locale get currentLocal => _currentLocal;
  //we need a function that any widget can call to change the local language
  void changeLocal(String _local) {
    this._currentLocal = Locale(_local);
    //notifylisiner function this widget who register themselefes to these changes ,they will get all the changes done by other widget
//a wiget will subscribe to changes and if other widget make changes , it will recive the changes
    notifyListeners();
  }
}
