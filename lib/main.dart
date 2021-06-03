import 'package:flutter/material.dart';
import 'package:schedule_app/lists.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int facultyIndex;
  int groupIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Table',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Расписание СФ БашГУ')),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
          ListView.builder(
          scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: faculty.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Center(
                    child: Text(
                      '${faculty[index]}',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  onTap: () {
                    // show groupo list
                    print('faculty' + '$index');
                    setState(() {
                      facultyIndex = index;
                    });
                  },
                );
              }),
          Builder(builder: (context) {
            if (facultyIndex == 0)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: philology.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80.0,
                  mainAxisExtent: 40,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            philology[index],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            else if (facultyIndex == 1)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: bashkir.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80.0,
                  mainAxisExtent: 40,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            bashkir[index],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            else if (facultyIndex == 2)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: history.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80.0,
                  mainAxisExtent: 40,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            history[index],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            else if (facultyIndex == 3)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: fmit.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80.0,
                  mainAxisExtent: 40,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            fmit[index],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            else if (facultyIndex == 4)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: science.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80.0,
                  mainAxisExtent: 40,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            science[index],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            else if (facultyIndex == 5)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: pip.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80.0,
                  mainAxisExtent: 40,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            pip[index],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            else if (facultyIndex == 6)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: ecomony.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80.0,
                  mainAxisExtent: 40,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            ecomony[index],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            else if (facultyIndex == 7)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: law.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80.0,
                  mainAxisExtent: 40,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            law[index],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            else if (facultyIndex == 8)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: collage.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80.0,
                  mainAxisExtent: 40,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            collage[index],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            else
              return Container(
                width: 0,
                height: 0,
              );
          }),
          Builder(builder: (context) {
            if (facultyIndex == 0 && groupIndex == 0) {
              return Text('monday');
            }
            else {
              return Container(
                width: 0,
                height: 0,
              );
            }
          }
          ),],
          ),
        ),
      ),
    );
  }
}
