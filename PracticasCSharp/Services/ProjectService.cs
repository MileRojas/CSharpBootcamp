using PracticasCSharp.Models;
using PracticasCSharp.Repositories;
using PracticasCSharp.DTOs;

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
    public async Task<PageResult<ProjectDto>> GetProjectsAsync(ProjectFilter filter)
    {
        var result = await _projectRepository.GetProjectsAsync(filter);

        return new PageResult<ProjectDto>
        {
            Items = result.Items.Select(x => new ProjectDto
            {
                Name = x.Name,
                Country = x.Country
            }),
            TotalCount = result.TotalCount,
            Page = result.Page,
            PageSize = result.PageSize
        };
    }
}