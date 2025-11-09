import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WaterTrackerModel with ChangeNotifier
{
  final List<String> _waterLog=[];
  List<String> get waterLog => _waterLog;
  
  void addLog(String time)
  {
    _waterLog.add(time);
    notifyListeners();
  }

  void removelog(int index)
  {
    _waterLog.removeAt(index);
    notifyListeners();
  }

}