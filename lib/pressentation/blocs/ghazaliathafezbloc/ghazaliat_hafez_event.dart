
import 'package:equatable/equatable.dart';

abstract class GhazaliatHafezEvent extends Equatable{GhazaliatHafezEvent();}

class LoadedEvent extends GhazaliatHafezEvent{
 final int perPage;
 final int page;
  LoadedEvent({required this.perPage, required this.page});
  @override
  List<Object?> get props => [perPage,page];
}




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





