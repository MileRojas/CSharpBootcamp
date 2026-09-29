using PracticasCSharp.Models;
namespace PracticasCSharp.Services;
public  interface IProjectService
{
   Task<IEnumerable<Project>> GetActiveProjectsAsync();
   Task<IEnumerable<Project>> SearchProjectsAsync(string name);
}