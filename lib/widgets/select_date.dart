import 'package:airbnb_clone/constants/colors.dart';
import 'package:airbnb_clone/models/booking_steps.dart';
import 'package:airbnb_clone/utils/extensions.dart';
import 'package:airbnb_clone/widgets/app_calendar.dart';
import 'package:flutter/material.dart';

class SelectDateWidget extends StatelessWidget {
  final BookingStep step;
  const SelectDateWidget({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // 112 = app bar height + safe area top padding
    // 60 = destination selection collapsed height
    // 32 = top / bottom padding
    // 20 = margin below each card
    var expandedHeight = size.height - 112 - 60 - 32 - 20;
    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        height: step == BookingStep.selectDate ? expandedHeight : 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        duration: const Duration(milliseconds: 300),
        child: step == BookingStep.selectDate
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'When\'s your trip?',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  16.pv,
                  const Row(
                    children: [
                      Expanded(
                        // child: CalendarOptionsSegmentedButton(),
                        child: CalendarOptionsSegmentedButtom(),
                      ),
                    ],
                  ),
                  16.pv,
                  const AppCalendar(),
                  const Spacer(),
                  const Divider(),
                  SizedBox(
                    height: 48.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Exact dates'),
                        ),
                        8.ph,
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('± 1 day'),
                        ),
                        8.ph,
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('± 2 days'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (step == BookingStep.selectDestination) {
                          } else {}
                        },
                        child: const Text('skip'),
                      ),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: appRed,
                          minimumSize: const Size(120, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Next'),
                      )
                    ],
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'When',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'I\'m flexible',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
      ),
    );
  }
}
