import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/home/presentation/widgets/each_ongoing_job_widget.dart';
import 'package:unidbox_app/views/screens/home/repository/provider/ongoing_job_provider.dart';
import 'package:unidbox_app/views/screens/home/repository/state/ongoing_job_state.dart';
import '../../../../widgets/text_widget.dart';
import '../../domain/ongoing_job.dart';

class OngoingJobScreen extends ConsumerStatefulWidget {
  const OngoingJobScreen({super.key});

  @override
  ConsumerState<OngoingJobScreen> createState() => _OngoingJobScreenState();
}

class _OngoingJobScreenState extends ConsumerState<OngoingJobScreen> {
  List<OngoingJob> ongoingJobList = [];
  List<SelectionField> selectionList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(ongoingJobStateNotifier.notifier).getAllOngoingJob(context, ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(ongoingJobStateNotifier, (prev, next) {
      if (next is Loading) {
        ongoingJobList = [];
      }
      if (next is OngoingJobList) {
        setState(() {
          ongoingJobList = next.ongoingJob;
        });
      }
      if (next is SelectionFieldList) {
        setState(() {
          selectionList = next.seclectionField;
        });
      }
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            "Ongoing Job",
            fontWeight: FontWeight.w600,
            size: 16,
          ),
          const SizedBox(height: 20),

          // if (controller.ongoingJobList.isEmpty) {
          //   return const Center(
          //     child: Text("No Data"),
          //   );
          // }
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              // if (controller.isOngoingJobLoading) {
              //   return shimmerOngoingJobWidget();
              // }
              String jobType = "";
              for (var data in selectionList) {
                if (data.value == ongoingJobList[index].jobType) {
                  jobType = data.name;
                }
              }

              return eachOngoingJobWidget(
                ongoingJobList[index],
                jobType,
              );
            },
            shrinkWrap: true,
            itemCount: ongoingJobList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
          ),
        ],
      ),
    );
  }
}
