using PracticasCSharp.Models;
using PracticasCSharp.Repositories;

namespace PracticasCSharp.Services;
public class ProjectService : IProjectService
{
    private readonly IProjectRepository _projectRepository;

    public ProjectService(IProjectRepository projectRepository)
    {
        _projectRepository = projectRepository;
    }

    public async Task<IEnumerable<Project>> GetActiveProjectsAsync()
    {
         var projects = await _projectRepository.GetProjectsAsync();
         return projects.Where(x => x.IsActive);
    }
    public async Task<IEnumerable<Project>> SearchProjectsAsync(string name)
    {
        var projects = await _projectRepository.GetProjectsByNameAsync(name);
        return projects;
    }
}