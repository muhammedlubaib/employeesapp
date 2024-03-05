import 'package:employeesapp/gen/assets.gen.dart';
import 'package:employeesapp/res/pagenation_model.dart';
import 'package:employeesapp/res/style/color.dart';
import 'package:employeesapp/res/style/dimensions.dart';
import 'package:employeesapp/res/style/text_styles.dart';
import 'package:employeesapp/utils/app_bar.dart';
import 'package:employeesapp/models/contact_model.dart';
import 'package:employeesapp/view/add_employee_screen/add_employee_screen_view.dart';
import 'package:employeesapp/view/employee_details_screen/employee_details_screen_view.dart';
import 'package:employeesapp/view_model/auth_view_model/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class EmployeelistingScreenView extends StatefulWidget {
  static const String path = "employeelistingscreen";
  const EmployeelistingScreenView();

  @override
  State<EmployeelistingScreenView> createState() =>
      _EmployeelistingScreenViewState();
}

class _EmployeelistingScreenViewState extends State<EmployeelistingScreenView> {
  @override
  void initState() {
    pagingController.addPageRequestListener(_handlePageRequest);
    super.initState();
  }

  @override
  void dispose() {
    pagingController.removePageRequestListener(_handlePageRequest);

    super.dispose();
  }

  Future<void> _handlePageRequest(int pageKey) async {
    print("check 123");
    fetchPage(pageKey);
  }

  final PagingController<int, EmployeeModel> pagingController =
      PagingController(firstPageKey: 1);

  Future<void> fetchPage(
    int pageKey,
  ) async {
    // print("testing anu 333");
    try {
      PaginationModel<EmployeeModel> newItems =
          await Provider.of<LoginProvider>(context, listen: false)
              .employeelistviewApi(context: context, page: pageKey);

      final isLastPage = newItems.isLastPage;
      print('###isLastPage: ${newItems.isLastPage}');
      print('###currenPage: ${newItems.currenPage}');
      print('###nextPage: ${newItems.nextPage}');

      if (isLastPage) {
        pagingController.appendLastPage(newItems.newItems);
      } else {
        final nextPageKey = newItems.nextPage;
        pagingController.appendPage(newItems.newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppbarCustom(
        backButtonRequired: false,
        title: "Employees",
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          pagingController.refresh();
        },
        child: PagedListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 8, bottom: 80),
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<EmployeeModel>(
                firstPageErrorIndicatorBuilder: (context) =>
                    Center(child: Text(pagingController.error.toString())),
                noItemsFoundIndicatorBuilder: (context) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.icon.checkMark1,
                          height: 200,
                        ),
                        gapSmall,
                        Text("No posts found", style: body2),
                        gapSmall,
                      ],
                    ),
                firstPageProgressIndicatorBuilder: (context) =>
                    const SpinKitCircle(
                      color: Colors.white,
                      // size: 40.0 - widget.padding / 2.5,
                    ),
                itemBuilder: (context, item, index) {
                  return Column(children: [contactCard(index, item, context)]);
                })),
      ),
      // Consumer<LoginProvider>(builder: (context, controller, _) {
      //   return ListView.builder(
      //       itemCount: controller.employeeModelList.length,
      //       itemBuilder: (context, index) {
      //         return contactCard(
      //             index, controller.employeeModelList[index], context);
      //       });
      // }),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        onPressed: ()async {
          bool? dataAdded =
           await   Navigator.pushNamed(context, AddEmployeeScreenView.path) as bool?;
          if (dataAdded == true ?? false) {
            pagingController.refresh();
          }
        },
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
          size: h * 0.05,
        ),
      ),
    );
  }

  ListTile contactCard(int index, EmployeeModel data, BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, EmployeeDetailScreenView.path,
            arguments: data);
      },
      leading: Visibility(
          visible: data.profileImage != null,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: ColorResources.GREY5,
                // border: Border.all(width: 5, color: ColorResources.GREY4),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(data.profileImage ?? ''))),
          )
          //  Container(
          //     decoration: BoxDecoration(shape: BoxShape.circle),
          //     child: Image.network(
          //       data.profileImage,
          //       fit: BoxFit.fill,
          //     ))
          ),
      title: Text(data.firstName + data.firstName
          // contactslist[index].name,
          // style: h2,
          ),
      subtitle: Text(data.mobile.toString()
          // contactslist[index].phoneNumber,
          // style: h3,
          ),
    );
  }
}
