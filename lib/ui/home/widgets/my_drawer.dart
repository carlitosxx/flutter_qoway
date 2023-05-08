import 'package:flutter/material.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/widgets/logo.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Drawer(
      child: ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: LogoWidget(height: 100),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
            ),
            ListTile(
              leading: const Icon(
                Icons.credit_score,
              ),
              title: Text(l10n.textAccountsDrawer),
              onTap: () async {},
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: Text(l10n.logout),
              onTap: () async {},
            ),
          ],
        ),
      ),
    );
  }
}
