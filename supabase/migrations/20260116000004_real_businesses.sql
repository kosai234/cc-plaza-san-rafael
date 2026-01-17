-- =====================================================
-- NEGOCIOS REALES DE PLAZA SAN RAFAEL
-- =====================================================

-- =====================================================
-- AGREGAR NUEVOS NEGOCIOS: MAXIDESPENSA Y PATSY
-- =====================================================

INSERT INTO negocios (nombre, categoria_id, descripcion, imagen, local, nivel, telefono, whatsapp, email, web, horario, rating, es_top, es_patrocinado, servicios, redes_sociales) VALUES
(
    'Maxidespensa',
    'tiendas',
    'Tu supermercado de confianza con los mejores precios en productos de consumo diario, abarrotes, frutas, verduras y más.',
    'assets/images/negocios/maxidespensa.jpg',
    'Local 50-55',
    'Nivel 1',
    '+502 2222-8888',
    '+502 5222-8888',
    'atencion@maxidespensa.com.gt',
    'https://maxidespensa.com.gt',
    'Lunes a Domingo: 7:00 - 21:00',
    4.6,
    TRUE,
    TRUE,
    ARRAY['Abarrotes', 'Frutas y verduras', 'Carnicería', 'Panadería'],
    '{"facebook": "https://facebook.com/maxidespensa", "instagram": "https://instagram.com/maxidespensa"}'::jsonb
),
(
    'Patsy',
    'restaurantes',
    'Deliciosos pasteles, panes artesanales y cafetería. El sabor tradicional de Guatemala desde 1965.',
    'assets/images/negocios/patsy.jpg',
    'Local 12',
    'Nivel 1',
    '+502 2261-2626',
    '+502 5261-2626',
    'info@patsy.com.gt',
    'https://patsy.com.gt',
    'Lunes a Domingo: 6:00 - 20:00',
    4.8,
    TRUE,
    TRUE,
    ARRAY['Pasteles', 'Panadería', 'Cafetería', 'Desayunos'],
    '{"facebook": "https://facebook.com/patsyguatemala", "instagram": "https://instagram.com/patsyguatemala"}'::jsonb
);

-- =====================================================
-- ACTUALIZAR IMÁGENES DE NEGOCIOS EXISTENTES
-- =====================================================

UPDATE negocios SET
    imagen = 'assets/images/negocios/apomedix.png',
    es_top = TRUE,
    es_patrocinado = TRUE
WHERE nombre = 'Apomedix';

UPDATE negocios SET
    imagen = 'assets/images/negocios/tacobell.png',
    es_top = TRUE,
    es_patrocinado = TRUE
WHERE nombre = 'Taco Bell';

UPDATE negocios SET
    imagen = 'assets/images/negocios/veterinaria-marveliz.png',
    es_top = TRUE,
    es_patrocinado = TRUE
WHERE nombre = 'Veterinaria Marveliz';

UPDATE negocios SET
    imagen = 'assets/images/negocios/elektra.jpg',
    es_top = TRUE,
    es_patrocinado = TRUE
WHERE nombre = 'Elektra';

-- =====================================================
-- CONFIGURAR LOS 6 NEGOCIOS REALES COMO PREFERIDOS
-- =====================================================

-- Resetear otros negocios para que no sean top
UPDATE negocios SET es_top = FALSE, es_patrocinado = FALSE
WHERE nombre NOT IN ('Apomedix', 'Taco Bell', 'Veterinaria Marveliz', 'Elektra', 'Maxidespensa', 'Patsy');

-- =====================================================
-- VERIFICACIÓN
-- =====================================================
SELECT 'Negocios reales actualizados!' as mensaje;
SELECT nombre, imagen, es_top, es_patrocinado FROM negocios WHERE es_top = TRUE;
