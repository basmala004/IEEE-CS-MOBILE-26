import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/screens/task_screen.dart';
import 'archive_screen.dart';
import 'done_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 1);
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 1,
  );
  var titleController = TextEditingController();
  var timeeController = TextEditingController();
  var dateController = TextEditingController();

  bool isBottomSheetShown = false;

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  List<Widget> get screens => [
    const DoneScreen(),
    TaskScreen(tasks: tasks),
    const ArchiveScreen(),
  ];

  List<Map> tasks = [];

  late Database database;
  void createDatabase() async {
    database = await openDatabase(
      'path.dp',
      version: 1,
      onCreate: (database, version) async {
        print('database created');
        await database.execute(
          //creating the table that we will store the data in
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)',
        );
      },
      onOpen: (database) async {
        final data = await getDataFromDatabase();
        setState(() {
          tasks = data;
        });
      },
    );
  }

  Future insertToDatabase({
    required String title,
    required String time,
    required String date,
    required String status,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
            'INSERT INTO tasks(title, time, date, status) VALUES(?, ?, ?, ?)',
            [title, time, date, status],
          )
          .then((_) async {
            final data = await getDataFromDatabase();
            setState(() {
              tasks = data;
            });
          });
    });
  }

  Future<List<Map>> getDataFromDatabase() async {
    return await database.rawQuery('SELECT * FROM tasks');
  }

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'All tasks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(screens.length, (index) => screens[index]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: isBottomSheetShown
          ? null
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  isBottomSheetShown = true;
                });
                _scaffoldKey.currentState!.showBottomSheet((context) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defaultTextFormField(
                            labelText: 'Task',
                            hintText: 'Enter Task Name',
                            prefixIcon: Icons.title,
                            controller: titleController,
                            onTap: () {},
                          ),
                          const SizedBox(height: 10),

                          defaultTextFormField(
                            labelText: 'Time',
                            hintText: 'Enter Task Time',
                            prefixIcon: Icons.watch_later,
                            controller: timeeController,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeeController.text = value!
                                    .format(context)
                                    .toString();
                              });
                            },
                          ),
                          const SizedBox(height: 10),

                          defaultTextFormField(
                            labelText: 'Date',
                            hintText: 'Enter Task Date',
                            prefixIcon: Icons.calendar_month,
                            controller: dateController,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2030-12-31'),
                              ).then((value) {
                                dateController.text = DateFormat.yMMMd().format(
                                  value!,
                                );
                              });
                            },
                          ),
                          const SizedBox(height: 20),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.lightBlueAccent,
                                    ),
                                    onPressed: () async {
                                      if (isBottomSheetShown) {
                                        if (formKey.currentState!.validate()) {
                                          await insertToDatabase(
                                            title: titleController.text,
                                            time: timeeController.text,
                                            date: dateController.text,
                                            status: 'status',
                                          ).then((value) {
                                            titleController.clear();
                                            timeeController.clear();
                                            dateController.clear();
                                            Navigator.pop(context);
                                            setState(() {
                                              isBottomSheetShown = false;
                                            });
                                          });
                                        }
                                      }
                                    },
                                    child: Text('ADD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                                ),

                                TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                    ),
                                    onPressed: () async {
                                      titleController.clear();
                                      timeeController.clear();
                                      dateController.clear();
                                      Navigator.pop(context);
                                      setState(() {
                                        isBottomSheetShown = false;
                                      });
                                    },
                                    child: Text('CANCEL', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),)
                                ),



                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).closed.then((_){
                  setState(() {
                    isBottomSheetShown = false;
                  });
                });
                isBottomSheetShown = true;
              },
              child: const Icon(Icons.add, color: Colors.white),
              backgroundColor: Colors.lightBlueAccent,
            ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        notchColor: Colors.lightBlueAccent,
        elevation: 1,
        showLabel: false,
        bottomBarWidth: 500,
        bottomBarItems: [
          bottomBarItem(icon: Icons.check_box, itemLabel: 'Done'),
          bottomBarItem(icon: Icons.home, itemLabel: 'Tasks'),
          bottomBarItem(icon: Icons.archive, itemLabel: 'Archive'),
        ],
        // PS: this line is not like the video , and it might look somehow advanced so you might think i used ai , but it's not true, in fact , android studio it self suggested them to me so i went with them
        onTap: (value) {
          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        kIconSize: 24,
        kBottomRadius: 28,
      ),
    );
  }
}

TextFormField defaultTextFormField({
  required TextEditingController controller,
  required String labelText,
  required String hintText,
  required IconData prefixIcon,
  required GestureTapCallback onTap,
}) => TextFormField(
  controller: controller,
  onTap: onTap,
  validator: (value) {
    if (value!.isEmpty) {
      return 'Please don\'t leave this field empty';
    }
    return null;
  },
  decoration: InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    focusColor: Colors.lightBlueAccent,
    labelText: labelText,
    hintText: hintText,
    prefixIcon: Icon(prefixIcon, color: Colors.lightBlueAccent),
  ),
);

BottomBarItem bottomBarItem({
  required IconData icon,
  required String itemLabel,
}) => BottomBarItem(
  inActiveItem: Icon(icon, color: Colors.lightBlueAccent),
  activeItem: Icon(icon, color: Colors.white),
  itemLabelWidget: Text(
    itemLabel,
    style: const TextStyle(color: Colors.lightBlueAccent),
  ),
);
