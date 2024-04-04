import 'package:flutter/material.dart';

class HomeAppliance extends StatelessWidget {
  const HomeAppliance({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 140,
            height: 110,
            alignment: const Alignment(0.9, -0.8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/washing_machine.jpg',
                    ),
                    fit: BoxFit.cover)),
            child: CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage('assets/images/select_fav.png'),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'WashingMachine',
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
          Row(
            children: [
              Text('Review (4.8)', style: theme.textTheme.bodyMedium),
              const SizedBox(
                width: 2,
              ),
              const Icon(
                Icons.star,
                color: Color(0xFFF6D816),
              ),
            ],
          )
        ],
      ),
    );
  }
}
