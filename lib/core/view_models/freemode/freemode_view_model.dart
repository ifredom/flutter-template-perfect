import 'package:oktoast/oktoast.dart';
import 'package:template/core/enums/view_state.dart';
import 'package:template/core/model/teachingbook/teachingbook.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/services/teaching/teaching_service.dart';
import 'package:template/locator.dart';

import '../base_view_model.dart';

class FreemodeViewModel extends BaseViewModel {
  final _teachingService = locator<TeachingService>();
  bool _connectedDevice = false;
  bool get connectedDevice => _connectedDevice;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  int _totalPage = 0;
  int get totalPage => _totalPage;
  List _listData = List();
  List get listData => _listData;
  List _bookshelfTopData = List(); // 数据分为两部分
  List get bookshelfTopData => _bookshelfTopData;
  List _bookshelfBottomData = List(); // 数据分为两部分
  List get bookshelfBottomData => _bookshelfBottomData;

  setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  gotoListView(Teachingbook item) {
    locator<NavigationService>()
        .push(RoutesUtils.freemodeBooklistPage, arguments: item);
  }

  Future initialise({String bookName = '', String publisherCode = ''}) async {
    setState(ViewState.Busy);
    Map params = Map();
    params["bookName"] = bookName;
    params["publisherCode"] = publisherCode;
    var res = await _teachingService.getTeachingBookList(
        bookName: bookName, publisherCode: publisherCode);
    if (res.data["code"] == 0) {
      clearCacheData();
      _listData = res.data["data"]["list"];
      _currentPage = res.data["data"]["currPage"];
      _totalPage = res.data["data"]["totalPage"];

      for (var i = 0; i < _listData.length; i++) {
        if (i < 5) {
          _bookshelfTopData.add(Teachingbook.fromMap(_listData[i]));
        }
        if (i >= 5 && i < 10) {
          _bookshelfBottomData.add(Teachingbook.fromMap(_listData[i]));
        }
      }
      setState(ViewState.DataFetched);
    } else {
      showToast(res.data["msg"]);
    }
  }

  Future clearCacheData() async {
    _listData = [];
    _bookshelfTopData = [];
    _bookshelfBottomData = [];
    _currentPage = 0;
    _totalPage = 0;
  }
}
