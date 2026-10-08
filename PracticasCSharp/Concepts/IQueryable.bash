IQueryable nos permite construir la consulta paso a paso sin ejecutarla todavía.

Por ejemplo:

´´´Csharp

var query = _context.Projects.AsQueryable();

if (filter.IsActive.HasValue)
{
    query = query.Where(x => x.IsActive == filter.IsActive.Value);
}

if (!string.IsNullOrEmpty(filter.Country))
{
    query = query.Where(x => x.Country == filter.Country);
}

query = query
    .OrderByDescending(x => x.NumberOfDevelopers)
    .Skip((filter.Page - 1) * filter.PageSize)
    .Take(filter.PageSize);

return await query.ToListAsync();



Conceptualmente:


AsQueryable()
     ↓
WHERE IsActive
     ↓
WHERE Country
     ↓
ORDER BY
     ↓
SKIP
     ↓
TAKE
     ↓
ToListAsync()
     ↓
🚀 AQUÍ se ejecuta

Una precisión importante

IQueryable no significa mágicamente "no ejecutar nunca". 
La consulta se ejecuta cuando llegamos a una operación que necesita materializar/obtener los resultados,
como:

ToListAsync()
FirstOrDefaultAsync()
CountAsync()
AnyAsync()