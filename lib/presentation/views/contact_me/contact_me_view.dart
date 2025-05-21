import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/presentation/configs/configs.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';
import 'package:portfolio_flutter/presentation/views/wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeView extends StatelessWidget {
  const ContactMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrapper(
      page: GetInTouchPage(),
    );
  }
}

class GetInTouchPage extends StatefulWidget {
  const GetInTouchPage({super.key});
  @override
  State<GetInTouchPage> createState() => _GetInTouchPageState();
}

class _GetInTouchPageState extends State<GetInTouchPage> {
  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600; // adjust your breakpoint

    return Scaffold(
      backgroundColor: kPrimary,
      body: Center(
        child: SingleChildScrollView(
          padding:
              context.symmetricPercentPadding(hPercent: s10, vPercent: s10),
          child: isMobile
              // PHONE: stack text above image
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ksContact,
                        style: theme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    verticalSpaceMedium,
                    Text(
                      "Let’s build something awesome together—reach out!",
                      style: theme.bodyLarge,
                    ),
                    verticalSpaceLarge,
                    _LinkRow(
                      icon: FontAwesomeIcons.linkedin,
                      label: 'Connect with me on LinkedIn',
                      onTap: () => _launch(ksLinkedInLink),
                    ),
                    verticalSpaceMedium,
                    _LinkRow(
                      icon: Icons.email,
                      label: 'Send me an email',
                      onTap: () => _launch('mailto:$ksWorkEmail'),
                    ),
                    verticalSpaceMedium,
                    _LinkRow(
                      icon: FontAwesomeIcons.phone,
                      label: 'Contact me by phone',
                      onTap: () => _launch(ksWorkPhone),
                    ),
                    verticalSpaceLarge,
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(s8),
                        child: Image.asset(
                          kacontact,
                          width: width * 0.25,
                          height: width * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )
              // TABLET/DESKTOP: original two-column layout
              : Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(ksContact,
                              style: theme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          verticalSpaceMedium,
                          Text(
                              "Let’s build something awesome together—reach out!",
                              style: theme.bodyLarge),
                          verticalSpaceLarge,
                          _LinkRow(
                            icon: FontAwesomeIcons.linkedin,
                            label: 'Connect with me on LinkedIn',
                            onTap: () => _launch(ksLinkedInLink),
                          ),
                          verticalSpaceMedium,
                          _LinkRow(
                            icon: Icons.email,
                            label: 'Send me an email',
                            onTap: () => _launch('mailto:$ksWorkEmail'),
                          ),
                          verticalSpaceMedium,
                          _LinkRow(
                            icon: FontAwesomeIcons.phone,
                            label: 'Contact me by phone',
                            onTap: () => _launch(ksWorkPhone),
                          ),
                          verticalSpaceLarge,
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(s8),
                          child: Image.asset(
                            kacontact,
                            width: context.percentWidth(15),
                            height: context.percentHeight(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _LinkRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _LinkRow(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: s24, color: kSecondary),
          horizontalSpaceSmall,
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
