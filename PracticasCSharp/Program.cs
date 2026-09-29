using PracticasCSharp.Exercises;
using PracticasCSharp.Repositories;
using PracticasCSharp.Services;

var exercises = new LinqExercises();
exercises.Run();

Console.WriteLine();
Console.WriteLine("========== SERVICE ==========");
Console.WriteLine();

IProjectRepository repository = new ProjectRepository();
IProjectService service = new ProjectService(repository);

var projects = await service.GetActiveProjectsAsync();

foreach (var project in projects)
{
    Console.WriteLine(
        $"{project.Name} - {project.Country} - {project.NumberOfDevelopers} developers"
    );
}

Console.WriteLine("************************************************************");

while(true)
{
    var name = Console.ReadLine();
    var projects1 = await service.SearchProjectsAsync(name);
   
    if (!projects1.Any())
    {
        Console.WriteLine("No se encontraron proyectos.");
    }
    else
    {
        foreach (var project1 in projects1)
        {
            Console.WriteLine(
                $"{project1.Name} - {project1.Country} - {project1.NumberOfDevelopers} developers"
            );
        }
    }
    
}

