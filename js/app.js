// Plaza San Rafael - Main Application

let negociosData = null;
let currentFilter = 'all';

// Load data from JSON
async function loadData() {
    try {
        const response = await fetch('data/negocios.json');
        negociosData = await response.json();
        initializeApp();
    } catch (error) {
        console.error('Error loading data:', error);
    }
}

function initializeApp() {
    renderTopNegocios();
    renderFeaturedNegocios();
    renderEventos();
    renderPromociones();
    renderNoticias();
    renderCategorias();
    initializeSearch();
    initializeScrollAnimations();
}

// Render Top Businesses (Sponsored)
function renderTopNegocios() {
    const container = document.getElementById('top-negocios-grid');
    if (!container) return;

    const topNegocios = negociosData.negocios.filter(n => n.esTop && n.esPatrocinado);

    container.innerHTML = topNegocios.map(negocio => `
        <div class="card-negocio bg-white dark:bg-gray-800 rounded-xl shadow-lg overflow-hidden border-2 border-secondary dark:border-amber-400 ring-4 ring-secondary/10 flex flex-col">
            <div class="h-48 relative overflow-hidden">
                <img alt="${negocio.nombre}" class="w-full h-full object-cover transform hover:scale-110 transition-transform duration-500" src="${negocio.imagen}">
                <div class="absolute top-4 right-4 bg-secondary text-white text-xs font-bold px-3 py-1 rounded-full shadow flex items-center badge-sponsored">
                    <span class="material-icons text-sm mr-1">star</span>
                    TOP
                </div>
                <div class="absolute top-4 left-4 bg-white/90 dark:bg-gray-900/90 text-xs font-bold px-2 py-1 rounded-full shadow text-gray-800 dark:text-gray-200 uppercase tracking-wider">
                    ${negocio.categoria}
                </div>
            </div>
            <div class="p-6 flex-1 flex flex-col">
                <div class="flex items-center justify-between mb-2">
                    <h3 class="text-xl font-bold text-gray-900 dark:text-white">${negocio.nombre}</h3>
                    <span class="flex items-center text-yellow-400 text-sm">
                        <span class="material-icons text-base mr-1">star</span> ${negocio.rating}
                    </span>
                </div>
                <p class="text-gray-600 dark:text-gray-300 mb-4 line-clamp-2">${negocio.descripcion}</p>
                <div class="flex flex-wrap gap-2 mb-4">
                    ${negocio.servicios.slice(0, 2).map(s => `
                        <span class="text-xs bg-purple-100 dark:bg-purple-900/30 text-purple-800 dark:text-purple-300 px-2 py-1 rounded-full">${s}</span>
                    `).join('')}
                </div>
                <div class="mt-auto">
                    <div class="flex items-center text-sm text-gray-500 dark:text-gray-400 mb-3">
                        <span class="material-icons text-sm mr-1">place</span> ${negocio.nivel}, ${negocio.local}
                    </div>
                    <div class="flex items-center justify-between">
                        <a href="tel:${negocio.telefono}" class="flex items-center text-sm text-accent hover:text-green-600">
                            <span class="material-icons text-sm mr-1">phone</span> ${negocio.telefono}
                        </a>
                        <button onclick="openNegocioModal(${negocio.id})" class="text-secondary font-medium text-sm hover:text-amber-600 transition-colors">
                            Ver más
                        </button>
                    </div>
                </div>
            </div>
        </div>
    `).join('');
}

// Render Featured Businesses
function renderFeaturedNegocios() {
    const container = document.getElementById('featured-negocios-grid');
    if (!container) return;

    const featured = negociosData.negocios.filter(n => !n.esPatrocinado).slice(0, 6);

    container.innerHTML = featured.map(negocio => `
        <div class="card-negocio bg-white dark:bg-gray-800 rounded-xl shadow-lg overflow-hidden border border-gray-100 dark:border-gray-700 flex flex-col">
            <div class="h-48 relative overflow-hidden">
                <img alt="${negocio.nombre}" class="w-full h-full object-cover transform hover:scale-110 transition-transform duration-500" src="${negocio.imagen}" onerror="this.src='https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800'">
                <div class="absolute top-4 right-4 bg-white/90 dark:bg-gray-900/90 text-xs font-bold px-2 py-1 rounded-full shadow text-gray-800 dark:text-gray-200 uppercase tracking-wider">
                    ${negocio.categoria}
                </div>
            </div>
            <div class="p-6 flex-1 flex flex-col">
                <div class="flex items-center justify-between mb-2">
                    <h3 class="text-xl font-bold text-gray-900 dark:text-white">${negocio.nombre}</h3>
                    <span class="flex items-center text-yellow-400 text-sm">
                        <span class="material-icons text-base mr-1">star</span> ${negocio.rating}
                    </span>
                </div>
                <p class="text-gray-600 dark:text-gray-300 mb-4 line-clamp-2">${negocio.descripcion}</p>
                <div class="mt-auto flex items-center justify-between">
                    <span class="text-sm text-gray-500 dark:text-gray-400 flex items-center">
                        <span class="material-icons text-sm mr-1">place</span> ${negocio.nivel}, ${negocio.local}
                    </span>
                    <button onclick="openNegocioModal(${negocio.id})" class="text-primary font-medium text-sm hover:text-purple-700 dark:hover:text-purple-400 transition-colors">
                        Ver más
                    </button>
                </div>
            </div>
        </div>
    `).join('');
}

