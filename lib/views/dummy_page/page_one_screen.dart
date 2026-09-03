import 'package:yayasan_app/views/dummy_page/page_one_binding.dart';
import 'package:flutter/material.dart';
import 'package:yayasan_app/base/base_view_view_model.dart';
import 'package:yayasan_app/common/common_custom_app_bar.dart';

class PageOneScreen extends BaseView<PageOneController> {
  final String? titleValue;

  const PageOneScreen({
    String? title,
    Key? key,
  })  : titleValue = title,
        super(key: key);

  @override
  Widget vBuilder() {
    return scrollViewBody(
      appbar: const CustomDefaultAppBar(
        isBackable: false,
      ),
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(titleValue.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
