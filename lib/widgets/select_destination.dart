import 'package:airbnb_clone/models/booking_steps.dart';
import 'package:airbnb_clone/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SelectDestinationWidget extends StatelessWidget {
  const SelectDestinationWidget({super.key, required this.step});

  final BookingStep step;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: step == BookingStep.selectDestination ? 280 : 60,
        padding: const EdgeInsets.all(16.0),
        child: step == BookingStep.selectDestination
            ? 
            
            
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Where To?',
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  16.pv,
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      hintText: 'Search destination',
                      hintStyle: textTheme.labelMedium,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  16.pv,
                  SizedBox(
                    height: 128.0,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.network(
                                  'http://picsum.photos/200/300',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              8.pv,
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Placeholder',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
                .animate(delay: const Duration(milliseconds: 300))
                .fadeIn(duration: const Duration(milliseconds: 300))
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
                  ),
                ],
              ),
      ),
    );
  }
}
