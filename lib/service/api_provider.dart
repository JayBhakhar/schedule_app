import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:schedule_app/consts/consts.dart';
import 'package:schedule_app/views/widgets/home_appbar.dart';

class ApiProvider extends GetConnect {
  Future<List<dynamic>> getGroupsList() async {
    final response = await get('${apiBaseUrl}faculty=${controller.facultyId}');
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      List groupsLists = [];
      var document = parse(response.body);
      var ul = document.getElementsByTagName('ul');
      List gruId = [];
      List gruName = [];
      for (var a in ul) {
        List _id = [];
        List _name = [];
        gruId.add(_id);
        gruName.add(_name);
        var id = a.getElementsByTagName('ul div');
        var name = a.getElementsByTagName('ul a');
        for (var _ in id) {
          _id.add(_.innerHtml);
        }
        for (var _ in name) {
          _name.add(_.innerHtml);
        }
        Map grpMap = Map.fromIterables(_id, _name);
        groupsLists.add(grpMap);
      }
      return groupsLists;
    }
  }

  Future<List<dynamic>> getLettersList() async {
    final response = await get('${apiBaseUrl}prepList=1');
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      List _letter = [];
      List _lettersId = [];
      List lettersMapList = [];
      var document = parse(response.body);
      var letters = document.getElementsByTagName('div');
      for (var letter in letters) {
        var letID = letter.attributes['onclick'];
        var numberletID = letID.replaceAll(RegExp('[^0-9]'), '');
        _letter.add(letter.text);
        _lettersId.add(numberletID);
      }
      Map letterMap = Map.fromIterables(_lettersId, _letter);
      lettersMapList.add(letterMap);
      return lettersMapList;
    }
  }

  Future<List<dynamic>> getBuildingsList() async {
    final response = await get('${apiBaseUrl}korpuses=1');
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      List _buildings = [];
      List _buildingsId = [];
      List buildingsMapList = [];
      var document = parse(response.body);
      var rooms = document.getElementsByClassName('prep_name');
      for (var room in rooms) {
        var roomId = room.attributes['onclick'];
        var numberletID = roomId.replaceAll(RegExp('[^0-9]'), '');
        _buildings.add(room.text);
        _buildingsId.add(numberletID);
      }
      Map buildingsMap = Map.fromIterables(_buildingsId, _buildings);
      buildingsMapList.add(buildingsMap);
      return buildingsMapList;
    }
  }
}
