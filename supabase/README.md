# Configuración de Supabase para Plaza San Rafael

## Paso 1: Crear proyecto en Supabase

1. Ve a [supabase.com](https://supabase.com) y crea una cuenta o inicia sesión
2. Clic en "New Project"
3. Configura:
   - **Name**: `plaza-san-rafael`
   - **Database Password**: (guárdala en un lugar seguro)
   - **Region**: Selecciona la más cercana a Guatemala (ej: `us-east-1`)
4. Clic en "Create new project" y espera a que se cree

## Paso 2: Crear las tablas

1. En el dashboard de Supabase, ve a **SQL Editor** (menú izquierdo)
2. Clic en **New Query**
3. Copia y pega TODO el contenido de `01_schema.sql`
4. Clic en **Run** (o Ctrl+Enter)
5. Deberías ver "Success. No rows returned"

## Paso 3: Insertar datos iniciales

1. Crea otra query nueva
2. Copia y pega TODO el contenido de `02_seed_data.sql`
3. Clic en **Run**
4. Verifica que los datos se insertaron correctamente

## Paso 4: Verificar datos

En el SQL Editor, ejecuta estas consultas para verificar:

```sql
SELECT COUNT(*) as total_categorias FROM categorias;
SELECT COUNT(*) as total_negocios FROM negocios;
SELECT COUNT(*) as total_eventos FROM eventos;
```

Deberías ver:
- 8 categorías
- 10 negocios
- 3 eventos

## Paso 5: Obtener credenciales

1. Ve a **Project Settings** (icono de engranaje)
2. En la sección **API**, encontrarás:
   - **Project URL**: `https://xxxx.supabase.co`
   - **anon public key**: `eyJhbGci...` (clave larga)

## Paso 6: Configurar en el código

Abre `js/app.js` y reemplaza las líneas 7-8:

```javascript
const SUPABASE_URL = 'https://TU_PROYECTO.supabase.co';
const SUPABASE_ANON_KEY = 'tu_anon_key_aqui';
```

Con tus credenciales reales:

```javascript
const SUPABASE_URL = 'https://xxxx.supabase.co';  // Tu URL
const SUPABASE_ANON_KEY = 'eyJhbGci...';          // Tu anon key
```

## Paso 7: Probar

1. Abre la página en un navegador
2. Abre las herramientas de desarrollo (F12)
3. En la consola deberías ver: `Conectado a Supabase`
4. Y los datos deberían cargarse desde la base de datos

---

## Estructura de la Base de Datos

### Tablas principales:

| Tabla | Descripción |
|-------|-------------|
| `categorias` | Categorías de negocios (Restaurantes, Salud, etc.) |
| `negocios` | Información de cada local |
| `eventos` | Eventos del centro comercial |
| `promociones` | Promociones de los negocios |
| `noticias` | Noticias y comunicados |
| `configuracion` | Información general del mall |

### Políticas RLS (Row Level Security):

- **Lectura pública**: Cualquier visitante puede ver los datos
- **Solo activos**: Solo se muestran registros con `activo = true`
- **Promociones vigentes**: Solo promociones dentro de su fecha válida

---

## Comandos útiles SQL

### Ver todos los negocios patrocinados:
```sql
SELECT nombre, categoria_id, es_patrocinado
FROM negocios
WHERE es_patrocinado = true;
```

### Agregar un nuevo negocio:
```sql
INSERT INTO negocios (nombre, categoria_id, descripcion, local, nivel, telefono, rating)
VALUES ('Mi Negocio', 'tiendas', 'Descripción del negocio', 'Local 50', 'Nivel 1', '+502 1234-5678', 4.5);
```

### Activar/Desactivar un negocio:
```sql
UPDATE negocios SET activo = false WHERE id = 1;
```

### Marcar negocio como patrocinado:
```sql
UPDATE negocios SET es_patrocinado = true, es_top = true WHERE id = 1;
```

---

## Notas importantes

1. **La `anon key` es pública** - está diseñada para uso en frontend
2. **RLS protege los datos** - solo se pueden leer, no modificar desde el frontend
3. **Para modificar datos**, usa el dashboard de Supabase o crea un panel admin
4. **Fallback automático** - si Supabase falla, la app usa el JSON local
