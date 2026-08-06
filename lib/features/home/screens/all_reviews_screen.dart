import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/shared/models/reviews_model.dart';
import 'package:fitit_app/shared/widgets/review_card.dart';
import 'package:flutter/material.dart';

class AllReviewsScreen extends StatelessWidget {
  const AllReviewsScreen({super.key});
  static List<ReviewModel> reviews = [
    ReviewModel(
      name: 'Esi Amoah',
      initials: 'EA',
      avatarColor: Color.fromRGBO(173, 216, 230, 1),
      rating: 5,
      comment: 'Fixed our kitchen leak in 30 min. Super professional!',
      date: 'Jun 12',
    ),
    ReviewModel(
      name: 'Kwame Darko',
      initials: 'KD',
      avatarColor: Color.fromRGBO(144, 238, 144, 1),
      rating: 4,
      comment: 'Very punctual and neat. Would definitely book again.',
      date: 'May 28',
    ),
    ReviewModel(
      name: 'Abena Serwaa',
      initials: 'AS',
      avatarColor: Color.fromRGBO(255, 218, 185, 1),
      rating: 5,
      comment: 'Excellent work on the bathroom pipes. Fair pricing too.',
      date: 'May 10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Reviews"), // shows "Cleaning", "Plumbing" etc
      ),
      body: // Reviews list
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.md,
          vertical: AppSizes.sm,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reviews.length,
          separatorBuilder: (_, __) =>
              const Divider(height: 24, color: Colors.grey),
          itemBuilder: (context, index) {
            final review = reviews[index];
            return ReviewCard(review: review);
          },
        ),
      ),
    );
  }
}
