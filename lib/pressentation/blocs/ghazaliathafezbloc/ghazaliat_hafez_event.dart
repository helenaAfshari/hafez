
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazal_hafez.dart';
import 'package:equatable/equatable.dart';

// abstract class GhazaliatHafezEvent extends Equatable{
//   GhazaliatHafezEvent();}

//   class InisialEvent extends GhazaliatHafezEvent{
//   @override
//   List<Object?> get props => [];
//   }
  
// class LoadedEvent extends GhazaliatHafezEvent{
//   final int perPage;
//  final int page;
//  final List<GhazaliatHafez> ghazaliatHafez;
//   LoadedEvent( this.perPage, this.page, this.ghazaliatHafez);
//   @override
//   List<Object?> get props => [perPage,page,ghazaliatHafez];
// }



abstract class GhazaliatHafezEvent extends Equatable{
  GhazaliatHafezEvent();}

  class InisialEvent extends GhazaliatHafezEvent{
  @override
  List<Object?> get props => [];
  }
  
class LoadedEvent extends GhazaliatHafezEvent{
  
//  final List<GhazaliatHafez> ghazaliatHafez;
  @override
  List<Object?> get props => [];
}







// class LoadedEvent extends GhazaliatHafezEvent {
//   final int perPage;
//   final int page;
//   final List<GhazaliatHafez> ghazaliatHafez;

//   LoadedEvent({
//     int? perPage,
//     int? page,
//     List<GhazaliatHafez>? ghazaliatHafez,
//   })  : perPage = perPage ?? 0,
//         page = page ?? 0,
//         ghazaliatHafez = ghazaliatHafez ?? [];

//   @override
//   List<Object?> get props => [perPage, page, ghazaliatHafez];
// }





//inisialLoad
// این بالایی همون اول قرار یک روخداد صورت بگیره  و بگه شما برو غزلیات رو بیار 


//این دوتا دیتا نیاز داره 
//perPage و page
//داخل بلاک هندلش میکنیم 
////loadMore 
///این برای زمانی که به انتها اسکرول میخوریم  به انتها لیست رسیدیم  و میتونیم به بخش دیگه ایی هم درخواست بدیم  و اطلاعات بیشتری را بیایییم  دریافت کنیم
// abstract class GhazaliatHafezEvent {
//   const GhazaliatHafezEvent();
// }
//  class InitialLoadEvent extends GhazaliatHafezEvent{
  
//  }

//  class LoadMoreEvent extends GhazaliatHafezEvent{

//  }





