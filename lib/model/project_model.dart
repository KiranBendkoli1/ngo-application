class ProjectModel {
  int projectId;
  String projectTitle,
      projectDescription,
      imageUrl,
      projectAddress,
      projectTeamLeader,
      projectCategory,
      startDate,
      endDate;
  int projectFunds;

  ProjectModel(
      {required this.projectId,
      required this.projectTitle,
      required this.projectDescription,
      required this.imageUrl,
      required this.projectAddress,
      required this.projectFunds,
      required this.projectTeamLeader,
      required this.projectCategory,
      required this.startDate,
      required this.endDate});
}
