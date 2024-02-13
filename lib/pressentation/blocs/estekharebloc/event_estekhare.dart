
abstract class EstekhareEvent{}
class EstekhareStart extends EstekhareEvent{}
class EstekhareLoadedEvent extends EstekhareStart {
  EstekhareLoadedEvent(this.selectEstekhareId,);
   int selectEstekhareId;
}
class EstekhareLoadedEventt extends EstekhareStart{
   final int selectEstekhareId ;
   EstekhareLoadedEventt(this.selectEstekhareId,);
}
class ChangeTabgg extends EstekhareEvent {
   ChangeTabgg();
}
