El flujo completo es de la arquitectura 

Program
   │
   │ GetActiveProjectsAsync()
   ▼
IProjectService
   │
   ▼
ProjectService
   │
   │ GetProjectsAsync()
   ▼
IProjectRepository
   │
   ▼
ProjectRepository
   │
   ▼
FakeProjectData
   │
   ▼
ProjectService filtra IsActive
   │
   ▼
Program recibe projects