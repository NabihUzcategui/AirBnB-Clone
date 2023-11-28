// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:airbnb_clone/constants/colors.dart';
import 'package:airbnb_clone/models/booking_steps.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  var step = BookingStep.selectDate;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Scaffold(
        backgroundColor: appWhite.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.close),
          ),
          title: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Stays',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Experiences',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          actions: const [
            SizedBox(
              width: 48.0,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    step = BookingStep.selectDestination;
                  });
                },
                child: Hero(
                  tag: 'search',
                  child: SelectDestinationWidget(step: step),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    step = BookingStep.selectDate;
                  });
                },
                child: SelectDateWidget(step: step),
              ),
              (Step == BookingStep.selectDate)
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          step = BookingStep.selectGuests;
                        });
                      },
                      child: SelectGuestsWidget(step: step),
                    ),
            ],
          ),
        ),
        bottomNavigationBar: (step == BookingStep.selectDate)
            ? null
            : BottomAppBar(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                notchMargin: 0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (step == BookingStep.selectDestination) {
                          setState(() {
                            step = BookingStep.selectGuests;
                          });
                        } else {
                          setState(() {
                            step = BookingStep.selectDestination;
                          });
                        }
                      },
                      child: Text(
                        'clear all',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                    FilledButton.icon(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: appRed,
                        minimumSize: const Size(100, 56.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      icon: const Icon(Icons.search),
                      label: const Text('search'),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
