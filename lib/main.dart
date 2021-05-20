import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

List faculty = [
  'Филологический факультет',
  'Факультет башкирской и тюркской филологии',
  'Исторический факультет',
  'Факультет математики и информационных технологий',
  'Естественнонаучный факультет',
  'Факультет педагогики и психологии',
  'Экономический факультет',
  'Юридический факультет',
  'Колледж'
];

List philology = [
  'ИН11',
  'ИН12',
  'МФО11',
  'РО11',
  'ИН21',
  'ИН22',
  'РО21',
  'РО21',
  'СПРО21',
  'СПИН31',
  'ИН32',
  'РО31',
  'ИН41',
  'РО41',
  'ИН51',
  'РО51',
  'ZИН11',
  'ZМФО11',
  'ZМФО21',
  'ZМФО31',
  'ZИН41',
  'ZРО51',
  'ZРО61'
];

List Bashkir = [
  'БИН11',
  'ТЧИН11',
  'БИН21',
  'ТЧИН21',
  'БИН31',
  'ТЧИН31',
  'БИН41',
  'БИН51',
  'ТЧО51',
  'ZБРЯ11',
  'ZИОТФ11',
  'ZБРЯ21',
  'ZИОТФ21',
  'ZБРЯ31',
  'ZМСНП31',
  'ZТЧНО31',
  'ZБРЯ41',
  'ZТЧО41',
  'ZБЯ51'
];

