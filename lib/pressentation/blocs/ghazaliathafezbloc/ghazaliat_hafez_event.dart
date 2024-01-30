
abstract class GhazaliatHafezEvent{}
class GhazaliatHafezStart extends GhazaliatHafezEvent{
}
class LoadedEvent extends GhazaliatHafezStart{
   
}
class LoadMoreEvent extends GhazaliatHafezStart {
}
final class ChangeColorButtomListClickedEventtt extends GhazaliatHafezStart {
  ChangeColorButtomListClickedEventtt( {required this.id});
  final int id;
}



