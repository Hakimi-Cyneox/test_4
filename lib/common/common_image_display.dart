import 'package:flutter/material.dart';
import 'package:yayasan_app/core/utils/utilities.dart';

class PngIcon extends StatelessWidget {
  final EdgeInsets? padding;
  final String icon;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const PngIcon(
      {Key? key, required this.icon, this.color, this.width, this.height, this.padding, this.boxFit,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Image(
        color: color,
        image: Image.asset((Utilities.isStringNullOrEmpty(icon))? "assets/icons/pop_up_failed_icon.png": "assets/icons/$icon.png").image,
        width: width ?? 24,
        height: height ?? width,
        fit: boxFit,
      ),
    );
  }
}

class PngIconGen extends StatelessWidget {
  final EdgeInsets? padding;
  final String icon;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const PngIconGen(
      {Key? key, required this.icon, this.color, this.width, this.height, this.padding, this.boxFit,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Image(
        color: color,
        image: Image.asset(icon).image,
        width: width ?? 24,
        height: height ?? width,
        fit: boxFit,
      ),
    );
  }
}

class PngImage extends StatelessWidget {
  final String image;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const PngImage(
      {Key? key, required this.image, this.color, this.width, this.height, this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      color: color,
      image: Image.asset("assets/images/$image.png").image,
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? width,
      fit: boxFit,
    );
  }
}

class PngImageGen extends StatelessWidget {
  final EdgeInsets? padding;
  final String image;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const PngImageGen(
      {Key? key, required this.image, this.color, this.width, this.height, this.padding, this.boxFit,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Image(
        color: color,
        image: Image.asset(image).image,
        width: width ?? 24,
        height: height ?? width,
        fit: boxFit,
      ),
    );
  }
}

class GifImage extends StatelessWidget {
  final String image;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const GifImage(
      {Key? key, required this.image, this.color, this.width, this.height, this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      color: color,
      image: Image.asset("assets/gif/$image.gif").image,
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? width,
      fit: boxFit,
    );
  }
}


class GifLoading extends StatefulWidget {
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const GifLoading({
    Key? key, this.width, this.height, this.boxFit,
  }) : super(key: key);

  @override
  State<GifLoading> createState() => _GifLoadingState();
}

class _GifLoadingState extends State<GifLoading> {
  late AssetImage image;

  @override
  void initState() {
    super.initState();
    image = const AssetImage("assets/gif/app_loading_v3_4.gif");
  }

  @override
  void dispose() {
    image.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? widget.width,
      fit: widget.boxFit,
    );
  }
}