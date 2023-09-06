import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:list_work/model/user.dart';
import 'package:list_work/widgets/user_card.dart';

class AsymmetricTable extends StatelessWidget {
  final List<User> users;

  const AsymmetricTable({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) {
        if (index % 4 == 0) {
          return _card(context, SubSide.right, index);
        } else if (index % 4 == 1) {
          return _card(context, SubSide.none, index);
        } else if (index % 4 == 2) {
          return _card(context, SubSide.left, index);
        } else {
          return _card(context, SubSide.none, index);
        }
      },
    );
  }

  Widget _card(BuildContext context, SubSide subSide, int index) {
    return Center(
      child: Column(
        children: [
          if (index == 0) const SizedBox(height: 10),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width - 32,
            decoration: BoxDecoration(
              border: index < users.length - 1 ? _lrtBorder() : _fullBorder(),
            ),
            child: _subCard(context, subSide, users[index]),
          ),
          if (index == users.length - 1) const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _subCard(BuildContext context, SubSide subSide, User user) {
    if (subSide == SubSide.none) {
      return UserCard(user: user, includeDescription: true);
    }

    final bool side = subSide == SubSide.right;
    return Row(
      mainAxisAlignment: subSide == SubSide.left
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        if (subSide == SubSide.right) _fieldInfo(context, subSide, user),
        Column(
          children: [
            _subCardEl(
              context,
              side ? _lbBorder() : _rbBorder(),
              user.firstName,
            ),
            _subCardEl(
              context,
              side ? _lBorder() : _rBorder(),
              user.lastName,
            ),
          ],
        ),
        if (subSide == SubSide.left) _fieldInfo(context, subSide, user),
      ],
    );
  }

  Widget _fieldInfo(BuildContext context, SubSide subSide, User user) {
    return Row(
      textDirection:
          subSide == SubSide.left ? TextDirection.ltr : TextDirection.rtl,
      children: [
        const SizedBox(width: 20),
        SvgPicture.string(
          user.squareAvatarUrl,
          height: 40,
          width: 40,
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: subSide == SubSide.right
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(user.age.toString()),
                Icon(
                  user.sex == Gender.male ? Icons.male : Icons.female,
                  color: Colors.grey[500],
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                user.description.toString(),
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: subSide == SubSide.right ? TextAlign.end : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _subCardEl(BuildContext context, Border border, String text) {
    return Container(
      height: 49,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(border: border),
      child: Center(
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Border _rBorder() {
    return Border(
      right: _borderSide(),
    );
  }

  Border _lBorder() {
    return Border(
      left: _borderSide(),
    );
  }

  Border _rbBorder() {
    return Border(
      right: _borderSide(),
      bottom: _borderSide(),
    );
  }

  Border _lbBorder() {
    return Border(
      left: _borderSide(),
      bottom: _borderSide(),
    );
  }

  Border _fullBorder() {
    return Border(
      left: _borderSide(),
      right: _borderSide(),
      top: _borderSide(),
      bottom: _borderSide(),
    );
  }

  Border _lrtBorder() {
    return Border(
      left: _borderSide(),
      right: _borderSide(),
      top: _borderSide(),
    );
  }

  BorderSide _borderSide() {
    return const BorderSide(
      color: Colors.grey,
      width: 2,
    );
  }
}

enum SubSide { right, none, left }
