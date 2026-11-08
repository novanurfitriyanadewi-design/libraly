import 'package:flutter/material.dart';
import '../main.dart' show kPrimary, kPrimaryDeep, kSoft;

const String fotoProfil = 'assets/nova.jpeg';

/// Data pribadi
const String namaLengkap = 'Nova Nurfitriyana Dewi';
const String ttl = 'Sumenep, 24 Oktober 2005';
const String email = 'nurfitriyananova.24@gmail.com';
const String noHp = '082132313412';
const String instagram = '@nurfitriyananova';
const String github = 'github.com/novanurfitriyanadewi-design';

const Color warnaUtama = kPrimary;
const Color warnaGelap = kPrimaryDeep;

// =====================================================================
// HALAMAN PROFIL UNTUK PANEL ADMIN (tanpa Scaffold, tampil di dalam shell)
// =====================================================================
class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: const Column(
            children: [
              ProfileCard(),
              SizedBox(height: 16),
              AboutSection(),
              SizedBox(height: 16),
              PersonalDataSection(),
              SizedBox(height: 16),
              EducationSection(),
              SizedBox(height: 16),
              OrganizationSection(),
              SizedBox(height: 16),
              SkillSection(),
              SizedBox(height: 24),
              Text(
                '© 2026 Nova Nurfitriyana Dewi',
                style: TextStyle(color: Colors.black45, fontSize: 12),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

/// Kartu utama: layout berubah sesuai lebar layar.
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Pakai lebar area kartu (bukan lebar layar), karena sidebar
            // memakan sebagian ruang di layar lebar.
            final bool isWide = constraints.maxWidth > 560;

            if (isWide) {
              return const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileAvatar(size: 200),
                  SizedBox(width: 32),
                  Expanded(child: ProfileHeaderInfo(centered: false)),
                ],
              );
            } else {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProfileAvatar(size: 160),
                  SizedBox(height: 24),
                  ProfileHeaderInfo(centered: true),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

/// Foto profil (CircleAvatar) + badge "Available" (Stack + Positioned).
class ProfileAvatar extends StatelessWidget {
  final double size;

  const ProfileAvatar({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: CircleAvatar(
              radius: size / 2,
              backgroundColor: warnaUtama,
              child: CircleAvatar(
                radius: (size / 2) - 4,
                backgroundColor: kSoft,
                backgroundImage: const AssetImage(fotoProfil),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Text(
                'Available',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Nama, prodi, ikon kontak (Row), dan tagline.
class ProfileHeaderInfo extends StatelessWidget {
  final bool centered;

  const ProfileHeaderInfo({super.key, required this.centered});

  @override
  Widget build(BuildContext context) {
    final crossAlign =
    centered ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment: crossAlign,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          namaLengkap,
          textAlign: textAlign,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'Mahasiswa Sistem Informasi - UNIPDU',
          textAlign: textAlign,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 4),
        Text(
          'Mobile & Web Developer Enthusiast',
          textAlign: textAlign,
          style: const TextStyle(
            fontSize: 14,
            color: warnaUtama,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Membangun solusi digital yang rapi, bermanfaat, dan nyaman '
              'digunakan, sambil terus belajar dan berorganisasi.',
          textAlign: textAlign,
          style: const TextStyle(fontSize: 14, height: 1.5),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment:
          centered ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: const [
            ContactIcon(icon: Icons.email, color: Colors.red),
            SizedBox(width: 16),
            ContactIcon(icon: Icons.phone, color: Colors.green),
            SizedBox(width: 16),
            ContactIcon(icon: Icons.code, color: Colors.black87),
          ],
        ),
      ],
    );
  }
}

class ContactIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const ContactIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: color.withOpacity(0.12),
      child: Icon(icon, color: color),
    );
  }
}

// =====================================================================
// KOMPONEN SECTION
// =====================================================================
class SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const SectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: warnaUtama),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: warnaGelap,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            child,
          ],
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionCard(
      icon: Icons.person_outline,
      title: 'Tentang Saya',
      child: Text(
        'Saya adalah mahasiswa Sistem Informasi semester 5 di UNIPDU yang '
            'memiliki ketertarikan besar pada pengembangan aplikasi mobile dan '
            'web. Berlatar belakang pendidikan tahfidz sejak SMP hingga SMA, '
            'saya terbiasa disiplin, konsisten, dan tekun dalam menyelesaikan '
            'setiap tanggung jawab.\n\n'
            'Di bidang teknologi, saya menguasai Flutter, Dart, Laravel, PHP, '
            'dan Java untuk membangun aplikasi yang fungsional dan responsif. '
            'Di luar perkuliahan, saya aktif berorganisasi di BEM Saintek, '
            'UKM LPM, dan PMII, yang melatih kemampuan kepemimpinan, '
            'komunikasi, kerja sama tim, serta manajemen waktu.\n\n'
            'Saya senang belajar hal baru, terbuka terhadap kritik, dan selalu '
            'berusaha menghadirkan karya yang rapi, bermanfaat, dan memiliki '
            'nilai guna bagi orang lain.',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 14, height: 1.6),
      ),
    );
  }
}

class PersonalDataSection extends StatelessWidget {
  const PersonalDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionCard(
      icon: Icons.badge_outlined,
      title: 'Data Pribadi & Kontak',
      child: Column(
        children: [
          InfoRow(icon: Icons.cake_outlined, label: 'TTL', value: ttl),
          InfoRow(icon: Icons.email_outlined, label: 'Email', value: email),
          InfoRow(icon: Icons.phone_outlined, label: 'No. HP', value: noHp),
          InfoRow(
            icon: Icons.camera_alt_outlined,
            label: 'Instagram',
            value: instagram,
          ),
          InfoRow(icon: Icons.code, label: 'GitHub', value: github),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionCard(
      icon: Icons.school_outlined,
      title: 'Pendidikan',
      child: Column(
        children: [
          TimelineItem(
            title: 'S1 Sistem Informasi - UNIPDU',
            subtitle: '2024 - sekarang (Semester 5)',
          ),
          TimelineItem(
            title: 'SMA Tahfidz Al-Amien',
            subtitle: '2020 - 2023',
          ),
          TimelineItem(
            title: 'SMP Tahfidz Al-Amien',
            subtitle: '2017 - 2020',
          ),
        ],
      ),
    );
  }
}

class OrganizationSection extends StatelessWidget {
  const OrganizationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionCard(
      icon: Icons.groups_outlined,
      title: 'Pengalaman Organisasi',
      child: Column(
        children: [
          TimelineItem(
            title: 'PMII - Bendahara',
            subtitle: 'Badan Pengurus Harian, 2024 - sekarang',
          ),
          TimelineItem(
            title: 'BEM Saintek UNIPDU - Anggota',
            subtitle: 'Departemen Agama dan Sosial, 2025 - sekarang',
          ),
          TimelineItem(
            title: 'UKM LPM - Sekretaris',
            subtitle: 'Badan Pengurus Harian, 2024 - 2026',
          ),
        ],
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const TimelineItem({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(Icons.circle, size: 10, color: warnaUtama),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Wrap: skill dalam bentuk Chip (otomatis pindah baris)
class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionCard(
      icon: Icons.bolt_outlined,
      title: 'Keahlian',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          SkillChip('Flutter'),
          SkillChip('Dart'),
          SkillChip('Laravel'),
          SkillChip('PHP'),
          SkillChip('Java'),
          SkillChip('Kepemimpinan'),
          SkillChip('Kerja Tim'),
          SkillChip('Komunikasi'),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: kSoft,
      side: BorderSide.none,
    );
  }
}