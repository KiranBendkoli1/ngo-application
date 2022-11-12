class Project {
  var projectName;
  var projectDescription;
  var projectLeader;
  var projectDomain;
  var projectLocation;
  var teamSize;

  Project(this.projectName, this.projectDescription, this.projectLeader,
      this.projectDomain, this.projectLocation, this.teamSize);
  Project.fromJson(Map<String, dynamic> json) {
    projectName = json['projectName'];
    projectDescription = json['projectDescription'];
    projectLeader = json['projectLeader'];
    projectDomain = json['projectDomain'];
    projectLocation = json['projectLocation'];
    teamSize = json['teamSize'];
  }
}
