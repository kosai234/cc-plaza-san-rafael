-- =====================================================
-- MÁS NEGOCIOS, EVENTOS Y PROMOCIONES
-- =====================================================

-- =====================================================
-- NEGOCIOS ADICIONALES
-- =====================================================

INSERT INTO negocios (nombre, categoria_id, descripcion, imagen, local, nivel, telefono, whatsapp, email, web, horario, rating, es_top, es_patrocinado, servicios, redes_sociales) VALUES
-- Restaurantes
(
    'Pizza Hut',
    'restaurantes',
    'Las mejores pizzas con masa fresca y los mejores ingredientes. Promociones todos los martes.',
    'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=800',
    'Local 26',
    'Food Court - Nivel 2',
    '+502 2222-4444',
    '+502 5222-4444',
    'pedidos@pizzahut.com.gt',
    'https://pizzahut.com.gt',
    'Lunes a Domingo: 10:00 - 21:00',
    4.5,
    FALSE,
    FALSE,
    ARRAY['Pizza para llevar', 'Delivery', 'Buffet de ensaladas'],
    '{"facebook": "https://facebook.com/pizzahutgt", "instagram": "https://instagram.com/pizzahutgt"}'::jsonb
),
(
    'McDonald''s',
    'restaurantes',
    'Tu restaurante favorito de comida rápida. Cajita Feliz y combos para toda la familia.',
    'https://images.unsplash.com/photo-1586816001966-79b736744398?w=800',
    'Local 20',
    'Food Court - Nivel 2',
    '+502 2333-5555',
    '+502 5333-5555',
    NULL,
    'https://mcdonalds.com.gt',
    'Lunes a Domingo: 7:00 - 22:00',
    4.3,
    TRUE,
    TRUE,
    ARRAY['Desayunos', 'McDelivery', 'AutoMac'],
    '{"facebook": "https://facebook.com/mcdonaldsgt", "instagram": "https://instagram.com/mcdonaldsgt"}'::jsonb
),
(
    'Helados Sarita',
    'cafeterias',
    'Los helados más ricos de Guatemala desde 1948. Más de 50 sabores disponibles.',
    'https://images.unsplash.com/photo-1501443762994-82bd5dace89a?w=800',
    'Local 10',
    'Nivel 1',
    '+502 2444-6666',
    '+502 5444-6666',
    'info@heladossarita.com.gt',
    'https://heladossarita.com.gt',
    'Lunes a Domingo: 10:00 - 20:00',
    4.8,
    FALSE,
    FALSE,
    ARRAY['Helados artesanales', 'Batidos', 'Pasteles helados'],
    '{"facebook": "https://facebook.com/heladossarita", "instagram": "https://instagram.com/heladossarita"}'::jsonb
),
-- Tiendas
(
    'Payless ShoeSource',
    'tiendas',
    'Calzado para toda la familia a precios accesibles. Zapatos escolares, casuales y formales.',
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
    'Local 35',
    'Nivel 2',
    '+502 2555-7777',
    '+502 5555-7777',
    'ventas@payless.com.gt',
    'https://payless.com.gt',
    'Lunes a Domingo: 10:00 - 20:00',
    4.4,
    FALSE,
    FALSE,
    ARRAY['Calzado escolar', 'Zapatos casuales', 'Accesorios'],
    '{"facebook": "https://facebook.com/paylessgt", "instagram": "https://instagram.com/paylessgt"}'::jsonb
),
(
    'Casa del Celular',
    'tecnologia',
    'Venta y reparación de celulares. Accesorios originales y protectores de pantalla.',
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=800',
    'Local 30',
    'Nivel 2',
    '+502 2666-8888',
    '+502 5666-8888',
    'ventas@casadelcelular.gt',
    NULL,
    'Lunes a Sábado: 9:00 - 19:00',
    4.2,
    FALSE,
    TRUE,
    ARRAY['Venta de celulares', 'Reparaciones express', 'Accesorios'],
    '{"facebook": "https://facebook.com/casadelcelulargt", "instagram": "https://instagram.com/casadelcelulargt"}'::jsonb
),
(
    'Elektra',
    'tiendas',
    'Electrodomésticos, muebles y tecnología con facilidades de pago. Crédito fácil.',
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
    'Local 40-42',
    'Nivel 1',
    '+502 2777-9999',
    '+502 5777-9999',
    'atencion@elektra.com.gt',
    'https://elektra.com.gt',
    'Lunes a Domingo: 9:00 - 20:00',
    4.1,
    TRUE,
    TRUE,
    ARRAY['Electrodomésticos', 'Muebles', 'Crédito Elektra'],
    '{"facebook": "https://facebook.com/elektragt", "instagram": "https://instagram.com/elektragt"}'::jsonb
),
-- Servicios
(
    'Claro',
    'servicios',
    'Centro de atención Claro. Planes de telefonía, internet y televisión.',
    'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=800',
    'Local 5',
    'Nivel 1',
    '+502 2500-0000',
    NULL,
    NULL,
    'https://claro.com.gt',
    'Lunes a Viernes: 9:00 - 18:00 | Sábado: 9:00 - 14:00',
    3.9,
    FALSE,
    FALSE,
    ARRAY['Planes móviles', 'Internet hogar', 'Televisión'],
    '{"facebook": "https://facebook.com/claroguatemala", "instagram": "https://instagram.com/claroguatemala"}'::jsonb
),
(
    'Western Union',
    'servicios',
    'Envío y recepción de remesas internacionales. Servicio rápido y seguro.',
    'https://images.unsplash.com/photo-1580048915913-4f8f5cb481c4?w=800',
    'Local 3',
    'Nivel 1',
    '+502 2888-1111',
    NULL,
    NULL,
    'https://westernunion.com',
    'Lunes a Sábado: 8:00 - 18:00',
    4.0,
    FALSE,
    FALSE,
    ARRAY['Envío de remesas', 'Recepción de dinero', 'Pago de servicios'],
    '{"facebook": "https://facebook.com/westernunion"}'::jsonb
),
-- Belleza
(
    'Perfumes Factory',
    'belleza',
    'Perfumes originales de las mejores marcas a precios increíbles.',
    'https://images.unsplash.com/photo-1541643600914-78b084683601?w=800',
    'Local 16',
    'Nivel 2',
    '+502 2999-2222',
    '+502 5999-2222',
    'ventas@perfumesfactory.gt',
    'https://perfumesfactory.com.gt',
    'Lunes a Domingo: 10:00 - 20:00',
    4.6,
    FALSE,
    FALSE,
    ARRAY['Perfumes originales', 'Maquillaje', 'Sets de regalo'],
    '{"facebook": "https://facebook.com/perfumesfactorygt", "instagram": "https://instagram.com/perfumesfactorygt"}'::jsonb
),
-- Salud
(
    'Farmacias Galeno',
    'salud',
    'Tu farmacia de confianza. Medicamentos, vitaminas y productos de cuidado personal.',
    'https://images.unsplash.com/photo-1631549916768-4119b2e5f926?w=800',
    'Local 7',
    'Nivel 1',
    '+502 2111-3333',
    '+502 5111-3333',
    'atencion@galeno.com.gt',
    'https://farmaciagaleno.com.gt',
    'Lunes a Domingo: 7:00 - 21:00',
    4.7,
    FALSE,
    FALSE,
    ARRAY['Medicamentos', 'Delivery 24hrs', 'Consulta farmacéutica'],
    '{"facebook": "https://facebook.com/farmaciasgaleno", "instagram": "https://instagram.com/farmaciasgaleno"}'::jsonb
);

