import 'package:flutter/material.dart';
import 'meal_model.dart';
import 'meal_detail_page.dart';

class MealCard extends StatefulWidget {
  final Meal meal;

  MealCard(this.meal);

  @override
  _MealCardState createState() => _MealCardState(meal);
}

class _MealCardState extends State<MealCard> {
  Meal meal;

  _MealCardState(this.meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showMealDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Container(
          height: 300.0,
          child: mealCard,
        ),
      ),
    );
  }

  showMealDetailPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealDetailPage(meal);
        },
      ),
    );
  }

  String renderUrl;

  Widget get mealImage {
    return Container(
      // width: 300.0,
      height: 200.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    renderMealPic();
  }

  void renderMealPic() async {
    await meal.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = meal.imageUrl;
      });
    }
  }

  Widget get mealCard {
    return Container(
      // width: 250.0,
      height: 250.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
            left: 5.0,
            right: 5.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              mealImage,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(widget.meal.name,
                      style: Theme.of(context).textTheme.headline),
                  Text('${widget.meal.price}₽',
                      style: Theme.of(context).textTheme.headline),
                ],
              ),
              Text(widget.meal.location,
                  style: Theme.of(context).textTheme.subhead),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(': ${widget.meal.rating} / 5')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
