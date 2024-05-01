import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DropdownWidget extends StatelessWidget {
  final List<String> items;
  final String labelText;
  final TextEditingController controller;
  final Function(String?) onChange;
  final String? selectedItem;
  final bool isError;

  const DropdownWidget({
    super.key,
    required this.items,
    required this.labelText,
    required this.controller,
    required this.onChange,
    this.selectedItem,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color:
                  isError ? theme.colorScheme.error : theme.colorScheme.surface,
            ),
          )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                labelText,
                style: theme.textTheme.bodyLarge,
              ),
              items: items
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item, style: theme.textTheme.bodyMedium),
                      ))
                  .toList(),
              value: selectedItem,
              onChanged: onChange,
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                height: 6.h,
                width: 96.w,
              ),
              dropdownStyleData: DropdownStyleData(
                  maxHeight: 30.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                  )),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: controller,
                searchInnerWidgetHeight: 100,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: controller,
                    cursorColor: theme.colorScheme.surface,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Search for an item...',
                      hintStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.hintColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value
                      .toString()
                      .toLowerCase()
                      .contains(searchValue.toLowerCase());
                },
              ),
              //This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  controller.clear();
                }
              },
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        isError
            ? Text(
                "Harap pilih $labelText",
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.w500,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
