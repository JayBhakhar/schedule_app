import 'package:flutter/material.dart';

class GroupsList extends StatefulWidget {
  List groupList;
  GroupsList({this.groupList});
  @override
  _GroupsListState createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.groupList.length,
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
                  widget.groupList[index],
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
  }
}