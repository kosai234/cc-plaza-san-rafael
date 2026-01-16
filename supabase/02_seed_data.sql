-- =====================================================
-- PLAZA SAN RAFAEL - DATOS INICIALES (SEED)
-- =====================================================
-- Ejecutar DESPUÉS de 01_schema.sql
-- =====================================================

-- =====================================================
-- 1. INSERTAR CATEGORÍAS
-- =====================================================

INSERT INTO categorias (id, nombre, icono, color, orden) VALUES
    ('restaurantes', 'Restaurantes', 'restaurant', 'secondary', 1),
    ('salud', 'Salud', 'local_hospital', 'accent', 2),
    ('tiendas', 'Tiendas', 'shopping_bag', 'primary', 3),
    ('cafeterias', 'Cafeterías', 'local_cafe', 'secondary', 4),
    ('mascotas', 'Mascotas', 'pets', 'brandBlue', 5),
    ('belleza', 'Belleza', 'spa', 'primary', 6),
    ('servicios', 'Servicios', 'account_balance', 'brandBlue', 7),
    ('tecnologia', 'Tecnología', 'devices', 'accent', 8)
ON CONFLICT (id) DO UPDATE SET
    nombre = EXCLUDED.nombre,
    icono = EXCLUDED.icono,
    color = EXCLUDED.color,
    orden = EXCLUDED.orden;

-- =====================================================
-- 2. INSERTAR NEGOCIOS
-- =====================================================

