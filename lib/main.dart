import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const title = 'Flutter course from Alura';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: title,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xfff5f5f5),
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Courses to do'),
            centerTitle: true,
          ),
          body: ListView(
            children: const [
              Task('Flutter: From Beginner to Pro'),
              Task('Advanced Java JPA'),
              Task('Spring Rest'),
              Task('Kotlin + Spring'),
              Task('Python Advanced'),
              Task('Python for Data Analysis'),
              Task('Kotlin for Android'),
              Task('Advancing with Kotlin'),
            ],
          ),
        ),
      );
}

class Task extends StatefulWidget {
  final String nome;

  const Task(this.nome, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  double progress = 0;
  bool _isMaxReached = false;

  bool get isMaxReached {
    _isMaxReached = level == 10 ? false : true;
    return _isMaxReached;
  }

  void increaseProgress() {
    if (isMaxReached) {
      level++;
      progress += 0.1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 140,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.black12,
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => setState(() => increaseProgress()),
                          child: SizedBox(
                            height: 60,
                            width: 55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text('Level up')
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: progress,
                        ),
                      ),
                      Text(
                        "Level: $level",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
