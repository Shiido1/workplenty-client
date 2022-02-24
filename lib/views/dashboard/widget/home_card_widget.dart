// ignore_for_file: must_be_immutable

import 'package:client/core/di/injector.dart';
import 'package:client/core/enums/gig_type.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/core/helper/utils/workplenty_dialog.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_artisan_response/datum.dart';
import 'package:client/views/dashboard/gig/presentation/provider/artisan_provider.dart';
import 'package:client/views/dashboard/saved/domain/entity/saved_profile_entity.dart';
import 'package:client/views/dashboard/saved/presentation/bloc/saved_profile_bloc_bloc.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/modal_bottom.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeCard extends StatelessWidget {
  final Datum? datum;
  HomeCard({this.datum, Key? key}) : super(key: key);
  ArtisanProvider? artisanProvider;
  final _bloc = SavedProfileBlocBloc(inject());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 11.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircularImage(path: datum?.user?.avatar ?? '', radius: 20),
                  SizedBox(width: 13.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextView(
                          text:
                              '${datum?.user?.firstName ?? ''} ${datum?.user?.lastName ?? ''}',
                          maxLines: 1,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.left,
                        ),
                        TextView(
                          text: datum?.user?.role ?? '',
                          maxLines: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  BlocListener<SavedProfileBlocBloc, SavedProfileBlocState>(
                    bloc: _bloc,
                    listener: (context, state) {
                      if (state is SavedProfileblocLoading) {}
                      if (state is SavedProfileblocSuccess) {}
                      if (state is SavedProfileblocFailed) {}
                    },
                    child: Consumer<ArtisanProvider>(
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () => saveProfile(context),
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Pallets.primary100,
                            child: ImageLoader(path: AppImages.bookmark),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              TextView(
                text: datum?.profile?.description ?? '',
                maxLines: 3,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
                fontStyle: FontStyle.normal,
                textOverflow: TextOverflow.ellipsis,
                letterSpacing: -0.33,
              ),
              SizedBox(height: 9.h),
              Row(
                children: [
                  _buildWidget(
                      AppImages.location, datum?.profile?.country ?? ''),
                  SizedBox(width: 10.w),
                  _buildWidget(AppImages.shield, 'Top Rated'),
                  SizedBox(width: 10.w),
                  _buildWidget(AppImages.emptyWallet, 'Top Earner'),
                  SizedBox(width: 10.w),
                  _buildWidget(AppImages.graph, '99%'),
                ],
              ),
              SizedBox(height: 16.h),
              ButtonWidget(
                buttonText: 'Invite Artisan',
                onPressed: () {
                  Provider.of<ArtisanProvider>(context, listen: false)
                      .setArtisan(datum?.user);
                  showFloatingActionModal(context, 'Select a Service');
                },
                fontSize: 14,
                fontWeight: FontWeight.w700,
                height: 35.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveProfile(BuildContext context) {
    WorkPlenty.success('Saved successfully');
    _bloc.add(SavedProfileEvent(SavedProfileEntity(
        profileId: datum!.user!.id, type: GigType.freelance)));
  }

  Expanded _buildWidget(String image, String value) {
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 5.w),
        Expanded(
          child: TextView(
            text: value,
            maxLines: 1,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            textAlign: TextAlign.left,
            letterSpacing: -0.33,
          ),
        )
      ],
    ));
  }
}
