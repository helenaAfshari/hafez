
import 'package:hafez/core/appbar/drawer_menu.dart';
import 'package:hafez/core/appbar/my_appbar.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafez/pressentation/screens/ghazaliathafez/widgets/list_ghazaliat_widget.dart';
class GhazaliatHafezScreen extends StatefulWidget {
  const GhazaliatHafezScreen({super.key});
  @override
  State<GhazaliatHafezScreen> createState() => _GhazaliatHafezScreenState();
}
class _GhazaliatHafezScreenState extends State<GhazaliatHafezScreen> {
  final GlobalKey<ScaffoldState> _ghazaliatHafezKey = GlobalKey();
  
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
  if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      BlocProvider.of<GhazaliatHafezBloc>(context).add(LoadMoreEvent());
  }}
  );}
   @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {  
    return SafeArea(
      child: Scaffold(
        key: _ghazaliatHafezKey,
         endDrawer: const DrawerWidget(),
        extendBodyBehindAppBar: true,
        appBar: CustomAppBarWidget(
      scaffoldKey: _ghazaliatHafezKey,
      showActionIcon: true,
      title: MyStrings.ghazaliatHafezText,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const BackButton()),
        ),
        backgroundColor: MyColors.primaryColor,
        body: ListGhazaliatWidget(scrollController: scrollController),
      ),
    );
  }
}





