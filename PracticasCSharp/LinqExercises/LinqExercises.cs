using PracticasCSharp.DTOs;
using PracticasCSharp.Models;

namespace PracticasCSharp.Exercises;

public class LinqExercises
{
    public void Run()
    {
        var developers = new List<Developer>
        {
            new Developer
            {
                Id = 1,
                Name = "Anna",
                YearsOfExperience = 5,
                IsActive = true,
                Country = "Austria"
            },
            new Developer
            {
                Id = 2,
                Name = "Maria",
                YearsOfExperience = 2,
                IsActive = true,
                Country = "Spain"
            },
            new Developer
            {
                Id = 3,
                Name = "John",
                YearsOfExperience = 8,
                IsActive = false,
                Country = "Germany"
            },
            new Developer
            {
                Id = 4,
                Name = "Peter",
                YearsOfExperience = 10,
                IsActive = true,
                Country = "Austria"
            },
            new Developer
            {
                Id = 5,
                Name = "Laura",
                YearsOfExperience = 1,
                IsActive = true,
                Country = "Spain"
            }
        };

        var activos = developers
            .Where(x => x.IsActive)
            .Select(x => new UserDto
            {
                Name = x.Name
            })
            .ToList();

        foreach (var item in activos)
        {
            Console.WriteLine(item.Name);
        }

        Console.WriteLine("*****");

        var experimentados = developers
            .Where(x => x.YearsOfExperience > 3)
            .Select(x => new UserDto
            {
                Name = x.Name
            })
            .ToList();

        foreach (var item in experimentados)
        {
            Console.WriteLine(item.Name);
        }

        Console.WriteLine("*****");

        var orderDes = developers
            .Where(x => x.IsActive)
            .OrderByDescending(x => x.YearsOfExperience)
            .Select(x => new UserDto
            {
                Name = x.Name
            })
            .ToList();

        foreach (var item in orderDes)
        {
            Console.WriteLine(item.Name);
        }

        Console.WriteLine("*****");

        var devsCountry = developers
            .Where(x => x.Country == "Austria")
            .Select(x => new UserDto
            {
                Name = x.Name
            })
            .ToList();

        foreach (var item in devsCountry)
        {
            Console.WriteLine(item.Name);
        }

        Console.WriteLine("*****");

        var devsAustria = developers
            .Where(x => x.Country == "Austria")
            .Select(x => new UserDto
            {
                Name = x.Name
            })
            .ToList();

        var hasMoreThanOne = devsAustria.Count > 1;

        Console.WriteLine(hasMoreThanOne);

        Console.WriteLine("*****");

        var devFirst = developers.FirstOrDefault(x => x.Id == 3);

        if (devFirst != null)
        {
            Console.WriteLine(devFirst.Name);
        }

        Console.WriteLine("************************************");

        var projects = new List<Project>
        {
            new Project
            {
                Id = 1,
                Name = "E-Commerce",
                IsActive = true,
                Country = "Austria",
                NumberOfDevelopers = 5
            },
            new Project
            {
                Id = 2,
                Name = "Banking",
                IsActive = true,
                Country = "Germany",
                NumberOfDevelopers = 12
            },
            new Project
            {
                Id = 3,
                Name = "Legacy App",
                IsActive = false,
                Country = "Austria",
                NumberOfDevelopers = 3
            },
            new Project
            {
                Id = 4,
                Name = "Mobile App",
                IsActive = true,
                Country = "Spain",
                NumberOfDevelopers = 8
            }
        };

        var projectsAustria = projects
            .Where(x =>
                x.IsActive &&
                x.Country == "Austria" &&
                x.NumberOfDevelopers >= 5)
            .OrderByDescending(x => x.NumberOfDevelopers)
            .Select(x => new ProjectDto
            {
                Name = x.Name,
                NumberOfDevelopers = x.NumberOfDevelopers
            });

        foreach (var item in projectsAustria)
        {
            Console.WriteLine(item.Name);
        }
    }
}