// Render Events
function renderEventos() {
    const container = document.getElementById('eventos-grid');
    if (!container) return;

    container.innerHTML = negociosData.eventos.map(evento => {
        const fecha = new Date(evento.fecha);
        const options = { day: 'numeric', month: 'short' };
        const fechaFormateada = fecha.toLocaleDateString('es-GT', options);

        return `
            <div class="card-negocio bg-white dark:bg-gray-800 rounded-xl shadow-lg overflow-hidden border border-gray-100 dark:border-gray-700">
                <div class="h-40 relative overflow-hidden">
                    <img alt="${evento.titulo}" class="w-full h-full object-cover" src="${evento.imagen}">
                    <div class="absolute top-4 left-4 bg-primary text-white text-center rounded-lg px-3 py-2 shadow-lg">
                        <div class="text-2xl font-bold">${fecha.getDate()}</div>
                        <div class="text-xs uppercase">${fecha.toLocaleDateString('es-GT', { month: 'short' })}</div>
                    </div>
                </div>
                <div class="p-5">
                    <h3 class="text-lg font-bold text-gray-900 dark:text-white mb-2">${evento.titulo}</h3>
                    <p class="text-gray-600 dark:text-gray-300 text-sm mb-3 line-clamp-2">${evento.descripcion}</p>
                    <div class="flex items-center text-sm text-gray-500 dark:text-gray-400">
                        <span class="material-icons text-sm mr-1">schedule</span> ${evento.hora}
                        <span class="mx-2">|</span>
                        <span class="material-icons text-sm mr-1">place</span> ${evento.ubicacion}
                    </div>
                </div>
            </div>
        `;
    }).join('');
}

// Render Promotions
function renderPromociones() {
    const container = document.getElementById('promociones-grid');
    if (!container) return;

    container.innerHTML = negociosData.promociones.map(promo => {
        const negocio = negociosData.negocios.find(n => n.id === promo.negocio_id);
        return `
            <div class="relative rounded-2xl overflow-hidden group h-64 md:h-72 shadow-lg card-negocio">
                <img alt="${promo.titulo}" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105" src="${promo.imagen}" onerror="this.src='https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=800'">
                <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-transparent flex flex-col justify-end p-6">
                    <span class="bg-secondary text-white text-xs font-bold px-2 py-1 rounded uppercase tracking-wide w-max mb-2">Promoción</span>
                    <h3 class="text-xl md:text-2xl font-bold text-white mb-2">${promo.titulo}</h3>
                    <p class="text-gray-200 text-sm mb-3">${promo.descripcion}</p>
                    ${negocio ? `<p class="text-gray-300 text-xs flex items-center"><span class="material-icons text-sm mr-1">store</span> ${negocio.nombre}</p>` : ''}
                </div>
            </div>
        `;
    }).join('');
}

// Render News
function renderNoticias() {
    const container = document.getElementById('noticias-grid');
    if (!container) return;

    container.innerHTML = negociosData.noticias.map(noticia => {
        const fecha = new Date(noticia.fecha);
        return `
            <div class="card-negocio bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden border border-gray-100 dark:border-gray-700 flex flex-col md:flex-row">
                <div class="md:w-1/3 h-48 md:h-auto">
                    <img alt="${noticia.titulo}" class="w-full h-full object-cover" src="${noticia.imagen}">
                </div>
                <div class="p-5 md:w-2/3 flex flex-col">
                    <span class="text-xs text-gray-500 dark:text-gray-400 mb-2">${fecha.toLocaleDateString('es-GT', { day: 'numeric', month: 'long', year: 'numeric' })}</span>
                    <h3 class="text-lg font-bold text-gray-900 dark:text-white mb-2">${noticia.titulo}</h3>
                    <p class="text-gray-600 dark:text-gray-300 text-sm flex-grow">${noticia.resumen}</p>
                    <a href="#" class="text-primary font-medium text-sm hover:underline mt-3 inline-flex items-center">
                        Leer más <span class="material-icons text-sm ml-1">arrow_forward</span>
                    </a>
                </div>
            </div>
        `;
    }).join('');
}