-- =====================================================
-- MÁS EVENTOS
-- =====================================================

INSERT INTO eventos (titulo, descripcion, fecha, hora, ubicacion, imagen) VALUES
(
    'Noche de Karaoke',
    'Ven a cantar tus canciones favoritas todos los viernes. Premios para los mejores.',
    '2026-01-24',
    '19:00',
    'Food Court - Nivel 2',
    'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=800'
),
(
    'Clases de Zumba Gratis',
    'Todos los sábados, clases de zumba para toda la familia. No necesitas inscripción.',
    '2026-01-25',
    '10:00',
    'Plaza Central',
    'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=800'
),
(
    'Día del Niño - Show Infantil',
    'Payasos, juegos, piñatas y mucha diversión para los más pequeños.',
    '2026-02-01',
    '14:00',
    'Nivel 3 - Área de Eventos',
    'https://images.unsplash.com/photo-1530103862676-de8c9debad1d?w=800'
),
(
    'Festival Gastronómico',
    'Degustaciones de todos los restaurantes del centro comercial. Precios especiales.',
    '2026-02-08',
    '12:00',
    'Food Court - Nivel 2',
    'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800'
),
(
    'Expo Mascotas',
    'Adopción de mascotas, servicios veterinarios gratis y productos con descuento.',
    '2026-02-28',
    '09:00',
    'Estacionamiento Norte',
    'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=800'
);

