

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressState with ChangeNotifier{

  int _current_state=0;
  int get current_state {
    return _current_state;
  }

 void change_current_state(int state){
    _current_state=state;
    notifyListeners();
  }

}