// Render Categories
function renderCategorias() {
    const container = document.getElementById('categorias-grid');
    if (!container) return;

    const colorMap = {
        'primary': { bg: 'bg-purple-100 dark:bg-purple-900/30', text: 'text-primary', border: 'bg-primary' },
        'secondary': { bg: 'bg-orange-100 dark:bg-orange-900/30', text: 'text-secondary', border: 'bg-secondary' },
        'accent': { bg: 'bg-green-100 dark:bg-green-900/30', text: 'text-accent', border: 'bg-accent' },
        'brandBlue': { bg: 'bg-blue-100 dark:bg-blue-900/30', text: 'text-brandBlue', border: 'bg-brandBlue' }
    };

    container.innerHTML = negociosData.categorias.map(cat => {
        const colors = colorMap[cat.color] || colorMap['primary'];
        const count = negociosData.negocios.filter(n => n.categoria.toLowerCase() === cat.nombre.toLowerCase()).length;

        return `
            <a href="#directorio" onclick="filterByCategory('${cat.nombre}')" class="category-pill group relative overflow-hidden rounded-2xl bg-white dark:bg-gray-800 shadow-md hover:shadow-xl transition-all duration-300 p-6 flex flex-col items-center justify-center border border-gray-100 dark:border-gray-700">
                <div class="h-14 w-14 ${colors.bg} rounded-full flex items-center justify-center mb-3 group-hover:scale-110 transition-transform">
                    <span class="material-icons text-2xl ${colors.text}">${cat.icono}</span>
                </div>
                <h3 class="text-base font-semibold text-gray-900 dark:text-white">${cat.nombre}</h3>
                <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">${count} negocios</p>
                <div class="absolute inset-x-0 bottom-0 h-1 ${colors.border} scale-x-0 group-hover:scale-x-100 transition-transform origin-left"></div>
            </a>
        `;
    }).join('');
}

// Filter by category
function filterByCategory(categoria) {
    currentFilter = categoria;
    const allNegocios = document.querySelectorAll('.negocio-item');
    allNegocios.forEach(item => {
        if (categoria === 'all' || item.dataset.categoria.toLowerCase() === categoria.toLowerCase()) {
            item.style.display = 'block';
        } else {
            item.style.display = 'none';
        }
    });
}

// Search functionality
function initializeSearch() {
    const searchInput = document.getElementById('search-input');
    const searchResults = document.getElementById('search-results');

    if (!searchInput) return;

    searchInput.addEventListener('input', (e) => {
        const query = e.target.value.toLowerCase().trim();

        if (query.length < 2) {
            searchResults.innerHTML = '';
            searchResults.classList.add('hidden');
            return;
        }

        const results = negociosData.negocios.filter(n =>
            n.nombre.toLowerCase().includes(query) ||
            n.categoria.toLowerCase().includes(query) ||
            n.descripcion.toLowerCase().includes(query)
        );

        if (results.length > 0) {
            searchResults.innerHTML = results.slice(0, 5).map(n => `
                <a href="#" onclick="openNegocioModal(${n.id})" class="flex items-center p-3 hover:bg-gray-100 dark:hover:bg-gray-700 transition-colors">
                    <img src="${n.imagen}" alt="${n.nombre}" class="w-12 h-12 rounded-lg object-cover mr-3" onerror="this.src='https://via.placeholder.com/48'">
                    <div>
                        <h4 class="font-medium text-gray-900 dark:text-white">${n.nombre}</h4>
                        <p class="text-xs text-gray-500 dark:text-gray-400">${n.categoria} | ${n.local}</p>
                    </div>
                </a>
            `).join('');
            searchResults.classList.remove('hidden');
        } else {
            searchResults.innerHTML = '<p class="p-4 text-gray-500 dark:text-gray-400 text-center">No se encontraron resultados</p>';
            searchResults.classList.remove('hidden');
        }
    });

    // Close search results when clicking outside
    document.addEventListener('click', (e) => {
        if (!searchInput.contains(e.target) && !searchResults.contains(e.target)) {
            searchResults.classList.add('hidden');
        }
    });
}

