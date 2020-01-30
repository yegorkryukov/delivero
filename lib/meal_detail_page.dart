import 'package:flutter/material.dart';
import 'meal_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MealDetailPage extends StatefulWidget {
  final Meal meal;

  MealDetailPage(this.meal);

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  final double mealAvatarSize = 350.0;

  Widget get mealImage {
    return Hero(
      tag: widget.meal,
      child: Container(
        height: mealAvatarSize,
        width: mealAvatarSize,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.meal.imageUrl),
          ),
        ),
      ),
    );
  }

  Widget get mealProfile {
    return Container(
      child: ListView(
        children: <Widget>[
          mealImage,
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.meal.name,
                    style: Theme.of(context).textTheme.headline),
                Text('${widget.meal.price}₽',
                    style: Theme.of(context).textTheme.headline),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SmoothStarRating(
                    allowHalfRating: true,
                    onRatingChanged: (v) {
                      widget.meal.rating = v;
                      setState(() {});
                    },
                    starCount: 5,
                    rating: widget.meal.rating,
                    size: 25.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    spacing: 0.0)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            child: Text(
              widget.meal.location,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(widget.meal.description),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
      ),
      body: mealProfile,
    );
  }
}
