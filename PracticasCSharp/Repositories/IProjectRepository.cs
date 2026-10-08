using PracticasCSharp.Models;

namespace PracticasCSharp.Repositories;
public  interface IProjectRepository
{
    // para el ejemplo dejo todas las funciones desarrolladas, los dos primeros se pueden quitar y solo usar:
    // Task<IEnumerable<Project>> GetProjectsAsync(ProjectFilter projectFilter);
    Task<IEnumerable<Project>> GetProjectsAsync();
    Task<IEnumerable<Project>> GetProjectsByNameAsync(string name);
    Task<PageResult<Project>> GetProjectsAsync(ProjectFilter projectFilter);
}
