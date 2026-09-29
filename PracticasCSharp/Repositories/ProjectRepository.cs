using PracticasCSharp.Data;
using PracticasCSharp.Models;

namespace PracticasCSharp.Repositories;

public class ProjectRepository : IProjectRepository
{
    public async Task<IEnumerable<Project>> GetProjectsAsync()
    {
        return await Task.FromResult(FakeProjectData.Projects);
    }
    public async Task<IEnumerable<Project>> GetProjectsByNameAsync(string name)
    {
        /*
        Para base de datos
            return await _context.Projects
            .Where(x => x.Name.Contains(name))
            .ToListAsync();
        */
        var result = FakeProjectData.Projects.Where(x => x.Name.Contains(name));
        return await Task.FromResult(result);
    }
    /* *********
    DB conexion
    ****************
    private readonly AppDbContext _context;

    public ProjectRepository(AppDbContext context)
    {
        _context = context;
    }
    public async Task<IEnumerable<Project>> GetProjectsAsync()
    {
        return await _context.Projects
            .Where(x => x.IsActive)
            .ToListAsync();
    }*/
}