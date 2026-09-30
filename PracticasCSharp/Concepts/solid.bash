# 🔷 SOLID

SOLID son cinco principios que ayudan a diseñar código más mantenible y flexible.

---

# S — Single Responsibility Principle

## Single Responsibility

Una clase debería tener **una responsabilidad principal / un motivo principal para cambiar**.

❌ Demasiadas responsabilidades:

```csharp
public class UserService
{
    public void CreateUser() { }

    public void SendWelcomeEmail() { }

    public void GenerateUserPdf() { }

    public void SaveAuditLog() { }
}
```

Aquí tenemos varias responsabilidades:

```text
Crear usuario
Enviar email
Generar PDF
Guardar auditoría
```

Podríamos separarlas:

```text
UserService
EmailService
UserPdfService
AuditService
```

### ⚠️ Importante

SRP NO significa:

> "Una clase solo puede tener un método."

Significa:

> **"Una clase debería tener una responsabilidad coherente."**

### Regla mental

> **"¿Cuántas razones diferentes tendría esta clase para cambiar?"**

Si la respuesta es muchas y no relacionadas, probablemente hay demasiadas responsabilidades.

---

# O — Open/Closed Principle

## Open for extension, closed for modification

El código debería poder **extenderse sin tener que modificar constantemente código existente**.

❌ Ejemplo:

```csharp
public class DiscountService
{
    public decimal CalculateDiscount(
        string customerType,
        decimal price)
    {
        if (customerType == "Regular")
            return price * 0.05m;

        if (customerType == "Premium")
            return price * 0.15m;

        return 0;
    }
}
```

Si mañana aparece:

```text
VIP
Employee
Partner
Student
Black Friday
```

tenemos que seguir modificando `DiscountService`.

Eso puede terminar convirtiéndolo en un enorme `if/else`.

---

### ✅ Podemos extender mediante abstracciones

```csharp
public interface IDiscount
{
    decimal Calculate(decimal price);
}
```

Implementaciones:

```csharp
public class RegularDiscount : IDiscount
{
    public decimal Calculate(decimal price)
        => price * 0.05m;
}
```

```csharp
public class PremiumDiscount : IDiscount
{
    public decimal Calculate(decimal price)
        => price * 0.15m;
}
```

```csharp
public class VipDiscount : IDiscount
{
    public decimal Calculate(decimal price)
        => price * 0.30m;
}
```

El consumidor trabaja con:

```csharp
IDiscount
```

y no necesita conocer la implementación concreta.

### Regla mental

> **"Si añadir un nuevo caso me obliga a modificar una clase que ya funciona,
 quizá necesito una abstracción."**

⚠️ No significa que haya que crear interfaces para absolutamente todo.

---

# L — Liskov Substitution Principle

## Principio de sustitución de Liskov

Si una clase implementa una abstracción, debería poder utilizarse donde esa abstracción
 se espera **sin romper el comportamiento esperado**.

Ejemplo:

```csharp
public interface IDiscount
{
    decimal Calculate(decimal price);
}
```

Tenemos:

```csharp
public class PremiumDiscount : IDiscount
{
    public decimal Calculate(decimal price)
    {
        return price * 0.15m;
    }
}
```

Perfectamente válido.

Pero:

```csharp
public class NoDiscount : IDiscount
{
    public decimal Calculate(decimal price)
    {
        throw new NotImplementedException();
    }
}
```

Esto es problemático.

¿Por qué?

Porque el consumidor espera:

```csharp
IDiscount discount
```

y espera que:

```csharp
discount.Calculate(price)
```

devuelva un `decimal`.

Pero una implementación rompe esa expectativa lanzando una excepción.

### Regla mental

> **"Si implemento una abstracción, debo poder comportarme como esa abstracción espera."**

No basta con que el código compile.

También importa el **comportamiento**.

---

# I — Interface Segregation Principle

## Interface Segregation

Los consumidores no deberían verse obligados a depender de métodos que no necesitan.

❌ Interface demasiado grande:

```csharp
public interface IUserService
{
    void CreateUser();
    void DeleteUser();
    void SendEmail();
    void GeneratePdf();
    void ExportExcel();
    void GenerateReport();
}
```

Imagina que una clase solo necesita:

```csharp
CreateUser()
```

pero está dependiendo de una interfaz enorme.

Mejor dividir según responsabilidades:

```csharp
public interface IUserCreator
{
    void CreateUser();
}
```

