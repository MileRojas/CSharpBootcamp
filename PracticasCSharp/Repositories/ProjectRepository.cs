using PracticasCSharp.Data;
using PracticasCSharp.DTOs;
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
        /* BD
            return await _context.Projects
            .Where(x => x.Name.Contains(name))
            .ToListAsync();
        */
        var result = FakeProjectData.Projects.Where(x => x.Name.Contains(name));
        return await Task.FromResult(result);
    }

    public async Task<PageResult<Project>> GetProjectsAsync(ProjectFilter projectFilter)
    {
        ///En los comentarios esta la version para BD
        
        var query = FakeProjectData.Projects.AsQueryable();

        // filtros...

        var totalCount = query.Count();

        var projects = query
            .Skip((projectFilter.Page - 1) * projectFilter.PageSize)
            .Take(projectFilter.PageSize)
            .ToList();

        return new PageResult<Project>
        {
            Items = projects,
            TotalCount = totalCount,
            Page = projectFilter.Page,
            PageSize = projectFilter.PageSize
        };
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
    }
    
    public async Task<PagedResult<Project>> GetProjectsAsync(ProjectFilter filter)
{
    var query = _context.Projects.AsQueryable();

    // filtros...

    var totalCount = await query.CountAsync();

    var projects = await query
        .Skip((filter.Page - 1) * filter.PageSize)
        .Take(filter.PageSize)
        .ToListAsync();

    return new PagedResult<Project>
    {
        Items = projects,
        TotalCount = totalCount,
        Page = filter.Page,
        PageSize = filter.PageSize
    };
}
    
    
    
    */
   
}