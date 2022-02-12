// ignore_for_file: prefer_const_constructors, must_be_immutable, duplicate_ignore

import 'dart:io';

import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ImageLoader extends StatelessWidget {
  ImageLoader(
      {this.width,
      this.height,
      this.elevation = .0,
      this.curve = 20,
      this.path,
      this.file,
      this.color,
      this.dColor,
      this.borderColor,
      this.radius = 16,
      this.borderWidth = .0,
      this.isOnline = false,
      this.isCircular = false,
      this.isCurvedEdge = false,
      this.showInitialTextAbovePicture = false,
      this.onTap,
      this.fit = BoxFit.contain,
      Key? key})
      : super(key: key);

  double? elevation;
  double? width;
  double? height;
  double? borderWidth;
  double? radius;
  double? curve;
  String? path;
  File? file;
  Color? color;
  Color? dColor;
  Color? borderColor;
  bool? isOnline;
  Function()? onTap;
  BoxFit fit;
  bool isCircular;
  bool isCurvedEdge;
  bool showInitialTextAbovePicture;

  @override
  Widget build(BuildContext context) {
    if (file != null) {
      if (isCurvedEdge) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(height! / 2),
          child: Image.file(
            file!,
            width: width,
            height: height,
            fit: fit,
          ),
        );
      } else {
        return Image.file(
          file!,
          width: width,
          height: height,
          fit: fit,
        );
      }
    } else if (path == null || path!.isEmpty) {
      return Image.asset(
        '',
        width: width,
        height: height,
        fit: fit,
      );
    } else if (path!.contains("http")) {
      if (isCircular) {
        return CircularProfileAvatar(path!,
            radius: radius!,
            backgroundColor: Pallets.orange600,
            borderWidth: borderWidth!,
            initialsText: Text(
              "",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            borderColor:
                borderColor != null ? borderColor! : Colors.transparent,
            elevation: elevation!,
            errorWidget: (ctx, _, __) => Icon(Icons.error),
            foregroundColor: Colors.brown.withOpacity(0.5),
            onTap: onTap,
            showInitialTextAbovePicture: showInitialTextAbovePicture);
      }

      if (isCurvedEdge) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(curve!),
          child: GestureDetector(
            onTap: onTap,
            child: CachedNetworkImage(
              width: width ?? Utils.getDeviceWidth(context),
              height: height ?? Utils.getDeviceHeight(context),
              fit: fit,
              imageUrl: path!,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: imageProvider, fit: fit),
                ),
              ),
              fadeInDuration: Duration(seconds: 1),
              placeholderFadeInDuration: Duration(seconds: 1),
              progressIndicatorBuilder: (ctx, value, progress) => Center(
                  child: CircularProgressIndicator(
                value: progress.progress,
              )),
              errorWidget: (context, url, error) => Center(
                  child: Image.asset('assets/images/video_placeholder.png')),
            ),
          ),
        );
      }
      return GestureDetector(
        onTap: onTap,
        child: CachedNetworkImage(
          width: width ?? Utils.getDeviceWidth(context),
          height: height ?? Utils.getDeviceHeight(context),
          fit: fit,
          imageUrl: path!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: fit),
            ),
          ),
          fadeInDuration: Duration(seconds: 1),
          placeholderFadeInDuration: Duration(seconds: 1),
          progressIndicatorBuilder: (ctx, value, progress) => Center(
              child: CircularProgressIndicator(
            value: progress.progress,
          )),
          errorWidget: (context, url, error) =>
              Center(child: Image.asset('assets/images/video_placeholder.png')),
        ),
      );
    } else {
      return SizedBox(
        width: width,
        height: height,
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: color ?? Colors.transparent,
            child: path!.contains(".svg")
                ? SvgPicture.asset(
                    path!,
                    width: width,
                    height: height,
                    color: dColor,
                    fit: fit,
                  )
                : isCircular
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          path!,
                          width: width,
                          height: height,
                          fit: fit,
                        ),
                      )
                    : Image.asset(
                        path!,
                        width: width,
                        height: height,
                        fit: fit,
                      ),
          ),
        ),
      );
    }
  }
}

class CircularImage extends StatelessWidget {
  CircularImage(
      {this.width,
      this.height,
      this.elevation = .0,
      this.curve = 20,
      this.path,
      this.file,
      this.color,
      this.dColor,
      this.borderColor,
      this.radius = 16,
      this.borderWidth = .0,
      this.textSize = 40,
      this.isOnline = false,
      this.isCircular = false,
      this.isCurvedEdge = false,
      this.showInitialTextAbovePicture = false,
      this.onTap,
      this.initial = '',
      this.fit = BoxFit.contain,
      Key? key})
      : super(key: key);

  double? elevation;
  double? width;
  double? height;
  double? borderWidth;
  double? textSize;
  double? radius;
  double? curve;
  String? path;
  File? file;
  Color? color;
  Color? dColor;
  Color? borderColor;
  bool? isOnline;
  Function()? onTap;
  BoxFit fit;
  bool isCircular;
  bool isCurvedEdge;
  bool showInitialTextAbovePicture;
  String? initial;

  @override
  Widget build(BuildContext context) {
    if (path == null) {
      return CircleAvatar(
        backgroundColor: Pallets.primary100,
        radius: radius,
      );
    }
    return CircularProfileAvatar(path!,
        radius: radius!,
        backgroundColor: Pallets.primary100,
        borderWidth: borderWidth!,
        initialsText: Text(initial ?? '',
            style: TextStyle(fontSize: textSize, color: Colors.white)),
        borderColor: borderColor != null ? borderColor! : Colors.transparent,
        elevation: elevation!,
        errorWidget: (ctx, _, __) => Icon(Icons.error),
        onTap: onTap,
        showInitialTextAbovePicture: showInitialTextAbovePicture);
  }
}
