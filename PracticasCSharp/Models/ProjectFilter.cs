namespace PracticasCSharp.Models;
public class ProjectFilter
{
    public bool? IsActive { get; set; }
    public string? Country { get; set; }
    public string? Name { get; set; }
    public int? MinimumDevelopers { get; set; }

    public int Page { get; set; }
    public int PageSize { get; set; }
}