import 'package:flutter/material.dart';
import 'package:fluter_template_perfect/core/utils/common/color_utils.dart';
import 'package:fluter_template_perfect/core/utils/res/gaps.dart';
import 'package:fluter_template_perfect/ui/widgets/appbar/custom_appbar.dart';

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
      appBar: CustomAppbar(
        title: '详情页面',
      ),
      backgroundColor: Colors.transparent,
      body: getMainListViewUI(),
    );
  }

  Widget getMainListViewUI() {
    return Container(
      color: HexToColor("#FFFFFF"),
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: HexToColor("#88ADA6"),
            child: Column(
              children: [
                Text(widget.post["title"]),
                Gaps.vGap30,
                Text(widget.post["description"]),
              ],
            ),
          );
        },
      ),
    );
  }
}
