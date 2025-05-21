import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/data/model/activity.dart';
import 'package:portfolio_flutter/data/model/certficate.dart';
import 'package:portfolio_flutter/data/model/experience.dart';
import 'package:portfolio_flutter/data/model/project_info.dart';
import 'package:portfolio_flutter/data/model/route_model.dart';
import 'package:portfolio_flutter/data/model/showcase_project.dart';
import 'package:portfolio_flutter/data/model/social_media.dart';
import 'package:portfolio_flutter/presentation/configs/constant_assets.dart';
import 'package:portfolio_flutter/presentation/configs/constant_colors.dart';
import 'package:portfolio_flutter/presentation/configs/constant_icons.dart';
import 'package:portfolio_flutter/presentation/configs/constant_sizes.dart';
import 'package:portfolio_flutter/presentation/route/routes.dart';

/// constant strings are prefixed with [ks]
const String ksFontFamily = "Poppins";

const String ksFlutterDeveloperAnd = "Flutter Developer /";
const String ksAiMlEnthusiast = "Software Engineer";
const String ksAiEnthusiast = "ai enthusiast";
const String ksTechNerd = "a  tech  nerd";
const String ksFlutterDev = "flutter  dev";
const String coffeeAddict = "coffee addict";
const String ksIntrovert = "an introvert";
const String ksIm = "I'm";
const String ksIntro = """
  Hi, I'm Pranav Kashyap Gujja!
    - a passionate mobile developer
    - a student from UTA
    - a curious learner
  """;
const String ksSeeMyWork = "Contact Me";
const String ksBrowseProjects = "Browse My Projects";
const String ksWhatElse = "Currently open to full-time opportunities";
const String ksSayHello = "Get in touch—I’m ready for new challenges.";
const String ksHome = "Home";
const String ksAbout = "About";
const String ksExperience = "My Experience";
const String ksCertificates = "Certificates";
const String ksProject = "My Projects";
const String ksViewProject = "View Project";
const String ksCraftedWithLove = "Crafted with Love";
const String ksRecentProjects = "Here are a selection of my recent projects";
const String ksCraftedProjects = 'Explore My Creative Work';
const String ksContact = "Contact Me";
const String ksAboutMe = "About Me";
const String ksBgStory = "Background Story";
const String ksTools = "Tools & Technology";
const String ksAllAboutMe = "All About Me";
const String ksGithub = "Github";
const String ksLinkedIn = "LinkedIn";
const String ksDiscord = "Discord";
const String ksSendMessage = 'Send Message';

const String ksSlash = "/";
const String ksLetsWork = "Let's work together!";
const String ksFreelanceAvailability = "Open to New Career Opportunities!";
const String ksContactInfo = "- Contact Info";
const String ksWorkEmail = "pranavkashyap0315@gmail.com";
const String ksWorkPhone = "+1 682-203-1353";

const String ksSpecialization =
    "As a mobile app developer, I create innovative applications using Flutter,Kotlin,TensorFlow Lite, and Android SDK, focusing on real-time data processing, BLE connectivity, and user-friendly interfaces.";
const String ksWhoAmI = 'Who Am I?';
const String ksWhatILove = "What I Love To Do";
const String ksBriefAboutMe =
    "Hi! I’m Pranav Kashyap Gujja, a Software Engineer with an M.S. in Computer Science Engineering from the University of Texas at Arlington. ";
const String ksMyLife =
    "I specialize in mobile development, building responsive, scalable apps with clear architecture and intuitive interfaces";
const String ksProfession =
    "I worked as an Associate Application Developer at Accenture—designing and testing Android apps in Java/Kotlin with MVVM and Clean Architecture. Currently working as an Application Developer at UTA Research Institute (Jan 2024–Present), I have designed and developed a Flutter app that connects via BLE to an ESP32-based smart seat cushion for real-time pressure monitoring, implemented dynamic heatmap visualizations to highlight high-pressure zones, integrated a TensorFlow Lite model for on-device posture classification, and built interactive controls to inflate, deflate, redistribute, and equalize air cells.";

const String ksMyTools =
    "I use a bunch of tools and technologies to make design and implementation process easier. ";
const String ksWeapon = "My favorite choice of weapon is ";
const String ksFlutter = "Flutter & Dart";

const String ksMobile = 'Mobile Technologies';
const String ksWebAndOther = 'Web & Other Technologies';
final List<String> ksMobileTech = ['Flutter', 'Dart', 'kotlin', 'Java'];
final List<String> ksWebTech = [
  'HTML',
  'CSS',
  'C',
  'SpringBoot',
];
final List<String> ksOtherTech = [
  'Firebase',
  'SQL',
  'Python',
];

final List<RouteModel> ksMenu = [
  RouteModel(label: ksHome, route: Routes.home),
  RouteModel(label: ksProject, route: Routes.projects),
  RouteModel(label: ksExperience, route: Routes.experience),
  RouteModel(label: ksCertificates, route: Routes.certificates),
  RouteModel(label: ksAbout, route: Routes.about),
  RouteModel(label: ksContact, route: Routes.contact),
];

