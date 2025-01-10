import 'package:flutter/material.dart';

class UserAccountsAppBarHeader extends StatelessWidget {
  final String? name;
  final String? email;
  final String? avatarUrl;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onEditProfileTap;

  const UserAccountsAppBarHeader({
    Key? key,
    this.name,
    this.email,
    this.avatarUrl,
    this.onAvatarTap,
    this.onEditProfileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Custom Painter for the background
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 150),
          painter: HeaderBackgroundPainter(),
        ),

        // Content
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
          child: Row(
            children: [
              // Profile Picture or Avatar
              GestureDetector(
                onTap: onAvatarTap,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: avatarUrl != null
                      ? NetworkImage(avatarUrl!)
                      : null,
                  child: avatarUrl == null
                      ? Icon(
                          Icons.person,
                          size: 44,
                          color: Colors.grey.shade700,
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 20.0),

              // User Information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display name
                    Text(
                      name ?? 'Guest User',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 6.0),

                    // Email or other details
                    Text(
                      email ?? 'No email provided',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),

              // Edit Profile Button
              if (onEditProfileTap != null)
                IconButton(
                  onPressed: onEditProfileTap,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  tooltip: 'Edit Profile',
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class HeaderBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    // Gradient color for the background
    paint.shader = LinearGradient(
      colors: [Colors.blue.shade400, Colors.blue.shade700],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2, 
      size.height, 
      size.width, 
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
