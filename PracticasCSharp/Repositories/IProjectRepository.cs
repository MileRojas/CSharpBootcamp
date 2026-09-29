using PracticasCSharp.Models;

namespace PracticasCSharp.Repositories;
public  interface IProjectRepository
{
    Task<IEnumerable<Project>> GetProjectsAsync();
    Task<IEnumerable<Project>> GetProjectsByNameAsync(string name);

}
