import '../../../resources/assets_manager.dart';

class Article {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? link;
  Article({this.title, this.subtitle, this.link, this.image});
}

List<Article> allArticle = [
  Article(
      image: AssetsManager.a1,
      title: 'The Power of Compassion',
      subtitle: 'How Doctors Make a Difference',
      link:
          'https://knowledge.wharton.upenn.edu/podcast/knowledge-at-wharton-podcast/the-compassion-crisis-one-doctors-crusade-for-caring/'),
  Article(
      image: AssetsManager.a2,
      title: 'Embracing Technology',
      subtitle: 'Doctors at the Forefront of Digital Healthcare',
      link: 'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9345235/'),
  Article(
      image: AssetsManager.a3,
      title: 'Breaking Barriers',
      subtitle: 'Women Doctors Shaping the Future of Medicine',
      link: 'https://pubmed.ncbi.nlm.nih.gov/9448468/'),
  Article(
      image: AssetsManager.a4,
      title: 'Doctors Without Borders',
      subtitle: 'Providing Medical Aid in Crisis Zones',
      link: 'https://www.msf.org/india'),
  Article(
      image: AssetsManager.a5,
      title: 'The Art of Healing',
      subtitle: "Doctors' Commitment to Patient Well-being",
      link: 'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2804629/'),
  Article(
      image: AssetsManager.a6,
      title: 'Beyond the Stethoscope',
      subtitle: 'Exploring the Diverse Specializations in Medicine',
      link: 'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7437610/'),
  Article(
      image: AssetsManager.a7,
      title: 'Caring for the Caregivers',
      subtitle: 'Tackling Doctor Burnout and Promoting Self-Care',
      link:
          'https://www.verywellmind.com/self-care-strategies-overall-stress-reduction-3144729')
];
