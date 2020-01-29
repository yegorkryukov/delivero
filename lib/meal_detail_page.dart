import 'package:flutter/material.dart';
import 'meal_model.dart';

class MealDetailPage extends StatefulWidget {
  final Meal meal;

  MealDetailPage(this.meal);

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  final double mealAvatarSize = 350.0;

  Widget get mealImage {
    return Container(
      height: mealAvatarSize,
      width: mealAvatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: [
          const BoxShadow(
              offset: const Offset(1.0, 2.0),
              blurRadius: 2.0,
              spreadRadius: -1.0,
              color: const Color(0x33000000)),
          const BoxShadow(
              offset: const Offset(2.0, 1.0),
              blurRadius: 3.0,
              spreadRadius: 0.0,
              color: const Color(0x24000000)),
          const BoxShadow(
              offset: const Offset(3.0, 1.0),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              color: const Color(0x1F000000)),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.meal.imageUrl),
        ),
      ),
    );
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text(' ${widget.meal.rating} / 10',
            style: Theme.of(context).textTheme.display2)
      ],
    );
  }

  Widget get mealProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          mealImage,
          Text(
            widget.meal.name,
            style: TextStyle(fontSize: 32.0),
          ),
          Text(
            widget.meal.location,
            style: TextStyle(fontSize: 20.0),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(widget.meal.description),
          ),
          rating
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
