
import 'package:hafez/core/appbar/drawer_menu.dart';
import 'package:hafez/core/appbar/my_appbar.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/widgets/list_ghazaliat_favorite_widget.dart';
import 'package:hive/hive.dart';

class GhazaliatFavoriteScreen extends StatefulWidget {
  @override
  State<GhazaliatFavoriteScreen> createState() => _GhazaliatFavoriteScreenState();
}
class _GhazaliatFavoriteScreenState extends State<GhazaliatFavoriteScreen> {
  final box  = Hive.box<Map>(name: 'favBox');
  List<GhazalItemModelEntity> ghazaliat = [];
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  scrollController.addListener(() {
  if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      BlocProvider.of<GhazaliatHafezBloc>(context).add(LoadMoreEvent());
  }});
         Future.microtask(() {
      for (final favEntities in box.keys) { 
        ghazaliat.add(GhazalItemModelEntity.fromJson(box.get(favEntities)! as Map<String, dynamic>));
        setState(() {
        });
      }
    });
  }
  final GlobalKey<ScaffoldState> _ghazaliatFavoriteKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         key: _ghazaliatFavoriteKey,
         endDrawer: const DrawerWidget(),
        extendBodyBehindAppBar: true,
        appBar: CustomAppBarWidget(
      scaffoldKey: _ghazaliatFavoriteKey,
      showActionIcon: true,
    title: MyStrings.ghazaliatHafezText,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const BackButton()),
        ),
        backgroundColor: MyColors.primaryColor,
        body: BlocBuilder<GhazaliatHafezBloc, GhazaliatHafezState>(
            builder: (context, state) {
              if (state is GhazaliatHafezLoadingState  ) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              } 
if (ghazaliat.isEmpty) {
  return Center(
    child: 
    Image.asset('assets/images/emptyList.png',), 
  );
} else if (state is GhazaliatHafezSuccesState) {
  List<GhazalItemModelEntity> modellGhazaliat = state.ghazaliatHafez;
return 
ListGhazaliatFavoriteWidget(scrollController: scrollController, ghazaliatItemModel: modellGhazaliat, ghazaliat: ghazaliat);
   }
               else if (state is GhazaliatHafezErrorState) {
                return Center(
                  child: Text(state.errorText),
                );
              } else {
                print('cannot detect state');
                return Container();
              }  
            },
          ),
      ),
    );
  }
}