List history = [
  'ИСТ11',
  'ИСТО11',
  'УИСТ11',
  'ИСТ21',
  'ИСТО21',
  'ИСТ31',
  'ИСТО31',
  'ИСТ41',
  'ИСТО41',
  'ZSТЕО11',
  'ZИСТ11',
  'ZМИСТ11',
  'ZSТЕО21',
  'ZИСТ21',
  'ZМИСТ21',
  'ZSТЕО31',
  'ZИСТ31',
  'ZМИСТ31',
  'ZИСТ41',
  'ZИСТ51'
];
List fmit = [
  'АИС11',
  'АР11',
  'ИБ11',
  'ММИ11',
  'МПМИ11',
  'ПИ11',
  'ПМИ11',
  'АИС21',
  'АР21',
  'МИ21',
  'МПМИ21',
  'МФ21ПИ21ПМИ21',
  'ПМИ22',
  'АИС31',
  'АР31',
  'МИ31',
  'ПИ31',
  'ПМИ31',
  'АИС41',
  'МИ41',
  'МФ41',
  'ПМИ41',
  'МИ51',
  'МФ51',
  'OZИБ11',
  'OZМПМИ11',
  'ZSПИ11',
  'ZММИ11',
  'ZПИ11',
  'ZSПИ21',
  'ZММИ21',
  'OZМПМИ31',
  'ZSПИ31',
  'ZММИ31',
  'ZSПМИ51'
];
List science = [
  'БИО11',
  'БИО11',
  'СПБИО11',
  'СПМАШ11',
  'МБИО11',
  'МФИЗ11',
  'ФИ11',
  'ФИЗ11',
  'ХИМ11',
  'БИО21',
  'МАШ21',
  'МФИЗ21',
  'ФИЗ21',
  'ХИМ21',
  'ХТ21',
  'БИО31',
  'МАШ31',
  'ФИ31',
  'ФИЗ31',
  'ХИМ31',
  'БИО41',
  'ПРО41',
  'ТБ41',
  'ФИЗ41',
  'ХИМ41',
  'БФ51',
  'ТИ51',
  'OZМБИО11',
  'OZМХИМ11',
  'OZФПГНП11',
  'ZSБИО11',
  'ZSБИО12',
  'ZSМС11',
  'ZSПБ11',
  'ZSПБ12',
  'ZSТБ11',
  'ZSХТ11',
  'ZSХТ12',
  'ZМАШ11',
  'ZМФИ11',
  'ZПБ11',
  'ZТБ11',
  'ZТИМОВ11',
  'ZХТ11',
  'OZМБИО21',
  'OZМХИМ21',
  'OZФПГНП21',
  'ZSБИО21',
  'ZSМС21',
  'ZSПБ21',
  'ZSПБ22',
  'ZSХТ21',
  'ZSХТ22',
  'ZМАШ21',
  'ZПБ21',
  'ZХТ21',
  'OZМБИО31',
  'OZМХИМ31',
  'OZФПГНП31',
  'ZSБИО31',
  'ZSБИО32',
  'ZSПБ31',
  'ZSХТ31',
  'ZSХТ32',
  'ZМАШ31',
  'ZМФМ31',
  'ZПБ31',
  'ZТТТ31',
  'ZХТ31',
  'ZПБ41',
  'ZХТ41',
  'ZSБИО51',
  'ZSМАШ51',
  'ZSПБ51',
  'ZSПБ52',
  'ZSХТ51',
  'ZПБ51',
  'ZТ51',
  'ZХТ51',
];
List pip = [
  'МНО11',
  'НДО11',
  'НДО11',
  'СПППО11',
  'НДО21',
  'ППО21',
  'НДО31',
  'ППО31',
  'НО41',
  'ППО41',
  'ZSДО11',
  'ZSДО12',
  'ZSНО11',
  'ZSНО12',
  'ZSППО11',
  'ZSППО12',
  'ZSППО13',
  'ZДО11',
  'ZМДО11',
  'ZМНО11',
  'ZМППО11',
  'ZМППО12',
  'ZМРОО11',
  'ZМРОО12',
  'ZНО11',
  'ZППО11',
  'ZSДО21',
  'ZSНО21',
  'ZSППО21',
  'ZДО21',
  'ZМНО21',
  'ZМППО21',
  'ZМППО22',
  'ZМРОО21',
  'ZНО21',
  'ZППО21',
  'ZППО22',
  'ZSДО31',
  'ZSДО32',
  'ZSНО31',
  'ZSППО31',
  'ZДО31',
  'ZМДО31',
  'ZМНО31',
  'ZМНО32',
  'ZМППО31',
  'ZМППО32',
  'ZМРОО31',
  'ZМРОО32',
  'ZНО31',
  'ZППО31',
  'ZППО32',
  'ZДО41',
  'ZНО41',
  'ZППО41',
  'ZППО42',
  'ZSДО51',
  'ZSНО51',
  'ZSППО51',
  'ZSППО52',
  'ZДО51',
  'ZНО51',
  'ZППО51'
];
List ecomony = [
  'ЭБ11',
  'БУАА21',
  'ГМУ21',
  'Б21',
  'БУАА31',
  'ГМУ31',
  'Б31',
  'БУАА41',
  'ГМУ41',
  'К41',
  'ЭБ41',
  'ЭБ42',
  'ЭБ51',
  'ЭБ52',
  'ZSБУАА11',
  'ZSГМУ1',
  '1ZSМО1',
  '1ZSУП11',
  'ZSФК11',
  'ZSЭБ11',
  'ZSЭБ12',
  'ZМГМУ11',
  'ZМО11',
  'ZЭПМ11',
  'ZSБУАА21',
  'ZSМО21',
  'ZSФК21',
  'ZБУАА21',
  'ZУП21',
  'ZУП22',
  'ZЭБ21',
  'ZЭКМ21',
  'ZЭПМ21',
  'ZSБУАА31',
  'ZSМО31',
  'ZSФК31',
  'ZSФК32',
  'ZБУАА31',
  'ZГМУ31',
  'ZУП31',
  'ZУП32',
  'ZЭБ31',
  'ZЭКМ31',
  'ZЭПМ31',
  'ZУП41',
  'ZУП42',
  'ZSБУАА51',
  'ZSБУАА52',
  'ZSММЕД51',
  'ZSМХН51',
  'ZSФК51',
  'ZБУАА51',
  'ZУП51',
  'ZУП52',
  'ZЭБ51',
];
List law = [
  'SГОС11',
  'ГОС11',
  'ПОГМВ11',
  'СПД11',
  'ЮПД11',
  'ГОС21',
  'ГРП21',
  'СПД21',
  'СПД22',
  'ЮПД21',
  'SГОС31',
  'ГОС31',
  'ГОС32',
  'ГРП31',
  'SГОС41',
  'SГОС42',
  'ГОС41',
  'ГОС42',
  'ГОС43',
  'ГРП41',
  'ГРП42',
  'OZSГОС11',
  'OZSГОС12',
  'OZSГОС13',
  'OZSГОС14',
  'OZSГРП11',
  'OZSГРП12',
  'OZГРП11',
  'ZSГОС11',
  'ZSСПД11',
  'ZSСПД12',
  'ZПОГМВ11',
  'ZСПД11',
  'ZЮПД11',
  'ZЮПД12',
  'OZГОС21',
  'OZГОС22',
  'OZГОС23',
  'OZГРП21',
  'ZSГОС21',
  'ZПОГМВ21',
  'ZЮПД21',
  'ZЮПД22',
  'OZSГОС31',
  'OZSГОС32',
  'OZSГОС33',
  'OZSГРП31',
  'OZSГРП32',
  'OZГОС31',
  'OZГОС32',
  'OZГРП31',
  'ZПОГМВ31',
  'ZЮПД31',
  'ZЮПД32',
  'ZЮПД33',
  'OZSГОС41',
  'OZSГОС42',
  'OZSГРП41',
  'OZSГРП42',
  'OZГОС41',
  'OZГРП41',
  'OZSГОС51',
  'OZSГОС52',
  'OZSГРП51',
  'ZSГОС51',
  'ZГОС51',
  'ZГОС52',
  'ZГРП51',
];
List collage = [
  '2БД11',
  '2Ф11',
  '2Э11',
  '3БД11',
  '3БПЛ11',
  '3ГС11',
  '3ИСП11',
  '3М11',
  '3НО11',
  '3ПСО11',
  '3ПСО12',
  '3ПСО13',
  '3ПСО14',
  '3СА11',
  '3СА12',
  '3Ф11',
  '3Э11',
  '4БПЛ11',
  '4М11',
  '4НО11',
  '2ГС21',
  '2ПСО11',
  '2ПСО12',
  '3БД21',
  '3ГС21',
  '3НО21',
  '3ПСО21',
  '3ПСО22',
  '3ПСО23',
  '3ПСО24',
  '3СА21',
  '3СА22',
  '3Ф21',
  '3Э21',
  '4БПЛ21',
  '4М21',
  '4НО21',
  '2БД21',
  '2ПСО21',
  '2Ф21',
  '2Э21',
  '3БД31',
  '3БПЛ2',
  '13ГС31',
  '3М21',
  '3ПСО31',
  '3ПСО32',
  '3ПСО33',
  '3ПСО34',
  '3ПСО35',
  '3СА31',
  '3Ф31',
  '3Э31',
  '4НО31',
  '3НО31',
  '4НО41',
  'Z3ПСО11',
  'Z3Э11',
  'Z4М11',
  'Z4ПСО11',
  'Z3ПСО21',
  'Z4ПСО21',
  'Z3ПСО31',
  'Z4ПСО41'
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int facultyNo;

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
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: ListView.builder(
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
                        print('facu' + '$index');
                        setState(() {
                          facultyNo = index;
                        });
                      },
                    );
                  }),
            ),
            Expanded(
              child: Builder(builder: (context) {
                if (facultyNo == 0)
                  return GridView.builder(
                    itemCount: philology.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
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
                else if (facultyNo == 1)
                  return GridView.builder(
                    itemCount: Bashkir.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
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
                                Bashkir[index],
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
                else if (facultyNo == 2)
                  return GridView.builder(
                    itemCount: history.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
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
                else if (facultyNo == 3)
                  return GridView.builder(
                    itemCount: fmit.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
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
                else if (facultyNo == 4)
                  return GridView.builder(
                    itemCount: science.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
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
                else if (facultyNo == 5)
                  return GridView.builder(
                    itemCount: pip.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
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
                else if (facultyNo == 6)
                  return GridView.builder(
                    itemCount: ecomony.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
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
                else if (facultyNo == 7)
                  return GridView.builder(
                    itemCount: law.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
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
                else if (facultyNo == 8)
                  return GridView.builder(
                    itemCount: collage.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
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
            ),
          ],
        ),
      ),
    );
  }
}

// class Group extends StatelessWidget {
//   Group({this.facultyNo});
//   int facultyNo;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Text('$facultyNo'),
//       ),
//     );
//   }
// }
