import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/utils/common/color_utils.dart';
import 'package:fluttertemplate/ui/widgets/appbar/custom_appbar.dart';

class ProductDetailView extends StatefulWidget {
  final Map post;
  const ProductDetailView(this.post, {super.key});
  @override
  ProductDetailViewState createState() => ProductDetailViewState();
}

class ProductDetailViewState extends State<ProductDetailView> with TickerProviderStateMixin {
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
    return SizedBox(
      height: double.infinity,
      child: ListView.separated(
          itemCount: 20,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: HexToColor("#88ADA6"),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.post["title"],
                    maxLines: 5,
                    style: TextStyle(color: HexToColor("#544a7d")),
                  ),
                  Text(
                    widget.post["description"],
                    maxLines: 5,
                    style: TextStyle(color: HexToColor("#ffd452")),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
            );
          }),
    );
  }
}
