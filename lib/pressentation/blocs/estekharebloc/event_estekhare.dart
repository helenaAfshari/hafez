
import 'dart:math';

import 'package:flutter/widgets.dart';

abstract class EstekhareEvent{}
class EstekhareStart extends EstekhareEvent{}
class EstekhareLoadedEvent extends EstekhareStart {
  EstekhareLoadedEvent(this.selectEstekhareId,);
   int selectEstekhareId;
  //  bool cliccckkkeeddd;
  //  Offset? tapPosition;
 
}

// class EstekhareLoadedEvent extends EstekhareStart{

class EstekhareLoadedEventt extends EstekhareStart{
   final int selectEstekhareId ;
   
  EstekhareLoadedEventt(this.selectEstekhareId,);
}

// class ClickedEvent extends  EstekhareEvent{
//   ClickedEvent(this.isClicked);
//   bool isClicked = false;
// }

 class ChangeTab extends EstekhareStart{
  ChangeTab(this.e);
  bool e ;
}
class ChangeTabgg extends EstekhareEvent {
   ChangeTabgg();

}
// class ClickedEvent extends EstekhareStart{
//   ClickedEvent(this.isClicked);

//   // ClickedEvent(this.id,);
//   //  final int id;
//     bool isClicked =false;
//   // final Offset globalPosition;
// }

// class EstekhareLoadedEvent extends EstekhareStart{
//    final int selectEstekhareId ;
//   EstekhareLoadedEvent(this.selectEstekhareId);
// }
