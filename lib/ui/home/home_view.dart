import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/ui/home/home_viewmodel.dart';
import 'package:xpress_drive/ui/smart_widget/folder_view/folder_view.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/dropdown/dropdown.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';
import 'package:xpress_drive/ui/widget/textfields/search_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 812),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.landscape);
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30.h, 27.h, 30.h, 0.h),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Xpress Drive',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.primary,
                          ),
                        ),
                        InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(8.0.h),
                              child: AppIcon(AppIcons.menu,
                                  size: 19.h, color: AppColor.primary),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SearchField(
                        hint: 'Search Folder',
                        value: model.searchText,
                        onChanged: model.setSearchText),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Dropdown<Filter>(
                            items: Filter.values,
                            value: model.filter,
                            onChanged: model.setFilter,
                            itemBuilder: (filter) {
                              return Text(
                                filter.name.replaceAll('_', ' '),
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.w500),
                              );
                            }),
                        Expanded(child: SizedBox.fromSize()),
                        InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            model.setView(View.List);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: AppIcon(AppIcons.list,
                                size: 15.h,
                                color: AppColor.primary.withOpacity(
                                    model.view == View.List ? 1 : 0.5)),
                          ),
                        ),
                        InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            model.setView(View.Grid);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: AppIcon(AppIcons.grid,
                                size: 15.h,
                                color: AppColor.primary.withOpacity(
                                    model.view == View.Grid ? 1 : 0.5)),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.37,
                            crossAxisSpacing: 20.h,
                            mainAxisSpacing: 20.h),
                        itemBuilder: (context, index) {
                          return FolderView(
                            folder: model.folders[index],
                            color: (index + 1) % 4 == 0
                                ? AppColor.green
                                : (index + 1) % 4 == 3
                                    ? AppColor.red
                                    : (index + 1) % 4 == 2
                                        ? AppColor.yellow
                                        : AppColor.primaryDark,
                          );
                        },
                        itemCount: model.folders.length,
                      ),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shape: const CircleBorder(),
                color: AppColor.primary,
                child: InkWell(
                  onTap: () {},
                  customBorder: const CircleBorder(),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(25.h),
                    child: Icon(
                      Icons.add,
                      size: 19.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
