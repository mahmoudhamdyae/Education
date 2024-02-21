import 'package:education/core/utils/insets.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/home/exams/controller/exams_controller.dart';
import 'package:education/presentation/screens/home/exams/widgets/exam_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/exam.dart';

class ExamList extends StatelessWidget {

  final Exam exam;
  const ExamList({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return GetX<ExamsController>(
      init: Get.find<ExamsController>(),
      builder: (ExamsController controller) {
        Exams? exam = controller.exam.value.exams?.first;
        Bank? bank = controller.exam.value.bank?.first;
        return ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(height: 4.0,),
            exam?.unsolvedTest == null && exam?.shortOne == null && exam?.shortTwo == null && exam?.finalReview == null ? Container() : SizedBox(
              width: double.infinity,
              child: Text(
                AppStrings.exams,
                style: getLargeStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8.0,),
            isWide(context) ? _buildExamsGrid(context, exam) : _buildExamsList(exam),
            const SizedBox(height: 16.0,),
            bank?.solvedBank == null && bank?.unsolvedBank == null && bank?.bookTest == null ? Container() : SizedBox(
              width: double.infinity,
              child: Text(
                AppStrings.banks,
                style: getLargeStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8.0,),
            isWide(context) ? _buildBanksGrid(context, bank) : _buildBanksList(bank),
          ],
        );
      },
    );
  }

  ListView _buildExamsList(Exams? exam) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        exam?.unsolvedTest == null ? Container() : ExamItem(text: AppStrings.unsolvedTest, link: exam?.unsolvedTest ?? ''),
        exam?.shortOne == null ? Container() : ExamItem(text: AppStrings.shortOne, link: exam?.shortOne ?? ''),
        exam?.shortTwo == null ? Container() : ExamItem(text: AppStrings.shortTwo, link: exam?.shortTwo ?? ''),
        exam?.finalReview == null ? Container() : ExamItem(text: AppStrings.finalReview, link: exam?.finalReview ?? ''),
      ],
    );
  }

  Widget _buildExamsGrid(BuildContext context, Exams? exam) {
    return GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 300).toInt(),
      childAspectRatio: 5.0,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: [
        exam?.unsolvedTest == null ? Container() : ExamItem(text: AppStrings.unsolvedTest, link: exam?.unsolvedTest ?? ''),
        exam?.shortOne == null ? Container() : ExamItem(text: AppStrings.shortOne, link: exam?.shortOne ?? ''),
        exam?.shortTwo == null ? Container() : ExamItem(text: AppStrings.shortTwo, link: exam?.shortTwo ?? ''),
        exam?.finalReview == null ? Container() : ExamItem(text: AppStrings.finalReview, link: exam?.finalReview ?? ''),
      ],
    );
  }

  ListView _buildBanksList(Bank? bank) {
    return ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              bank?.unsolvedBank == null ? Container() : ExamItem(text: AppStrings.unsolvedBank, link: bank?.unsolvedBank ?? ''),
              bank?.solvedBank == null ? Container() : ExamItem(text: AppStrings.solvedBank, link: bank?.solvedBank ?? ''),
              bank?.bookTest == null ? Container() : ExamItem(text: AppStrings.bookTest, link: bank?.bookTest ?? ''),
            ],
          );
  }

  Widget _buildBanksGrid(BuildContext context, Bank? bank) {
    return GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 300).toInt(),
      childAspectRatio: 5.0,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: [
        bank?.unsolvedBank == null ? Container() : ExamItem(text: AppStrings.unsolvedBank, link: bank?.unsolvedBank ?? ''),
        bank?.solvedBank == null ? Container() : ExamItem(text: AppStrings.solvedBank, link: bank?.solvedBank ?? ''),
        bank?.bookTest == null ? Container() : ExamItem(text: AppStrings.bookTest, link: bank?.bookTest ?? ''),
      ],
    );
  }
}