const String ksAwardsAndActivities = "Awards & Activities";
const String ksAward = "Award I've won";
const String ksAwardName = "IEEE National Level Project Expo";
const String ksAwardLink = "https://witaward.com/result/2020";
const String ksAwardDetails = """
Won 2nd place in the Computer Science domain with “Smart Campus” at the IEEE National Level Project Expo hosted by Vardhaman College of Engineering
""";
const String ksActivities = "Activities I've joined";
final List<Activity> ksActivityList = [
  Activity(
    // title: ksAward,
    name: ksAwardName,
    icon: kiTrophy,
    details: ksAwardDetails,
    link: ksAwardLink,
  ),
  Activity(
    //  title: ksActivities,
    name: "Elysium Hackathon",
    icon: kiActivity,
    details:
        " Awarded a Certificate of Merit for placing 3rd in the Sadda Hack Hackathon organized by IEEE-IIIT Delhi Student Branch                                                               ",
  ),
  Activity(
    name: "Product-a-thon by IIITD IIC",
    icon: kiActivity,
    details:
        "Secured 3rd prize in the Product-a-thon organized by IIITD Innovation & Incubation Center,                                                                                                                                                     ",
  ),
];

final List<Experience> ksExperiences = [
  Experience(
    company: "University of Texas at Arlington Research Institute",
    position: "Application Developer, Intern",
    responsibilities: [
      "Designed and developed a Flutter mobile app that connects to a smart seat cushion to help prevent pressure ulcers in wheelchair users by tracking and adjusting seating pressure in real time",
      "Integrated Bluetooth Low Energy (BLE) to connect the app with an ESP32-based pressure sensor system, allowing real-time reading of seating pressure data",
      "Implemented dynamic heatmap visualizations to display live pressure distribution across the cushion, helping users identify high-pressure zones and adjust posture accordingly",
      "Integrated a TensorFlow Lite (TF Lite) model to perform on-device classification of 10 seating positions (e.g. Forward, Back, Normal), using live pressure sensor data for real-time posture detection and tracking",
      "Implemented a posture accuracy evaluation system that calculates the user’s adherence to repositioning tasks by tracking misclassifications during each posture and logging results to Firestore for clinical feedback",
      "Developed a posture reminder system that alerts users when a posture is maintained for prolonged periods, promoting healthy sitting habits",
    ],
    startDate: DateTime(2024, 1),
    endDate: DateTime.now(),
  ),
  Experience(
    company: "Accenture",
    position: "Associate Application Developer",
    responsibilities: [
      "Designed and implemented Android applications in Java & Kotlin using MVVM and Clean Architecture, ensuring modular, maintainable, and testable code.",
      "Created responsive UI layouts using XML and Jetpack Compose, adapting designs for multiple screen sizes and form factors.",
      "Wrote unit tests with JUnit and Mockito and basic UI tests using Espresso, boosting code coverage and catching defects early",
      "Used GitHub for version control—managed feature branches, pull requests and conducted peer reviews to maintain a clean codebase.",
    ],
    startDate: DateTime(2021, 8),
    endDate: DateTime(2023, 1),
  ),
];

final List<Certificate> ksCertificateList = [
  Certificate(
    name: "Workshop Certificate",
    image: kaWorkshop,
    link: "",
  ),
  Certificate(
    name: "Research Assistant as Application Developer(UTARI_Spring24)",
    image: karesearch1,
    link: "",
  ),
  Certificate(
    name: "Research Assistant as Application Developer(UTARI_Fall24)",
    image: karesearch2,
    link: "",
  ),
  Certificate(
    name: "Product-a-thon by IIITD",
    image: katrailblazer,
    link: "",
  ),
  Certificate(
    name: "Product-a-thon by IIITD",
    image: katrailblazermain,
    link: "",
  ),
  Certificate(
    name: "Elysium Hackathon",
    image: kaelysium,
    link: "",
  ),
  Certificate(
    name: "IEEE National Level Project",
    image: kavardhaman,
    link: "",
  ),
];

const String ksLinkedInLink = 'https://www.linkedin.com/in/pranavkashyap7/';
final List<SocialMedia> ksSocialMedia = [
  SocialMedia(
    link: ksLinkedInLink,
    icon: FaIcon(
      FontAwesomeIcons.linkedin,
      color: kSecondary,
      size: s18,
    ),
  ),
];

const String _FLUTTER = 'Flutter';
const String _PYTHON = 'Python';
const String _JAVA = 'JAVA';
const String _DART = 'Dart';
const String _FIREBASE = 'Firebase';
const String _HTML = 'Html';
const String _CSS = 'Css';
const String _JAVASCRIPT = 'Javascript';
const String _GRAPHQL = "GraphQL";
const String _ME = 'Pranav Kashyap Gujja';

