import 'package:flutter/material.dart';
import '../models/user.dart';

class UserTile extends StatelessWidget {
  final User user;
  final VoidCallback? onTap;
  const UserTile({super.key, required this.user, this.onTap});

  @override
  Widget build(BuildContext context) {

    final initials = user.name.isNotEmpty
        ? user.name.trim().split(' ').map((s) => s.isEmpty ? '' : s[0]).take(2).join()
        : '';

    return ListTile(
      leading: CircleAvatar(
        child: Text(initials.toUpperCase()),
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
