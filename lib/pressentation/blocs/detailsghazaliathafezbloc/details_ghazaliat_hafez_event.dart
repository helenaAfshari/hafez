
abstract class DetailsGhazaliatHafezEvent{}

class DetailsGhazaliatHafezStart extends DetailsGhazaliatHafezEvent{}


class InisiallEvent extends DetailsGhazaliatHafezStart{}
class LoadedddEvent extends DetailsGhazaliatHafezStart{
  final int selectedPoemIdd ;
  LoadedddEvent(this.selectedPoemIdd);
}