const String _ANDROID = 'Android';
const String _IOS = 'Ios';
const String _WINDOWS = 'Windows';
const String _LINUX = 'Linux';
const String _MAC = 'MacOs';
const String _WEB = 'Web';
final List<ShowcaseProject> ksShowcaseProjects = [
  ShowcaseProject(
    title: 'WheelChair SeatCushion',
    image: kaPulseX,
    shortDescription:
        "Flutter App that connects to a smart seat cushion to help prevent pressure ulcers in wheelchair users ",
    description: """
	•Designed and developed a Flutter mobile app that connects to a smart seat cushion to help prevent pressure ulcers in wheelchair users by tracking and adjusting seating pressure in real time
	•Integrated Bluetooth Low Energy (BLE) to connect the app with an ESP32-based pressure sensor system, allowing real-time reading of seating pressure data
	•Implemented dynamic heatmap visualizations to display live pressure distribution across the cushion, helping users identify high-pressure zones and adjust posture accordingly
	•Integrated a TensorFlow Lite (TF Lite) model to perform on-device classification of 10 seating positions (e.g. Forward, Back, Normal), using live pressure sensor data for real-time posture detection and tracking
	•Implemented a posture accuracy evaluation system that calculates the user’s adherence to repositioning tasks by tracking misclassifications during each posture and logging results to Firestore for clinical feedback
	•Developed a posture reminder system that alerts users when a posture is maintained for prolonged periods, promoting healthy sitting habits
	•Developed a feature to generate detailed PDF reports of user posture history, repositioning accuracy, and visual analytics for clinical documentation and progress tracking
	•Developed a responsive Flutter interface enabling real-time seat adjustment functions—inflate, deflate, redistribute, and equalize—through Bluetooth command integration for cushion control
  •The paper titled "Smart Seat Cushion Mobile Application with On-Device Posture Prediction Using TensorFlow Lite" by S. Kumar, P. Kashyap, S. Kongara, Y. Tzen, and M. Wijesundara has been submitted to Disability and Rehabilitation: Assistive Technology and is currently under review.
        """,
    link: ProjectInfo(
      icon: kiLink,
      label: "Project Links",
      isLink: true,
      contents: [
        "https://utari.uta.edu/research/biomedical-technologies/injury-prevention-technology-research/",
        "https://www.theshorthorn.com/news/utari-designs-cushion-to-help-prevent-skin-breakdown/article_1beba636-c9a9-11e8-bd8c-4b524f8a6b2e.html"
      ],
    ),
    heroTag: '',
    tags: ProjectInfo(
      icon: kiTag,
      label: 'Tags',
      isTag: true,
      contents: [
        'package',
        _FLUTTER.toLowerCase(),
        _DART.toLowerCase(),
        _PYTHON.toLowerCase(),
      ],
    ),
    tech: ProjectInfo(
      icon: kiChip,
      label: 'Tools & Technologies',
      contents: [
        _FLUTTER.toUpperCase(),
        _DART.toUpperCase(),
        _PYTHON.toUpperCase(),
      ],
    ),
    author: ProjectInfo(
      icon: kiPerson,
      label: 'Developer',
      contents: [
        _ME,
      ],
    ),
    platform: ProjectInfo(
      icon: kiLaptop,
      label: 'Available Platforms',
      contents: [
        _ANDROID,
        _IOS,
      ],
    ),
  ),
  ShowcaseProject(
    title: 'SMART CAMPUS',
    image: kaNotee,
    shortDescription:
        "An all-in-one Android app designed to offer smart college services such as canteen ordering, event registration, bus tracking, and cleanliness reporting.",
    description: """
•The app provides students with convenient access to smart services such as:
•Canteen ordering system
•Lost and found management
•Cleanliness and maintenance reporting
•Library access
•Real-time college bus tracking via GPS
•Applying for college events and placement opportunities
•Dedicated admin panels are available for canteen staff, event coordinators, and placement officers to manage and respond to student requests effectively. For example, the canteen admin can view and process food orders, event admins can post upcoming events, and placement admins can update opportunities.A unique feature of the app includes a machine learning (ML) module that processes student feedback on food items. Using a Recurrent Neural Network (RNN), the model classifies feedback as positive or negative and converts it into a rating. 
        """,
    link: ProjectInfo(
        icon: kiLink,
        label: "Project Links",
        isLink: true,
        contents: [
          "https://drive.google.com/drive/u/1/folders/1IC5582UIHA5Q7217cTMNe8Wv0a5pNU7K",
        ]),
    heroTag: 'notee',
    tags: ProjectInfo(
      icon: kiTag,
      label: 'Tags',
      isTag: true,
      contents: [
        'app',
        _JAVA.toLowerCase(),
      ],
    ),
    tech: ProjectInfo(
      icon: kiChip,
      label: 'Tools & Technologies',
      contents: [
        _JAVA.toUpperCase(),
        _FIREBASE.toUpperCase(),
        _PYTHON.toUpperCase(),
      ],
    ),
    author: ProjectInfo(
      icon: kiPerson,
      label: 'Developer',
      contents: [
        _ME,
      ],
    ),
    platform: ProjectInfo(
      icon: kiLaptop,
      label: 'Available Platforms',
      contents: [
        _ANDROID,
      ],
    ),
  ),
];
