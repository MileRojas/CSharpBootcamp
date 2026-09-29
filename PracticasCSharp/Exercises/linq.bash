1. Clase es donde abarcaria lo que necesito para la funcionalidad de mi proyecto, y una interfaz para poder utilizar variables que necesite usar en otra clase.
2. IEnumerable es una interfaz que me convierte mis variables de tipo string a numerable, y IQueryable no lo use pero supongo que tiene que ver algo con queries 
3. async y await, trabajan juntos, necesito que mi clase sea asincrona y lo que retorna debera ser await 
4. Dependency Injection... no lo sé

5. Código:
    var result = users
    .Where(x => x.IsActive)
    .OrderBy(x => x.Age and x => x.Age > 18)
    .Select(x => new UserDto
    {
        Name = x.FirstName
    })
    .ToList();
6. Código:
var result = users
    .Where(x => !x.IsActive)
    .OrderBy(x => x.Age)
    .Select(x => new UserDto
    {
        Name = x.FirstName
    })
    .ToList();
7. Utilizaria un try catch 

8. Controller es el responsable de controlar que lo que se devuelve, inserta, modifica, desde el frontend hacia la base de datos o al lugar donde se tengan los datos 

9. Para tener una estructura y poder mantener de una mejor manera nuestro backend, y que mi controller no tenga acceso directo a la base de datos

10. son diferentes que te da http, dependiento del error puede ser por conexion, o que la base de datos no se encuentre, o que la url este incorrecta o no exista, etc

11. porque el componente puede tener distintas funciones dependiendo el caso, y solo es como una base que se reutilizara en el proyecto 

12. observable es esa varible que todo el tiempo va estar siendo observada, y obtiene los cambios sin necesidad de otra accion, porque esta siendo observada 

13. no lo se 

Parte 5 — Situación real
 crearia un controller GET, donde pueda recibir el parametro de busqueda, (el nombre del proyecto), que éste se pueda conectar al servicio para que se pueda hacer la consulta a la base de datos,
  y que luego  me devuelva la lista de proyectos segun el nombre indicado, luego crearia el frontend, supongo que sera una lista con un buscador para poder ingresar el nombre del proyecto, 
  y cuando la lista me devuelva sin datos, mostrar un mensaje que no encontro ningun resultado 

14. [x] C# básico
    [x] LINQ
    [ ] async/await
    [ ] OOP
    [ ] SOLID
    [x] Dependency Injection
    [x] ASP.NET Core
    [x] Entity Framework
    [ ] SQL
    [ ] APIs / REST
    [x] Authentication
    [ ] Angular básico
    [ ] TypeScript
    [x] RxJS
    [ ] Signals
    [ ] Forms
    [x] Routing
    [ ] Testing
    [ ] Git
    [x] Arquitectura
    [ ] Debugging
    [ ] No sé por dónde empezar 😅



