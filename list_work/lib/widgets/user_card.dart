import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:list_work/model/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  final double height;
  final bool squareAvatar;
  final bool includeDescription;

  const UserCard({
    super.key,
    required this.user,
    this.height = 72.0,
    this.squareAvatar = false,
    this.includeDescription = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 16, top: 0, right: 24),
            height: height,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (height == 72)
                      _buildSvgPicture()
                    else
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.grey[500],
                            child: _buildSvgPicture(),
                          ),
                          const SizedBox(height: 6.5),
                        ],
                      ),
                    const SizedBox(width: 16),
                    _buildText(context),
                  ],
                ),
                _buildSexIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSvgPicture() {
    return SvgPicture.string(
      user.squareAvatarUrl,
      height: 40,
      width: 40,
    );
  }

  Widget _buildText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${user.firstName} ${user.lastName}',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          user.age.toString(),
          style: TextStyle(color: Colors.grey[500]),
        ),
        if (includeDescription)
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            child: Text(
              user.description.toString(),
              style: TextStyle(color: Colors.grey[500]),
              softWrap: false,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // new
            ),
          ),
      ],
    );
  }

  Widget _buildSexIcon() {
    return Icon(
      user.sex == Gender.male ? Icons.male : Icons.female,
      color: Colors.grey[500],
    );
  }
}
