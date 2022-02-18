import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/utils/common/color_utils.dart';
import 'package:fluttertemplate/core/utils/res/gaps.dart';
import 'package:fluttertemplate/ui/widgets/appbar/custom_appbar.dart';

class ProductDetailView extends StatefulWidget {
  final Map post;
  ProductDetailView(this.post, {Key? key}) : super(key: key);
  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: '详情页面', showBackButton: true),
      body: buildMainListView(),
    );
  }

  Widget buildMainListView() {
    return Container(
      height: double.infinity,
      child: ListView.separated(
          itemCount: 20,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(20),
              color: HexToColor("#88ADA6"),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.post["title"],
                        style: TextStyle(color: HexToColor("#544a7d")),
                      ),
                      Text(
                        widget.post["description"],
                        style: TextStyle(color: HexToColor("#ffd452")),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
            );
          }),
    );
  }
}
