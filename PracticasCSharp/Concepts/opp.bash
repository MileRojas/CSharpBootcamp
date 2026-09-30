OOP + SOLID

## 🧠 OOP — Conceptos fundamentales

### 1. Encapsulation — Encapsulación

**Idea:** una clase debe controlar cómo se modifica su propio estado.

❌ Demasiado abierto:

```csharp
public class Project
{
    public int NumberOfDevelopers { get; set; }
}
```

Cualquier parte del código puede hacer:

```csharp
project.NumberOfDevelopers = -100;
```

✅ Mejor:

```csharp
public class Project
{
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
```

Ahora `Project` controla cómo cambia su estado.

### Regla mental

> **"El objeto debe proteger sus propias reglas."**

No significa que todas las propiedades tengan que tener `private set`.

Un DTO, por ejemplo, puede tener:

```csharp
public class ProjectDto
{
    public string Name { get; init; }
}
```

`init` permite establecer el valor al crear el objeto, 
pero evita modificarlo posteriormente.

---

# 2. Abstraction — Abstracción

**Idea:** trabajar con lo que algo hace sin depender de cómo lo hace internamente.

Ejemplo:

```csharp
public interface IEmailService
{
    void Send(string email, string message);
}
```

El consumidor necesita saber:

```text
"Existe un servicio que puede enviar emails."
```

No necesita saber si internamente utiliza:

* SendGrid
* SMTP
* Amazon SES
* otro proveedor

Por eso:

```csharp
public class ProjectService
{
    private readonly IEmailService _emailService;

    public ProjectService(IEmailService emailService)
    {
        _emailService = emailService;
    }

    public void CreateProject()
    {
        _emailService.Send(
            "user@email.com",
            "Proyecto creado"
        );
    }
}
```

`ProjectService` depende de:

```text
IEmailService
```

y no de:

```text
SendGridEmailService
```

### Regla mental

> **"Me importa qué hace, no cómo lo hace."**

---