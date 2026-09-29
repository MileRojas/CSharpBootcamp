/* 
1A. 
     var activos = developers
            .Where(x => x.IsActive)
            .Select(x => new UserDto
            {
                Name = x.Name
            })
            .ToList();
1B. 
var experimentados = developers
            .Where(x => x.YearsOfExperience > 3)
            .Select(x => new UserDto
            {
                Name = x.Name
            })
            .ToList();
1C.
var orderDes = developers
            .Where(x => x.IsActive)
            .OrderByDescending(x => x.YearsOfExperience)
            .Select(x => new UserDto
            {
                Name = x.Name
            })
            .ToList();
1D. 
var devscountry = developers
            .Where(x => x.Country == "Austria")
            .Select(x => new UserDto
            {
                Name = x.Name
            })
            .ToList();
1E.
 var devsexperience = developers
            .Where(x => x.Country == "Austria")
            .Select(x => new UserDto
            {
                Name = x.Name
            })
            .ToList();
1F. 
var YearsOfExperience = devsexperience.Count > 1;
1G.  var devsFirst = developers.FirstOrDefault(x => x.Id ==3);
2A. Where(x => x.IsActive)
2B. .Select(x => new UserDto
        {
            Name = x.Name
        })
2C. FirstOrDefault
2D. FirstOrDefault
2E. OrderBy(x => x.Apeññido)
2F. Where(x => x.IsActive)
3A. no es = debe ser ==
3B. OrderBy(x => x.YearsOfExperience > 5) no esta correcto hacer > 5, eso debe ir en Where 
3C. .Select(x => x.Name) va al final
3D. Opcion B porque crea hace directamente la query a la BD y no me obtiene toda la lista desde el principio 
****************************

1. var devsaustria = projects
    .Where(x => x.IsActive & x.Country == "Austria" & x.NumberOfDevelopers >= 5)
    .OrderByDescending(x => x.NumberOfDevelopers)
    .Select(x => new ProjectsDto
            {
                Name = x.Name,
                NumberOfDevelopers = x.NumberOfDevelopers 
            });

2. En SQL server, para ahorrar memoria 

******************************************
1. porque ahora ProjectService recibe el repositorio especifico y no necesita crearlo 
2. si necesito hacer cambios en ProjectService no dependo de lo que ProjectRepository haga 
3. sí, porque no son dependientes del otro
**********************************************
        DIA 2
*****************************************************
a. Task<IEnumerable<Project>> 
B. Task<int>
c. int
*/