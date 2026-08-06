import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:fitit_app/shared/models/reviews_model.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;
  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: review.avatarColor,
          child: Text(
            review.initials,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.lightTextMain,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        12.vSpace,
        //content
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: AppSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name and date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(review.name, style: textTheme.titleMedium),
                    Text(
                      review.date,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.lightTextSub,
                      ),
                    ),
                  ],
                ),
                4.vSpace,
                // star ratings
                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      i < review.rating.floor()
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      color: Colors.amber,
                      size: 14,
                    ),
                  ),
                ),
                6.vSpace,
                //comment
                Text(
                  review.comment,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.lightTextSub,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
