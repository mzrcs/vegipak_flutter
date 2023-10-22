class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "On Your Doorstep",
    desc:
        "We provide the best services in the town. So, Instead of going out your Vegbusket will be on your doorstep.",
    image: "assets/images/scooter_guy.jpeg",
  ),
  OnboardingContents(
    title: "Fresh Vegitables",
    desc: "We don't hoarding so you can enjoy the freshness of nature.",
    image: "assets/images/fresh_vegi.jpg",
  ),
  OnboardingContents(
    title: "Service For Everyday",
    desc:
        "We operate everyday so you can order whenever you want and it will deliver in next 24 hours.",
    image: "assets/images/delivery-24h.jpg",
  ),
];
