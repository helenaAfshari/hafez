
abstract class EstekhareEvent{}
class EstekhareStart extends EstekhareEvent{}


class EstekhareLoadedEvent extends EstekhareStart{
   final int selectEstekhareId ;
  EstekhareLoadedEvent(this.selectEstekhareId);
}



class ClickedEvent extends EstekhareStart{
  ClickedEvent(this.id);
  final int id;
}