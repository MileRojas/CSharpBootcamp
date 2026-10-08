using PracticasCSharp.Models;
using PracticasCSharp.DTOs;

namespace PracticasCSharp.Services;
public  interface IProjectService
{
   Task<IEnumerable<Project>> GetActiveProjectsAsync();
   Task<IEnumerable<Project>> SearchProjectsAsync(string name);
   public Task<PageResult<ProjectDto>> GetProjectsAsync(ProjectFilter projectFilter);
}