```csharp
public interface IUserDeleter
{
    void DeleteUser();
}
```

```csharp
public interface IUserReporter
{
    void GenerateReport();
}
```

### Regla mental

> **"Una interfaz debería representar un contrato que realmente necesito."**

O dicho de otra manera:

> **"No obligues a una clase a depender de cosas que no utiliza."**

---

# D — Dependency Inversion Principle

## Dependency Inversion

Las clases de alto nivel no deberían depender directamente de implementaciones concretas.

Deberían depender de **abstracciones**.

❌ Acoplamiento:

```csharp
public class ProjectService
{
    private readonly ProjectRepository _repository;

    public ProjectService()
    {
        _repository = new ProjectRepository();
    }
}
```

`ProjectService` conoce y crea directamente:

```text
ProjectRepository
```

Está muy acoplado.

---

### ✅ Dependencia de una abstracción

```csharp
public interface IProjectRepository
{
    Task<IEnumerable<Project>> GetProjectsAsync();
}
```

```csharp
public class ProjectService
{
    private readonly IProjectRepository _repository;

    public ProjectService(IProjectRepository repository)
    {
        _repository = repository;
    }
}
```

Ahora:

```text
ProjectService
      ↓
IProjectRepository
      ↑
ProjectRepository
```

La implementación concreta se proporciona desde fuera mediante **Dependency Injection**.

### Regla mental

> **"Depende de lo que necesitas, no de cómo está implementado."**

---

# 🔗 SOLID + DI + Abstracción juntos

Estos conceptos no viven aislados.

Por ejemplo:

```csharp
public interface IProjectRepository
{
    Task<IEnumerable<Project>> GetProjectsAsync();
}
```

```csharp
public class ProjectRepository : IProjectRepository
{
    public async Task<IEnumerable<Project>> GetProjectsAsync()
    {
        // acceso a DB
    }
}
```

```csharp
public class ProjectService
{
    private readonly IProjectRepository _repository;

    public ProjectService(IProjectRepository repository)
    {
        _repository = repository;
    }
}
```

Aquí tenemos:

```text
Abstraction
    ↓
IProjectRepository
    ↓
Dependency Injection
    ↓
ProjectService recibe la dependencia
    ↓
Dependency Inversion
    ↓
ProjectService no conoce ProjectRepository directamente
```

Y potencialmente:

```text
SRP
↓
cada clase tiene una responsabilidad

OCP
↓
podemos cambiar/extender implementaciones

LSP
↓
las implementaciones respetan el contrato

ISP
↓
interfaces pequeñas y específicas

DIP
↓
dependemos de abstracciones
```

---

# 🧠 RESUMEN ULTRARRÁPIDO

| Concepto      | Pregunta que debes hacerte                                                   |
| ------------- | ---------------------------------------------------------------------------- |
| Encapsulation | ¿Quién debería poder modificar este estado?                                  |
| Abstraction   | ¿Necesito saber cómo funciona internamente?                                  |
| SRP           | ¿Cuántas razones tiene esta clase para cambiar?                              |
| OCP           | ¿Añadir un caso nuevo obliga a modificar código existente?                   |
| LSP           | ¿Esta implementación realmente se comporta como promete la abstracción?      |
| ISP           | ¿Estoy obligando a alguien a depender de métodos que no necesita?            |
| DIP           | ¿Estoy dependiendo de una implementación concreta en vez de una abstracción? |

---

# 🎯 Chuleta mental para el futuro

Cuando estés revisando una clase, piensa:

```text
1. ¿Puede cualquiera modificar mi estado?
        ↓
   Encapsulation

2. ¿Estoy dependiendo de detalles concretos?
        ↓
   Abstraction / DIP

3. ¿Esta clase hace demasiadas cosas?
        ↓
   SRP

4. ¿Cada nuevo caso me obliga a tocar esta clase?
        ↓
   OCP

5. ¿Una implementación puede romper las expectativas
   del contrato?
        ↓
   LSP

6. ¿Mi interfaz tiene métodos que algunos consumidores
   no necesitan?
        ↓
   ISP
```

## ⚠️ Y la regla más importante

SOLID **no significa**:

```text
Interface para todo
Clase para todo
Repository para todo
Service para todo
Factory para todo
```

SOLID es una herramienta para tomar decisiones.

La pregunta no es:

> "¿Cómo meto SOLID aquí?"

Sino:

> **"¿Qué problema de diseño tengo y qué principio me ayuda a resolverlo?"**
