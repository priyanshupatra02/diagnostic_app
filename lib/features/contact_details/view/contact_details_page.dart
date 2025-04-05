import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/features/contact_details/controller/pod/contact_details_pod.dart';
import 'package:diagnostic_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ContactDetailsPage extends StatelessWidget {
  const ContactDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ContactDetailsView();
  }
}

class ContactDetailsView extends StatelessWidget {
  const ContactDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Contact Us',
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final contactDetailsAsync = ref.watch(contactDetailsProvider);
            return contactDetailsAsync.easyWhen(
              data: (contactDetailsModel) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionHeader(title: 'Our Locations'),
                        AddressCard(
                          title: 'Corporate Office',
                          address: contactDetailsModel.contactData.corporateOfficeAddress,
                          icon: Icons.business,
                        ),
                        const SizedBox(height: 16),
                        AddressCard(
                          title: 'Laboratory',
                          address: contactDetailsModel.contactData.laboratoryAddress,
                          icon: Icons.science,
                        ),
                        const SizedBox(height: 24),
                        const SectionHeader(title: 'Contact Information'),
                        const SizedBox(height: 8),
                        ContactItem(
                          icon: Icons.phone,
                          title: 'Toll Free',
                          content: contactDetailsModel.contactData.contactNo1,
                          onTap: () => ContactUtils.makePhoneCall(
                              contactDetailsModel.contactData.contactNo1),
                        ),
                        ContactItem(
                          icon: Icons.phone_android,
                          title: 'Mobile',
                          content: contactDetailsModel.contactData.contactNo2,
                          onTap: () => ContactUtils.makePhoneCall(
                              contactDetailsModel.contactData.contactNo2),
                        ),
                        ContactItem(
                          icon: Icons.email,
                          title: 'Email',
                          content: contactDetailsModel.contactData.contactEmail,
                          onTap: () =>
                              ContactUtils.sendEmail(contactDetailsModel.contactData.contactEmail),
                        ),
                        const SizedBox(height: 32),
                        const MessageButton(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final String title;
  final String address;
  final IconData icon;

  const AddressCard({
    super.key,
    required this.title,
    required this.address,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              address,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.map, size: 18),
                  label: const Text('View on Map'),
                  onPressed: () => ContactUtils.openMap(address),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  icon: const Icon(Icons.content_copy, size: 18),
                  label: const Text('Copy'),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: address));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Address copied to clipboard'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Function() onTap;

  const ContactItem({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title),
        subtitle: Text(content),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.content_copy, size: 20),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: content));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title copied to clipboard'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                title == 'Email' ? Icons.send : Icons.call,
                size: 20,
                color: Colors.blue,
              ),
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class MessageButton extends StatelessWidget {
  const MessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MessageDialog();
            },
          );
        },
        icon: const Icon(Icons.message),
        label: const Text('Send us a Message'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}

class MessageDialog extends StatelessWidget {
  const MessageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Send a Message'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Your Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Your Message',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Send message logic would go here
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Message sent successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          },
          child: const Text('Send'),
        ),
      ],
    );
  }
}

// Utility class for contact-related functions
class ContactUtils {
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  static Future<void> sendEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  static Future<void> openMap(String address) async {
    final encodedAddress = Uri.encodeComponent(address);
    final Uri launchUri =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedAddress');
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri, mode: LaunchMode.externalApplication);
    }
  }
}
