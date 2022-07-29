enum ProjectType { Milestone, Project_Completion, unknown }

String? fromProjectType(ProjectType? type) {
  switch (type) {
    case ProjectType.Milestone:
      return 'Milestone';
    case ProjectType.Project_Completion:
      return 'Project_Completion';
    default:
      return '';
  }
}

ProjectType? toProjectType(String? type) {
  switch (type) {
    case 'Milestone':
      return ProjectType.Milestone;
    case 'Project_Completion':
      return ProjectType.Project_Completion;
    default:
      return ProjectType.unknown;
  }
}
