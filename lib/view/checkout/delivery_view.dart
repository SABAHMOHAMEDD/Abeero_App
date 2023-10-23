import 'package:abeero/core/constants.dart';
import 'package:flutter/material.dart';

import '../../core/enum.dart';

class DeliveryView extends StatefulWidget {
  DeliveryView({super.key});

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        RadioListTile<Delivery>(
          activeColor: KPrimaryColor,
          fillColor: MaterialStateColor.resolveWith((states) => KPrimaryColor),
          value: Delivery.StandardDelivery,
          groupValue: delivery,
          onChanged: (Delivery? value) {
            setState(() {
              delivery = value!;
            });
          },
          title: const Text(
            "Standard Delivery",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          subtitle: const Text(
            '\nOrder will be delivered between 3 - 5 business days',
            style: TextStyle(color: KTextColorBlack),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RadioListTile<Delivery>(
          fillColor: MaterialStateColor.resolveWith((states) => KPrimaryColor),
          value: Delivery.NextDayDelivery,
          groupValue: delivery,
          onChanged: (Delivery? value) {
            setState(() {
              delivery = value!;
            });
          },
          title:
              const Text("Next Day Delivery", style: TextStyle(fontSize: 18)),
          subtitle: const Text(
            '\nPlace your order before 6pm and your items will be delivered the next day',
            style: TextStyle(color: KTextColorBlack),
          ),
          activeColor: KPrimaryColor,
          autofocus: true,
        ),
        const SizedBox(
          height: 15,
        ),
        RadioListTile<Delivery>(
          fillColor: MaterialStateColor.resolveWith((states) => KPrimaryColor),
          enableFeedback: true,
          hoverColor: KPrimaryColor,
          selectedTileColor: KPrimaryColor,
          value: Delivery.NominatedDelivery,
          groupValue: delivery,
          onChanged: (Delivery? value) {
            setState(() {
              delivery = value!;
            });
          },
          title:
              const Text("Nominated Delivery", style: TextStyle(fontSize: 18)),
          subtitle: const Text(
            '\nPick a particular date from the calendar and order will be delivered on selected date',
            style: TextStyle(color: KTextColorBlack),
          ),
          activeColor: KPrimaryColor,
          autofocus: true,
        ),
      ],
    );
  }
}
