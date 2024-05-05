import 'package:fitti_frontend_app/class/service/exercise_list_service.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:fitti_frontend_app/widget/appbar/custom_appbar.dart';
import 'package:fitti_frontend_app/widget/search/search_Text_Field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({super.key});

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage>
    with TickerProviderStateMixin {
  String searchText = '';

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: context.read<ExerciseListProvider>().exerciseType.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: customAppBar(
            "My Exercise",
            const [
              Icon(Icons.share),
              Icon(Icons.bar_chart),
              Icon(Icons.more_vert),
            ],
          ),
          body: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                    left: 8.0.w,
                    right: 8.0.w,
                    top: 16.0.h,
                  ),
                  child: SearchTextField(
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                  )),
              Consumer<ExerciseListProvider>(
                builder: (context, exerciseListProvider, child) {
                  return TabBar(
                    tabs: exerciseListProvider.exerciseType
                        .map((e) => Tab(text: e))
                        .toList(),
                    controller: tabController,
                    indicatorColor: greenColor,
                    labelStyle: const TextStyle(
                      color: greenColor,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.bold,
                    ),
                    labelPadding: EdgeInsets.zero,
                    onTap: (value) => setState(() {
                      tabController.index = value;
                    }),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                  );
                },
              ),
              Expanded(child: Consumer<ExerciseListProvider>(
                builder: (context, exerciseListProvider, child) {
                  return TabBarView(
                      controller: tabController,
                      children: exerciseListProvider.exerciseType.map((e) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: exerciseListProvider.exerciseList.length,
                            itemBuilder: (context, index) {
                              if (searchText.isNotEmpty &&
                                  !exerciseListProvider.exerciseList[index].name
                                      .contains(searchText.toLowerCase())) {
                                return const SizedBox.shrink();
                              } else {
                                var exerciseName = exerciseListProvider
                                    .exerciseList[index].name;
                                var isCreated = exerciseListProvider
                                    .exerciseList[index].isCreated;
                                return Card(
                                    child: ListTile(
                                  title: Text(exerciseName),
                                  trailing: isCreated
                                      ? IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            exerciseListProvider
                                                .deleteExercise(exerciseName);
                                          },
                                        )
                                      : null,
                                  onTap: () {
                                    Get.back(
                                      result: exerciseListProvider
                                          .exerciseList[index].name,
                                    );
                                  },
                                ));
                              }
                            });
                      }).toList());
                },
              )),
            ],
          )),
    );
  }
}
