namespace PracticasCSharp.Models;
public class Project
{
    public int Id { get; private set; }
    public string Name { get; private set; }
    public bool IsActive { get; private  set; }
    public string Country { get; private set; }
    public int NumberOfDevelopers { get; private set; }

    public void AddDeveloper()
    {
        NumberOfDevelopers++;
    }

    public void RemoveDeveloper()
    {
        if (NumberOfDevelopers > 0)
        {
            NumberOfDevelopers--;
        }
    }

}