-- =====================================================
-- MÁS PROMOCIONES
-- =====================================================

INSERT INTO promociones (titulo, descripcion, negocio_id, fecha_inicio, fecha_fin, imagen) VALUES
(
    '2x1 en Big Mac',
    'Todos los martes, llévate 2 Big Mac por el precio de 1. Solo en restaurante.',
    12, -- McDonald's
    '2026-01-01',
    '2026-03-31',
    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=800'
),
(
    '50% en segundo par',
    'Compra un par de zapatos y el segundo tiene 50% de descuento.',
    14, -- Payless
    '2026-01-15',
    '2026-02-15',
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800'
),
(
    'Pantalla gratis',
    'En la compra de cualquier celular, llévate un protector de pantalla gratis.',
    15, -- Casa del Celular
    '2026-01-01',
    '2026-01-31',
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=800'
),
(
    '12 meses sin intereses',
    'En compras mayores a Q2,000 con tarjetas participantes.',
    16, -- Elektra
    '2026-01-01',
    '2026-02-28',
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800'
),
(
    'Helado del día Q10',
    'Todos los días un sabor diferente a solo Q10. Pregunta cuál es el de hoy.',
    13, -- Helados Sarita
    '2026-01-01',
    '2026-12-31',
    'https://images.unsplash.com/photo-1501443762994-82bd5dace89a?w=800'
);

-- =====================================================
-- MÁS NOTICIAS
-- =====================================================

INSERT INTO noticias (titulo, resumen, contenido, fecha, imagen) VALUES
(
    'Inauguración de nueva área de juegos',
    'Este fin de semana inauguramos la zona de juegos más grande del norte de la ciudad.',
    'Plaza San Rafael se complace en anunciar la inauguración de su nueva área de juegos infantiles, la más grande del norte de la Ciudad de Guatemala. Con más de 500 metros cuadrados, esta zona incluye juegos mecánicos, área de trampolines, y un espacio seguro para que los más pequeños se diviertan mientras los padres disfrutan de las tiendas y restaurantes.',
    '2026-01-15',
    'https://images.unsplash.com/photo-1566454725587-77d0b4e87db7?w=800'
),
(
    'Nuevos locales disponibles',
    'Únete a la familia de Plaza San Rafael. Tenemos locales disponibles para tu negocio.',
    'Si estás buscando el lugar perfecto para tu negocio, Plaza San Rafael tiene espacios disponibles en ubicaciones estratégicas. Contamos con locales desde 20 hasta 200 metros cuadrados, con excelente afluencia de visitantes. Contáctanos para más información sobre arrendamiento.',
    '2026-01-12',
    'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800'
);

-- =====================================================
-- ACTUALIZAR TOP NEGOCIOS
-- =====================================================

-- Asegurar que los negocios principales sean TOP y patrocinados
UPDATE negocios SET es_top = TRUE, es_patrocinado = TRUE WHERE nombre IN ('Apomedix', 'Taco Bell', 'McDonald''s', 'Elektra');
UPDATE negocios SET es_top = TRUE, es_patrocinado = FALSE WHERE nombre IN ('Deportes Total', 'TechZone', 'Veterinaria Marveliz');

-- =====================================================
-- VERIFICACIÓN
-- =====================================================
SELECT 'Datos adicionales insertados!' as mensaje;
SELECT 'Total negocios: ' || COUNT(*) FROM negocios;
SELECT 'Total eventos: ' || COUNT(*) FROM eventos;
SELECT 'Total promociones: ' || COUNT(*) FROM promociones;
