
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
abstract class StekharehState {}
class InisialEstekhareState extends StekharehState{}
class SuccesEstekhareState extends StekharehState{
  SuccesEstekhareState(this.ghazaliatHafezEstekhare,);
   final List<GhazalItemModelEntity> ghazaliatHafezEstekhare;
  }
class LoadingEstekhareState extends StekharehState{}
class ErrorEstekhareState extends StekharehState{
 final String errorText;
 ErrorEstekhareState(this.errorText);
}