INSERT INTO negocios (nombre, categoria_id, descripcion, imagen, local, nivel, telefono, whatsapp, email, web, horario, rating, es_top, es_patrocinado, servicios, redes_sociales) VALUES
(
    'Apomedix',
    'salud',
    'Clínica y farmacia en un mismo lugar. Atención médica de calidad para todas las edades.',
    'assets/images/negocios/apomedix.png',
    'Local 15',
    'Nivel 1',
    '+502 3005-0800',
    '+502 3005-0800',
    'info@apomedix.com.gt',
    'https://apomedix.com.gt',
    'Lunes a Sábado: 8:00 - 20:00 | Domingo: 9:00 - 14:00',
    4.9,
    TRUE,
    TRUE,
    ARRAY['Consulta médica Q40', 'Farmacia', 'Laboratorio clínico'],
    '{"facebook": "https://facebook.com/apomedix", "instagram": "https://instagram.com/apomedix"}'::jsonb
),
(
    'Taco Bell',
    'restaurantes',
    'Deliciosa comida mexicana rápida. Nuevas Carnitas disponibles por tiempo limitado.',
    'assets/images/negocios/tacobell.png',
    'Local 25',
    'Food Court - Nivel 2',
    '+502 2389-4500',
    '+502 5555-1234',
    'contacto@tacobell.com.gt',
    'https://tacobell.com.gt',
    'Lunes a Domingo: 10:00 - 21:00',
    4.7,
    TRUE,
    TRUE,
    ARRAY['Para llevar', 'Delivery', 'Comer en local'],
    '{"facebook": "https://facebook.com/tacobellgt", "instagram": "https://instagram.com/tacobellgt"}'::jsonb
),
(
    'Veterinaria Marveliz',
    'mascotas',
    'Clínica veterinaria, estética animal y pet shop. Cuidamos la salud y bienestar de tu mascota.',
    'assets/images/negocios/veterinaria-marveliz.png',
    'Local 39',
    'Nivel 1',
    '+502 5737-5151',
    '+502 5737-5151',
    'marveliz.vet@gmail.com',
    NULL,
    'Lunes a Sábado: 9:00 - 18:00',
    4.8,
    FALSE,
    FALSE,
    ARRAY['Clínica veterinaria', 'Estética animal', 'Pet shop'],
    '{"facebook": "https://facebook.com/veterinariamarveliz", "instagram": "https://instagram.com/veterinariamarveliz"}'::jsonb
),
(
    'Café El Refugio',
    'cafeterias',
    'El mejor café artesanal de Guatemala. Granos de origen con el sabor de nuestras tierras.',
    'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=800',
    'Local 8',
    'Nivel 1',
    '+502 4521-8890',
    '+502 4521-8890',
    'hola@cafeelrefugio.gt',
    'https://cafeelrefugio.gt',
    'Lunes a Domingo: 7:00 - 20:00',
    4.9,
    FALSE,
    FALSE,
    ARRAY['Café para llevar', 'Postres artesanales', 'WiFi gratis'],
    '{"facebook": "https://facebook.com/cafeelrefugio", "instagram": "https://instagram.com/cafeelrefugio"}'::jsonb
),
(
    'Óptica Visión Plus',
    'salud',
    'Exámenes de la vista, lentes de contacto y monturas de las mejores marcas.',
    'https://images.unsplash.com/photo-1574258495973-f010dfbb5371?w=800',
    'Local 12',
    'Nivel 1',
    '+502 2301-4455',
    '+502 3012-9988',
    'citas@visionplus.gt',
    'https://visionplus.com.gt',
    'Lunes a Sábado: 9:00 - 19:00',
    4.6,
    FALSE,
    FALSE,
    ARRAY['Examen de la vista', 'Lentes de contacto', 'Reparaciones'],
    '{"facebook": "https://facebook.com/visionplusgt", "instagram": "https://instagram.com/visionplusgt"}'::jsonb
),
(
    'Deportes Total',
    'tiendas',
    'Todo en artículos deportivos, calzado y ropa de las mejores marcas.',
    'https://images.unsplash.com/photo-1556906781-9a412961c28c?w=800',
    'Local 33-34',
    'Nivel 2',
    '+502 2456-7890',
    '+502 5678-1234',
    'ventas@deportestotal.gt',
    'https://deportestotal.com.gt',
    'Lunes a Domingo: 10:00 - 20:00',
    4.5,
    TRUE,
    FALSE,
    ARRAY['Calzado deportivo', 'Ropa fitness', 'Accesorios'],
    '{"facebook": "https://facebook.com/deportestotalgt", "instagram": "https://instagram.com/deportestotalgt"}'::jsonb
),
(
    'Salón Belleza Divina',
    'belleza',
    'Servicios de peluquería, manicure, pedicure y tratamientos faciales.',
    'https://images.unsplash.com/photo-1560066984-138dadb4c035?w=800',
    'Local 18',
    'Nivel 2',
    '+502 4123-5566',
    '+502 4123-5566',
    'citas@bellezadivina.gt',
    NULL,
    'Martes a Sábado: 9:00 - 19:00',
    4.8,
    FALSE,
    FALSE,
    ARRAY['Cortes de cabello', 'Manicure y pedicure', 'Tratamientos faciales'],
    '{"facebook": "https://facebook.com/bellezadivinagt", "instagram": "https://instagram.com/bellezadivinagt"}'::jsonb
),
(
    'Banco Industrial',
    'servicios',
    'Agencia bancaria con todos los servicios financieros que necesitas.',
    'https://images.unsplash.com/photo-1541354329998-f4d9a9f9297f?w=800',
    'Local 1-2',
    'Nivel 1',
    '+502 2338-6868',
    NULL,
    NULL,
    'https://bi.com.gt',
    'Lunes a Viernes: 9:00 - 17:00 | Sábado: 9:00 - 13:00',
    4.2,
    FALSE,
    FALSE,
    ARRAY['Cuentas bancarias', 'Préstamos', 'Cajeros automáticos'],
    '{"facebook": "https://facebook.com/bancoindustrial", "instagram": "https://instagram.com/bancoindustrial"}'::jsonb
),
(
    'Pollo Campero',
    'restaurantes',
    'El sabor de Guatemala. Pollo frito, campechano y mucho más.',
    'https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?w=800',
    'Local 22',
    'Food Court - Nivel 2',
    '+502 2500-2500',
    '+502 5500-2500',
    'servicio@campero.com.gt',
    'https://campero.com',
    'Lunes a Domingo: 10:00 - 21:00',
    4.6,
    FALSE,
    FALSE,
    ARRAY['Para llevar', 'Delivery', 'Comer en local'],
    '{"facebook": "https://facebook.com/pollocampero", "instagram": "https://instagram.com/pollocampero"}'::jsonb
),
(
    'TechZone',
    'tecnologia',
    'Celulares, accesorios, computadoras y todo en tecnología.',
    'https://images.unsplash.com/photo-1531297484001-80022131f5a1?w=800',
    'Local 28',
    'Nivel 2',
    '+502 2478-9012',
    '+502 4012-3456',
    'ventas@techzone.gt',
    'https://techzone.com.gt',
    'Lunes a Domingo: 10:00 - 20:00',
    4.4,
    FALSE,
    TRUE,
    ARRAY['Venta de celulares', 'Reparaciones', 'Accesorios'],
    '{"facebook": "https://facebook.com/techzonegt", "instagram": "https://instagram.com/techzonegt"}'::jsonb
);

-- =====================================================
-- 3. INSERTAR EVENTOS
-- =====================================================

