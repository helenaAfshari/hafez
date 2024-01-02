
abstract class GhazaliatHafezEvent{}
class GhazaliatHafezStart extends GhazaliatHafezEvent{
}
  class InisialEvent extends GhazaliatHafezStart{
  }
class LoadedEvent extends GhazaliatHafezStart{
   
}
class LoadMoreEvent extends GhazaliatHafezStart {
}

class ToggleHeartEvent extends GhazaliatHafezEvent {
  final int index;
  ToggleHeartEvent(this.index);
}




