using PracticasCSharp.Models;

namespace PracticasCSharp.Data;
public static class FakeProjectData
{
    public static List<Project> Projects => new()
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
}