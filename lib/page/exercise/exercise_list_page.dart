import 'package:fitti_frontend_app/class/provider/exercise_list_provider.dart';
import 'package:fitti_frontend_app/page/exercise/exercise_add_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({super.key});

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('운동 목록'),
            actions: [
              PopupMenuButton(
                itemBuilder: ((context) => [
                      for (final value in MenuType.values)
                        PopupMenuItem(
                          value: value,
                          child: Text(value.toString()),
                          onTap: () {
                            switch (value) {
                              case MenuType.addExercise:
                                Get.to(
                                  () => ExerciseAddPage(),
                                );
                                break;
                            }
                          },
                        )
                    ]),
              )
            ],
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: '검색',
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Consumer<ExerciseListProvider>(
                  builder: (context, exerciseListProvider, child) {
                    return ListView.builder(
                      itemCount: exerciseListProvider.exerciseList.length,
                      itemBuilder: (context, index) {
                        if (searchText.isNotEmpty &&
                            !exerciseListProvider.exerciseList[index].name
                                .contains(searchText.toLowerCase())) {
                          return const SizedBox.shrink();
                        } else {
                          var exerciseName =
                              exerciseListProvider.exerciseList[index].name;
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
                                  result:
                                      exerciseListProvider.exerciseList[index]);
                            },
                          ));
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

enum MenuType {
  addExercise;

  @override
  String toString() {
    switch (this) {
      case MenuType.addExercise:
        return '운동 추가하기';
      default:
        return '';
    }
  }
}
