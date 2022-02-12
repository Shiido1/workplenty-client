import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/review/domain/entity/review_entity.dart';
import 'package:client/views/review/presentation/provider/review_provider.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/review_bg_card.dart';
import 'package:client/views/widgets/star_rating.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Review extends StatefulWidget {
  Review({Key? key}) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  ReviewProvider? reviewProvider;

  @override
  void initState() {
    reviewProvider = Provider.of<ReviewProvider>(context, listen: false);
    reviewProvider!.init(context);
    reviewProvider! .listOfReview(ReviewEntity(
      userId: 1,
      gigId: 1,
      // comments: '',
      // ratings: 2
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          centerTitle: true,
          title: 'Reviews',
          textColor: Pallets.white,
          leadingWidget: IconButton(
              onPressed: () => PageRouter.goBack(context),
              color: Pallets.white,
              icon: Icon(Icons.clear))),
      body: Consumer<ReviewProvider>(
        builder: (_, provider, __) {
          if (provider.responseModel == null) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              ReviewBgCard(Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  StarRating(
                    starCount: 5,
                    rating: 4,
                  ),
                  SizedBox(height: 32.h),
                  TextView(
                      text: '4.7',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      textAlign: TextAlign.center),
                  SizedBox(height: 10.h),
                  TextView(
                      text: '(31 Reviews)',
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center),
                ],
              )),
              SizedBox(height: 16.h),
              ...provider.responseModel!.data!.data!
                  .map(
                    (data) => ReviewBgCard(Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: StarRating(
                                starCount: 5,
                                rating: 4,
                              ),
                            ),
                            TextView(
                                text: Utils.fomartDate(data.createdAt ?? ''),
                                fontWeight: FontWeight.w700,
                                textAlign: TextAlign.right),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        TextView(
                            text:
                                '${data.reviewer?.firstName ?? ''} ${data.reviewer?.lastName ?? ''}',
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.left),
                        SizedBox(height: 16.h),
                        TextView(
                            text: data.comment!,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.left),
                        SizedBox(height: 16.h),
                        TextView(
                            text:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing Dignissim viverra morbi eget fames volutpat aliquam. Posuere odio a etiam maecenas vitae et.',
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.left),
                        SizedBox(height: 16.h),
                      ],
                    )),
                  )
                  .toList()
            ],
          );
        },
      ),
    );
  }
}