INSERT INTO eventos (titulo, descripcion, fecha, hora, ubicacion, imagen) VALUES
(
    'Inauguración Zona de Juegos',
    'Nueva área de entretenimiento para toda la familia con juegos interactivos.',
    '2026-02-15',
    '10:00',
    'Nivel 3',
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800'
),
(
    'Concierto de San Valentín',
    'Música en vivo con artistas locales para celebrar el amor.',
    '2026-02-14',
    '18:00',
    'Plaza Central',
    'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800'
),
(
    'Feria de Emprendedores',
    'Apoya el talento local. Más de 50 emprendedores guatemaltecos.',
    '2026-02-22',
    '09:00',
    'Pasillo Principal',
    'https://images.unsplash.com/photo-1556761175-b413da4baf72?w=800'
);

-- =====================================================
-- 4. INSERTAR PROMOCIONES
-- =====================================================

INSERT INTO promociones (titulo, descripcion, negocio_id, fecha_inicio, fecha_fin, imagen) VALUES
(
    '2x1 en Café El Refugio',
    'Todos los miércoles, lleva 2 cafés por el precio de 1.',
    4,
    '2026-01-01',
    '2026-03-31',
    'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800'
),
(
    'Consulta Médica a Q40',
    'Atención médica de calidad al mejor precio en Apomedix.',
    1,
    '2026-01-01',
    '2026-12-31',
    'assets/images/negocios/apomedix.png'
),
(
    'Nuevas Carnitas',
    'Por tiempo limitado, prueba las nuevas Carnitas en Taco Bell.',
    2,
    '2026-01-15',
    '2026-02-28',
    'assets/images/negocios/tacobell.png'
);

-- =====================================================
-- 5. INSERTAR NOTICIAS
-- =====================================================

INSERT INTO noticias (titulo, resumen, contenido, fecha, imagen) VALUES
(
    'Plaza San Rafael amplía horarios',
    'A partir de febrero, el centro comercial extenderá su horario hasta las 22:00 hrs.',
    'Pensando en la comodidad de nuestros visitantes, Plaza San Rafael ha decidido ampliar su horario de atención. A partir del 1 de febrero de 2026, nuestras puertas estarán abiertas de 10:00 a 22:00 hrs de lunes a domingo. Esta decisión se tomó en respuesta a las solicitudes de nuestros clientes que desean más tiempo para disfrutar de sus tiendas y restaurantes favoritos.',
    '2026-01-10',
    'https://images.unsplash.com/photo-1519567241046-7f570eee3ce6?w=800'
),
(
    'Nuevo estacionamiento techado',
    'Inauguramos 200 espacios adicionales de estacionamiento con techo.',
    'Para mejorar la experiencia de nuestros clientes, hemos inaugurado una nueva área de estacionamiento techado con 200 espacios adicionales. Esta nueva área cuenta con iluminación LED, cámaras de seguridad y señalización clara. El estacionamiento sigue siendo completamente gratuito para todos nuestros visitantes.',
    '2026-01-05',
    'https://images.unsplash.com/photo-1506521781263-d8422e82f27a?w=800'
);

-- =====================================================
-- 6. INSERTAR CONFIGURACIÓN DEL CENTRO COMERCIAL
-- =====================================================

INSERT INTO configuracion (clave, valor) VALUES
(
    'info_general',
    '{
        "nombre": "Plaza San Rafael",
        "direccion": "Km 7.5 Carretera al Atlántico, Zona 18, Ciudad de Guatemala",
        "telefono": "+502 2505-8000",
        "email": "info@plazasanrafael.com.gt",
        "web": "https://plazasanrafael.com.gt",
        "horario": "Lunes a Domingo: 10:00 - 21:00",
        "redes_sociales": {
            "facebook": "https://facebook.com/plazasanrafael",
            "instagram": "https://instagram.com/plazasanrafael",
            "tiktok": "https://tiktok.com/@plazasanrafael"
        },
        "servicios": [
            "Estacionamiento gratuito",
            "WiFi gratis",
            "Seguridad 24/7",
            "Cajeros automáticos",
            "Área de lactancia",
            "Sillas de ruedas disponibles"
        ]
    }'::jsonb
)
ON CONFLICT (clave) DO UPDATE SET
    valor = EXCLUDED.valor,
    updated_at = NOW();

-- =====================================================
-- VERIFICACIÓN
-- =====================================================

SELECT 'Datos insertados correctamente!' as mensaje;
SELECT 'Categorías: ' || COUNT(*) FROM categorias;
SELECT 'Negocios: ' || COUNT(*) FROM negocios;
SELECT 'Eventos: ' || COUNT(*) FROM eventos;
SELECT 'Promociones: ' || COUNT(*) FROM promociones;
SELECT 'Noticias: ' || COUNT(*) FROM noticias;
