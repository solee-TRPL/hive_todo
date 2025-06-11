import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/extension/space_exs.dart';
import 'package:hive_todo/main.dart';
import 'package:hive_todo/models/task.dart';
import 'package:hive_todo/utils/app_colors.dart';
import 'package:hive_todo/utils/app_str.dart';
import 'package:hive_todo/utils/constants.dart';
import 'package:hive_todo/views/home/component/fab.dart';
import 'package:hive_todo/views/home/component/home_app_bar.dart';
import 'package:hive_todo/views/home/component/slider_drawer.dart';
import 'package:hive_todo/views/home/widget/task_widget.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();

  // cheack value of circle indicator
  dynamic valueOfIndicator(List<Task> task) {
    if (task.isNotEmpty) {
      return task.length;
    } else {
      return 3;
    }
  }

  // Check done task
  int checkDoneTask(List<Task> tasks) {
    int i = 0;
    for (Task doneTask in tasks) {
      if (doneTask.isCompleted) {
        i++;
      }
    }

    return i;
  }


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTask(),
      builder: (ctx, Box<Task> box, Widget? child) {
        var tasks = box.values.toList();

        // For sorting list
        tasks.sort((a, b) => a.createdAtDate.compareTo(b.createdAtDate));

        return Scaffold(
          backgroundColor: Colors.white,

          // Fab
          floatingActionButton: Fab(),

          // Body
          body: SliderDrawer(
            key: drawerKey,
            isDraggable: false,
            animationDuration: 1000,
            // Drawer
            slider: CustomDrawer(),

            appBar: HomeAppBar(drarwerKey: drawerKey),

            // Main body
            child: _buildHomeBody(textTheme, base, tasks),
          ),
        );
      },
    );
  }

  // Home Body
  Widget _buildHomeBody(
    TextTheme textTheme,
    BaseWidget base,
    List<Task> tasks,
  ) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60),
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    value: checkDoneTask(tasks) / valueOfIndicator(tasks),
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                  ),
                ),
                25.w,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStr.mainTitle, style: textTheme.displayLarge),
                    3.h,
                    Text("${checkDoneTask(tasks)} of ${tasks.length} task", style: textTheme.titleMedium),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(thickness: 2, indent: 100),
          ),

          SizedBox(
            width: double.infinity,
            height: 500,
            child:
                tasks.isNotEmpty
                    // Task list is Not Empty
                    ? ListView.builder(
                      itemCount: tasks.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        // get single task for showing in list
                        var task = tasks[index];
                        return Dismissible(
                          direction: DismissDirection.horizontal,
                          onDismissed: (_) {
                            base.dataStore.deleteTask(task: task);
                          },
                          background: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete_outline, color: Colors.grey),
                              8.w,
                              Text(
                                AppStr.deletedTask,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          key: Key(task.id),
                          child: TaskWidget(
                            // this is only for test
                            // we will load tasks from DB later one
                            task: task,
                          ),
                        );
                      },
                    )
                    // Task list is Empty
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // lottie anime
                        FadeIn(
                          child: SizedBox(
                            width: 500,
                            height: 500,
                            child: Lottie.asset(
                              lottieUrl,
                              animate: tasks.isNotEmpty ? false : true,
                            ),
                          ),
                        ),

                        // sub Text
                        FadeInUp(from: 30, child: Text(AppStr.doneAllTask)),
                      ],
                    ),
          ),
        ],
      ),
    );
  }
}
