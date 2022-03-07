import 'package:flutter/cupertino.dart';
import 'package:schedule_app/service/theme_service.dart';

Widget groupsList(List groupsList) {  
  return SingleChildScrollView(
    child: ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: groupsList.length,
      itemBuilder: (context, int index1) {
        return Container(
          margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 1.0),
          child: GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: groupsList[index1].length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100.0,
                mainAxisExtent: 40,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(1.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ThemeService().primaryColor,
                      border: Border.all(
                        color: ThemeService().cardColor,
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: GestureDetector(
                      child: Container(
                        child: Center(
                          child: Text(
                            groupsList[index1].values.toList()[index],
                            style: TextStyle(
                              color: ThemeService().bodyText1,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        // todo : get.tonamed
                      },
                    ),
                  ),
                );
              }),
        );
      },
    ),
  );
}