// Open business modal
function openNegocioModal(id) {
    const negocio = negociosData.negocios.find(n => n.id === id);
    if (!negocio) return;

    const modal = document.getElementById('negocio-modal');
    const content = document.getElementById('negocio-modal-content');

    content.innerHTML = `
        <div class="relative">
            <img src="${negocio.imagen}" alt="${negocio.nombre}" class="w-full h-64 object-cover" onerror="this.src='https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800'">
            <button onclick="closeNegocioModal()" class="absolute top-4 right-4 bg-white/90 dark:bg-gray-900/90 rounded-full p-2 shadow-lg hover:bg-white dark:hover:bg-gray-900 transition-colors">
                <span class="material-icons">close</span>
            </button>
            ${negocio.esPatrocinado ? '<div class="absolute top-4 left-4 bg-secondary text-white text-xs font-bold px-3 py-1 rounded-full shadow flex items-center"><span class="material-icons text-sm mr-1">star</span> TOP</div>' : ''}
        </div>
        <div class="p-6">
            <div class="flex items-center justify-between mb-4">
                <h2 class="text-2xl font-bold text-gray-900 dark:text-white">${negocio.nombre}</h2>
                <span class="flex items-center text-yellow-400"><span class="material-icons mr-1">star</span> ${negocio.rating}</span>
            </div>
            <span class="inline-block bg-purple-100 dark:bg-purple-900/30 text-purple-800 dark:text-purple-300 text-sm px-3 py-1 rounded-full mb-4">${negocio.categoria}</span>
            <p class="text-gray-600 dark:text-gray-300 mb-6">${negocio.descripcion}</p>

            <div class="space-y-3 mb-6">
                <div class="flex items-center text-gray-700 dark:text-gray-300">
                    <span class="material-icons text-accent mr-3">place</span>
                    <span>${negocio.nivel}, ${negocio.local}</span>
                </div>
                <div class="flex items-center text-gray-700 dark:text-gray-300">
                    <span class="material-icons text-accent mr-3">schedule</span>
                    <span>${negocio.horario}</span>
                </div>
                <div class="flex items-center text-gray-700 dark:text-gray-300">
                    <span class="material-icons text-accent mr-3">phone</span>
                    <a href="tel:${negocio.telefono}" class="hover:text-primary">${negocio.telefono}</a>
                </div>
                ${negocio.email ? `
                <div class="flex items-center text-gray-700 dark:text-gray-300">
                    <span class="material-icons text-accent mr-3">email</span>
                    <a href="mailto:${negocio.email}" class="hover:text-primary">${negocio.email}</a>
                </div>` : ''}
                ${negocio.web ? `
                <div class="flex items-center text-gray-700 dark:text-gray-300">
                    <span class="material-icons text-accent mr-3">language</span>
                    <a href="${negocio.web}" target="_blank" class="hover:text-primary">${negocio.web}</a>
                </div>` : ''}
            </div>

            <div class="mb-6">
                <h4 class="font-semibold text-gray-900 dark:text-white mb-3">Servicios</h4>
                <div class="flex flex-wrap gap-2">
                    ${negocio.servicios.map(s => `<span class="bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300 text-sm px-3 py-1 rounded-full">${s}</span>`).join('')}
                </div>
            </div>

            <div class="flex gap-3">
                ${negocio.whatsapp ? `
                <a href="https://wa.me/${negocio.whatsapp.replace(/[^0-9]/g, '')}" target="_blank" class="flex-1 bg-green-500 hover:bg-green-600 text-white font-medium py-3 px-4 rounded-lg transition-colors flex items-center justify-center">
                    <span class="material-icons mr-2">chat</span> WhatsApp
                </a>` : ''}
                <a href="tel:${negocio.telefono}" class="flex-1 bg-primary hover:bg-purple-700 text-white font-medium py-3 px-4 rounded-lg transition-colors flex items-center justify-center">
                    <span class="material-icons mr-2">phone</span> Llamar
                </a>
            </div>
        </div>
    `;

    modal.classList.remove('hidden');
    modal.classList.add('flex');
    document.body.style.overflow = 'hidden';
}

function closeNegocioModal() {
    const modal = document.getElementById('negocio-modal');
    modal.classList.add('hidden');
    modal.classList.remove('flex');
    document.body.style.overflow = 'auto';
}

// Scroll animations
function initializeScrollAnimations() {
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, { threshold: 0.1 });

    document.querySelectorAll('.animate-on-scroll').forEach(el => {
        observer.observe(el);
    });
}

// Dark mode toggle
function toggleDarkMode() {
    document.documentElement.classList.toggle('dark');
    localStorage.setItem('darkMode', document.documentElement.classList.contains('dark'));
}

// Check saved dark mode preference
if (localStorage.getItem('darkMode') === 'true') {
    document.documentElement.classList.add('dark');
}

// Mobile menu toggle
function toggleMobileMenu() {
    const menu = document.getElementById('mobile-menu');
    menu.classList.toggle('open');
}

// Initialize on load
document.addEventListener('DOMContentLoaded', loadData);

// Close modal on escape key
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        closeNegocioModal();
    }
});
