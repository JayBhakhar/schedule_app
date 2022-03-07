import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:schedule_app/views/widgets/home_appbar.dart';

class ApiProvider extends GetConnect {
  Future<List<dynamic>> getGroupsList() async {
    final response = await get(
        'http://edu.strbsu.ru/php/getList.php?faculty=${controller.facultyId}'); // url for books inital 10 books
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
}
