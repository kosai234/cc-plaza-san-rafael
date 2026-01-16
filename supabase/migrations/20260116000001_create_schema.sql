-- =====================================================
-- PLAZA SAN RAFAEL - ESQUEMA DE BASE DE DATOS
-- =====================================================
-- Ejecutar este script en el SQL Editor de Supabase
-- Dashboard > SQL Editor > New Query > Pegar y ejecutar
-- =====================================================

-- 1. TABLA: categorias
-- Categorías de negocios (Restaurantes, Salud, Tiendas, etc.)
CREATE TABLE IF NOT EXISTS categorias (
    id TEXT PRIMARY KEY,
    nombre TEXT NOT NULL,
    icono TEXT NOT NULL DEFAULT 'store',
    color TEXT NOT NULL DEFAULT 'primary',
    orden INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. TABLA: negocios
-- Información de cada negocio/local del centro comercial
CREATE TABLE IF NOT EXISTS negocios (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    categoria_id TEXT REFERENCES categorias(id),
    descripcion TEXT,
    imagen TEXT,
    local TEXT,
    nivel TEXT,
    telefono TEXT,
    whatsapp TEXT,
    email TEXT,
    web TEXT,
    horario TEXT,
    rating DECIMAL(2,1) DEFAULT 0,
    es_top BOOLEAN DEFAULT FALSE,
    es_patrocinado BOOLEAN DEFAULT FALSE,
    servicios TEXT[] DEFAULT '{}',
    redes_sociales JSONB DEFAULT '{}',
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. TABLA: eventos
-- Eventos del centro comercial
CREATE TABLE IF NOT EXISTS eventos (
    id SERIAL PRIMARY KEY,
    titulo TEXT NOT NULL,
    descripcion TEXT,
    fecha DATE NOT NULL,
    hora TIME,
    ubicacion TEXT,
    imagen TEXT,
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. TABLA: promociones
-- Promociones de los negocios
CREATE TABLE IF NOT EXISTS promociones (
    id SERIAL PRIMARY KEY,
    titulo TEXT NOT NULL,
    descripcion TEXT,
    negocio_id INT REFERENCES negocios(id) ON DELETE SET NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    imagen TEXT,
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 5. TABLA: noticias
-- Noticias del centro comercial
CREATE TABLE IF NOT EXISTS noticias (
    id SERIAL PRIMARY KEY,
    titulo TEXT NOT NULL,
    resumen TEXT,
    contenido TEXT,
    fecha DATE DEFAULT CURRENT_DATE,
    imagen TEXT,
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 6. TABLA: configuracion
-- Información general del centro comercial
CREATE TABLE IF NOT EXISTS configuracion (
    id SERIAL PRIMARY KEY,
    clave TEXT UNIQUE NOT NULL,
    valor JSONB NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- ÍNDICES PARA MEJOR RENDIMIENTO
-- =====================================================

CREATE INDEX IF NOT EXISTS idx_negocios_categoria ON negocios(categoria_id);
CREATE INDEX IF NOT EXISTS idx_negocios_patrocinado ON negocios(es_patrocinado) WHERE es_patrocinado = TRUE;
CREATE INDEX IF NOT EXISTS idx_negocios_top ON negocios(es_top) WHERE es_top = TRUE;
CREATE INDEX IF NOT EXISTS idx_negocios_activo ON negocios(activo) WHERE activo = TRUE;
CREATE INDEX IF NOT EXISTS idx_eventos_fecha ON eventos(fecha);
CREATE INDEX IF NOT EXISTS idx_promociones_fechas ON promociones(fecha_inicio, fecha_fin);
CREATE INDEX IF NOT EXISTS idx_noticias_fecha ON noticias(fecha DESC);

-- =====================================================
-- FUNCIÓN PARA ACTUALIZAR updated_at AUTOMÁTICAMENTE
-- =====================================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para negocios
DROP TRIGGER IF EXISTS update_negocios_updated_at ON negocios;
CREATE TRIGGER update_negocios_updated_at
    BEFORE UPDATE ON negocios
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- HABILITAR ROW LEVEL SECURITY (RLS)
-- =====================================================

ALTER TABLE categorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE negocios ENABLE ROW LEVEL SECURITY;
ALTER TABLE eventos ENABLE ROW LEVEL SECURITY;
ALTER TABLE promociones ENABLE ROW LEVEL SECURITY;
ALTER TABLE noticias ENABLE ROW LEVEL SECURITY;
ALTER TABLE configuracion ENABLE ROW LEVEL SECURITY;

-- =====================================================
-- POLÍTICAS RLS - LECTURA PÚBLICA (anon)
-- Cualquier visitante puede leer los datos
-- =====================================================

-- Categorías: lectura pública
CREATE POLICY "Categorias son publicas" ON categorias
    FOR SELECT TO anon, authenticated
    USING (true);

-- Negocios: lectura pública solo activos
CREATE POLICY "Negocios activos son publicos" ON negocios
    FOR SELECT TO anon, authenticated
    USING (activo = true);

-- Eventos: lectura pública solo activos
CREATE POLICY "Eventos activos son publicos" ON eventos
    FOR SELECT TO anon, authenticated
    USING (activo = true);

-- Promociones: lectura pública solo activas y vigentes
CREATE POLICY "Promociones activas son publicas" ON promociones
    FOR SELECT TO anon, authenticated
    USING (activo = true AND (fecha_fin IS NULL OR fecha_fin >= CURRENT_DATE));

-- Noticias: lectura pública solo activas
CREATE POLICY "Noticias activas son publicas" ON noticias
    FOR SELECT TO anon, authenticated
    USING (activo = true);

-- Configuración: lectura pública
CREATE POLICY "Configuracion es publica" ON configuracion
    FOR SELECT TO anon, authenticated
    USING (true);

-- =====================================================
-- MENSAJE DE ÉXITO
-- =====================================================
SELECT 'Esquema creado exitosamente!' as mensaje;
