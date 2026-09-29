/*using PracticasCSharp.Models;
using PracticasCSharp.Services;

namespace PracticasCSharp.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProjectController : ControllerBase
{
    private readonly IProjectService _projectService;

    public ProjectController(IProjectService projectService)
    {
        _projectService = projectService;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Project>>> GetProjects()
    {
        var projects = await _projectService.GetActiveProjectsAsync();
        return Ok(projects);
    }

}*/