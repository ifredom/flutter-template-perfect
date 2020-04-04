import 'dart:async';

abstract class TeachingService {
  Future getTeachingBookList({String bookName, String publisherCode});
}
