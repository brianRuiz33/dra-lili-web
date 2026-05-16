# Plan de Producción — Sitio Dra. Lili Nieto

Este documento es la hoja de ruta para llevar el sitio de "demo" a "producción real". Está organizado por **prioridad** (lo que bloquea publicar vs. lo que se puede agregar después) y cada tarea tiene una estimación rough de esfuerzo.

---

## 🚦 Resumen de prioridades

| Prioridad             | Tareas                                                                    | Sin esto...                 |
| --------------------- | ------------------------------------------------------------------------- | --------------------------- |
| **P0 — Bloqueante**   | Contenido real, formulario funcional, dominio + hosting, SSL              | No se puede publicar        |
| **P1 — Crítico**      | SEO básico, favicon, aviso de privacidad, redes sociales reales           | El sitio queda incompleto   |
| **P2 — Importante**   | Analytics, schema markup, optimización de imágenes, testing cross-browser | Pierdes datos y visibilidad |
| **P3 — Nice to have** | Animaciones extra, lazy load avanzado, integración WhatsApp Business      | Pulido final                |

---

## 📋 Fase 1 — Contenido (P0)

### 1.1 Fotos reales

- [ ] Recibir foto de la doctora (silueta de torso, fondo transparente)
- [ ] Recibir 4 fotos del consultorio (sala de espera, área clínica, recepción, detalle)
- [x] Recibir 6+ fotos de sonrisas de pacientes (con consentimiento firmado)
- [ ] Reemplazar placeholders en `index.html`:
  - `.about-img` y `.hero-photo` (placeholder de doctora)
  - `.loc-photo.placeholder` (3 placeholders en Ubicación)
  - `.pin-slide` (18 slots en hero mosaic — 3 estados × 6 tiles)

### 1.2 Textos reales

- [x] Validar con la doctora la bio en sección "Acerca"
- [x] Confirmar lista real de estudios y certificaciones
- [ ] Revisar descripciones de cada tratamiento
- [x] Validar dirección, teléfono y correo
- [x] Definir si hay días festivos o vacaciones que mencionar en horario

**Esfuerzo:** 1-2 sesiones de fotos + 1 sesión de revisión con la doctora

---

## 📨 Fase 2 — Formulario funcional (P0)

Hoy el formulario solo muestra un mensaje de éxito sin enviar nada. Opciones:

### Opción A — Formspree

- Crear cuenta gratis en formspree.io
- Cambiar `<form>` para apuntar al endpoint
- Configurar correo destino: `drlilinieto@gmail.com`
- Free tier: 50 envíos/mes (suficiente para empezar)

### Tareas

- [x] Decidir opción (A, B o C)
- [x] Configurar la cuenta y conectar
- [x] Agregar validación más estricta:
  - Email con regex
  - Teléfono 10 dígitos mexicanos
- [x] Agregar **hCaptcha** o **honeypot** para evitar spam
- [x] Agregar checkbox de **consentimiento de privacidad** (obligatorio en México)
- [x] Probar envío real y confirmar que llega el correo

**Esfuerzo:** 1-2 horas

---

## 🌐 Fase 3 — Dominio + Hosting (P0)

### 3.1 Dominio

- [x] Comprar dominio. Sugerencias:
  - `dralilinieto.mx` (~$200/año)
  - `dralilinieto.com` (~$250/año)
  - `liliortodoncia.mx`
- [x] Configurar DNS

### 3.2 Hosting (recomendado: Vercel o Netlify)

- [x] Crear repositorio en GitHub
- [ ] Conectar a Vercel/Netlify (deploy automático)
- [ ] Configurar dominio personalizado
- [ ] Verificar SSL automático (HTTPS)
- [ ] Configurar redirecciones: `www.dominio.mx` → `dominio.mx`

### 3.3 Correo profesional

- [x] Crear `contacto@dralilinieto.mx` con Google Workspace o Zoho Mail
- [x] Usar ese correo como destinatario del formulario en lugar del Gmail personal

**Esfuerzo:** 1 día (puede tomar 24h propagación DNS)

---

## 🔍 Fase 4 — SEO + Metadata (P1)

### 4.1 Metadata básica

- [ ] **Open Graph tags** (cómo se ve al compartir en WhatsApp, Facebook):
  ```html
  <meta property="og:title" content="..." />
  <meta property="og:description" content="..." />
  <meta property="og:image" content="https://.../og-image.jpg" />
  <meta property="og:url" content="..." />
  <meta property="og:type" content="website" />
  ```
- [ ] **Twitter Card**
- [ ] Crear imagen `og-image.jpg` (1200×630px) con logo + lema + foto
- [ ] **Favicon** completo: 16x16, 32x32, 180x180 (Apple), 192x192, 512x512

### 4.2 Schema.org markup

Esto le dice a Google "soy una clínica dental" y aparece tu ficha en búsquedas con horario, teléfono y mapa.

- [ ] Agregar JSON-LD tipo `Dentist`:
  ```json
  {
    "@context": "https://schema.org",
    "@type": "Dentist",
    "name": "Dra. Lili Nieto Ortodoncia",
    "image": "https://...",
    "address": {...},
    "telephone": "...",
    "openingHours": [...]
  }
  ```

### 4.3 SEO técnico

- [ ] Crear `robots.txt`
- [ ] Crear `sitemap.xml`
- [ ] Verificar sitio en **Google Search Console**
- [ ] Configurar **Google Business Profile** (la ficha de Google Maps)

**Esfuerzo:** 2-3 horas

---

## ♿ Fase 5 — Accesibilidad (P1)

- [ ] Auditar con **Lighthouse** (target: 90+)
- [ ] Verificar contraste de texto (WCAG AA mínimo)
- [ ] Probar navegación solo con **teclado** (Tab, Enter, Esc)
- [ ] Verificar **focus states** visibles en todos los interactivos
- [ ] Probar con lector de pantalla (VoiceOver iOS o NVDA)
- [ ] Agregar `lang="es"` (✅ ya está)
- [ ] Verificar `alt` text descriptivo en todas las imágenes reales
- [ ] `prefers-reduced-motion` respetado en animaciones (✅ ya está)

**Esfuerzo:** 2-4 horas

---

## ⚡ Fase 6 — Performance (P2)

### 6.1 Imágenes

- [ ] Convertir todas las fotos a **WebP** (60-80% más ligeras que JPEG)
- [ ] Generar versiones responsive con `<picture>` y `srcset`
- [ ] Comprimir con **Squoosh** o **TinyPNG**
- [ ] Lazy loading en imágenes fuera del viewport: `loading="lazy"`

### 6.2 Dependencias externas

- [ ] Reemplazar **Lucide CDN** por SVG inline (elimina petición externa, ~30KB menos)
- [ ] Self-host de **Google Fonts** (DM Sans) — más rápido y privado
- [ ] Diferir carga del mapa de Google: solo cargar al hacer scroll

### 6.3 Build

- [ ] Minificar CSS y HTML
- [ ] Considerar comprimir con Brotli (Vercel/Netlify lo hacen automático)

### 6.4 Métricas objetivo (Core Web Vitals)

- LCP (Largest Contentful Paint): < 2.5s
- INP (Interaction to Next Paint): < 200ms
- CLS (Cumulative Layout Shift): < 0.1

**Esfuerzo:** 3-4 horas

---

## 📊 Fase 7 — Analytics + Tracking (P2)

### 7.1 Analítica

- [ ] **Google Analytics 4** o **Plausible** (más privado, sin cookies)
- [ ] Configurar eventos:
  - Click en "Agendar cita"
  - Click en "Abrir indicaciones en Google Maps"
  - Click en teléfono
  - Click en correo
  - Submit del formulario (conversión)

### 7.2 Marketing (si la doctora hará ads)

- [ ] Píxel de **Meta** (Facebook/Instagram ads)
- [ ] Google Ads conversion tag

**Esfuerzo:** 1-2 horas

---

## 🛡️ Fase 8 — Legal (P1)

Manejar datos personales de pacientes (incluso solo nombre y teléfono) cae bajo la **LFPDPPP** en México. Es obligatorio tener aviso de privacidad.

- [ ] **Aviso de privacidad** (página separada)
- [ ] Link al aviso en el footer
- [ ] **Checkbox de consentimiento** en el formulario:
  > "He leído y acepto el [aviso de privacidad](/privacidad)"
- [ ] **Cookies** — si usamos analytics, agregar banner de cookies (puede ser muy ligero)
- [ ] Si se usan fotos de pacientes: **consentimiento firmado por escrito**

**Esfuerzo:** 2-3 horas + 1 abogado opcional para validar

---

## 🧪 Fase 9 — Testing (P2)

### 9.1 Navegadores

- [ ] Chrome (desktop + Android)
- [ ] Safari (desktop + iOS)
- [ ] Firefox
- [ ] Edge

### 9.2 Dispositivos / tamaños

- [ ] iPhone SE (375px) — el más chico común
- [ ] iPhone 14/15 (390px)
- [ ] Android estándar (412px)
- [ ] Tablet (768px)
- [ ] Laptop (1280px)
- [ ] Desktop (1920px)

### 9.3 Flujos completos

- [ ] Cargar sitio → click "Agendar" → llegar al formulario → enviar → recibir correo
- [ ] Click "Abrir Google Maps" → abre la app correctamente
- [ ] Click WhatsApp en footer → abre chat
- [ ] Formulario con datos inválidos: muestra errores claros

**Esfuerzo:** 2-3 horas

---

## 🎨 Fase 10 — Pulido final (P3)

- [ ] Vincular **redes sociales reales** (hoy van a URLs genéricas):
  - Facebook: `https://www.facebook.com/[user-real]`
  - Instagram: `https://www.instagram.com/[user-real]`
  - WhatsApp: `https://wa.me/524442195371` (✅ ya está bien)
- [ ] Agregar testimonios reales (si la doctora tiene reviews en Google)
- [ ] Sección "Antes y después" (opcional, si tiene fotos comparativas con consentimiento)
- [ ] FAQ con preguntas frecuentes (precios, formas de pago, primera cita)
- [ ] Botón flotante de WhatsApp persistente (esquina inferior derecha)

---

## 📅 Timeline sugerido

| Semana | Actividades                                     |
| ------ | ----------------------------------------------- |
| **1**  | Sesión de fotos + validar contenido con doctora |
| **2**  | Formulario funcional + dominio + hosting + SSL  |
| **3**  | SEO + metadata + aviso de privacidad + favicon  |
| **4**  | Performance + analytics + testing cross-browser |
| **5**  | Publicación + pulido + monitoreo inicial        |

**Total: ~4-5 semanas** desde la decisión de publicar hasta tener un sitio totalmente listo.

---

# 📸 Lista de imágenes necesarias

Todas las dimensiones son **mínimo recomendado**. Más resolución es mejor para futuras adaptaciones. Formatos: JPG para fotos, PNG con transparencia para logos/silueta.

## 1. Logos (ya entregados ✅)

| Archivo                        | Uso                        | Dimensiones              |
| ------------------------------ | -------------------------- | ------------------------ |
| `logo-horizontal-ametista.png` | Navbar, brand              | 1200×400px, transparente |
| `logo-horizontal-magnolia.png` | Sobre fondos oscuros       | 1200×400px, transparente |
| `logo-vertical-ametista.png`   | Hero (si se vuelve a usar) | 800×900px, transparente  |
| `logo-mark-ametista.png`       | Ícono solo                 | 800×800px, transparente  |
| `logo-mark-magnolia.png`       | Watermark del footer       | 800×800px, transparente  |

**Ideal:** versión SVG de todos (escala perfecta a cualquier tamaño).

## 2. Foto principal de la doctora

| Posición                 | Especificaciones                                                                                                                                                           |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Hero (próximamente)**  | Silueta de torso, fondo **transparente PNG**, mínimo 1200×1500px, alta resolución para Retina (2400×3000px ideal). Iluminación natural, sonrisa, ropa profesional/uniforme |
| **Acerca de la doctora** | La misma silueta funciona, o una variante con pose distinta                                                                                                                |

**Tip de fotografía:** que el corte sea limpio, sin bordes con aliasing. Si hay duda, mejor pedir varias tomas en el shooting.

## 3. Mosaico del Hero — Sonrisas de pacientes

| Cantidad         | Dimensiones                                | Notas                                                                                                                          |
| ---------------- | ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ |
| **6 a 12 fotos** | 600×600 a 600×900px (varios aspect ratios) | Primer plano o medio plano de sonrisas. Fondo neutro. Buena luz. Diversidad de edades. **Consentimiento firmado obligatorio.** |

Cada tile del mosaico tiene un `aspect-ratio` específico:

- Tile 1 (s-1): 3:4 → ej. 600×800px
- Tile 2 (s-2): 1:1 → ej. 600×600px
- Tile 3 (s-3): 3:4 → ej. 600×800px
- Tile 4 (s-4): 4:5 → ej. 600×750px
- Tile 5 (s-5): 1:1 → ej. 600×600px
- Tile 6 (s-6): 3:5 → ej. 600×1000px

Cada tile rota entre 3 imágenes, así que ideal: **18 fotos en total** (3 por tile). Mínimo viable: 6 fotos (una por tile sin rotación).

## 4. Consultorio (sección Ubicación)

| Posición            | Dimensiones               | Sugerencia de contenido                          |
| ------------------- | ------------------------- | ------------------------------------------------ |
| **Foto 1 (grande)** | 1200×1200px o 1200×1500px | Vista general del consultorio o sillón principal |
| **Foto 2**          | 600×600px                 | Sala de espera                                   |
| **Foto 3**          | 600×600px                 | Área clínica o detalle del equipo                |
| **Foto 4**          | 600×600px                 | Recepción, esterilización, o detalle decorativo  |

**Tip:** que todas mantengan paleta consistente (luz cálida, colores neutros) para que el bloque se vea unificado.

## 5. Imagen Open Graph (compartir en redes)

| Uso            | Dimensiones            | Contenido                                                                                    |
| -------------- | ---------------------- | -------------------------------------------------------------------------------------------- |
| `og-image.jpg` | **1200×630px exactos** | Logo + lema "La sonrisa que mereces" + foto pequeña de la doctora. Fondo ametista o magnolia |

Esta imagen aparece cuando alguien comparte el enlace del sitio en WhatsApp, Facebook, etc. **Muy importante**, suele ser el primer contacto visual con el sitio.

## 6. Favicon

Una sola imagen base, idealmente el ícono "lı" del logo en cuadrado, fondo ametista o transparente:
| Archivo | Dimensiones |
|---|---|
| `favicon.ico` | 32×32 (multi-resolución) |
| `apple-touch-icon.png` | 180×180px |
| `icon-192.png` | 192×192px |
| `icon-512.png` | 512×512px |

**Generar todo de un solo archivo** con [realfavicongenerator.net](https://realfavicongenerator.net).

## 7. Opcionales (Fase P3)

- **Antes y después** (si los pacientes consienten): 600×600px cada par
- **Iconos personalizados de tratamientos** (en lugar de Lucide): 64×64px SVG o PNG

---

## 📐 Resumen rápido — Tabla de imágenes

| Tipo             | Cantidad mínima | Cantidad ideal       | Formato                | Dimensiones                  |
| ---------------- | --------------- | -------------------- | ---------------------- | ---------------------------- |
| Logos            | 5 (entregados)  | + versión SVG        | PNG transparente / SVG | 1200×400 horiz, 800×900 vert |
| Doctora          | 1 silueta       | 2 (hero + acerca)    | PNG transparente       | 1200×1500px min              |
| Sonrisas mosaico | 6               | 18                   | JPG                    | 600×600 a 600×1000           |
| Consultorio      | 4               | 6 (extras de backup) | JPG                    | 1200×1500 + 600×600          |
| Open Graph       | 1               | 1                    | JPG                    | 1200×630 exacto              |
| Favicon base     | 1               | 1                    | PNG/SVG                | 512×512 cuadrado             |
| **Total**        | **~18**         | **~32**              |                        |                              |

---

## ✅ Checklist final pre-launch

Antes de publicar, verificar:

- [ ] Todas las imágenes son reales (no placeholders)
- [ ] Formulario envía y llega el correo
- [ ] Botón "Google Maps" abre con la dirección correcta
- [ ] Todos los enlaces de redes sociales van al perfil real
- [ ] Teléfono y correo funcionan al hacer click (`tel:` y `mailto:`)
- [ ] Sitio carga en HTTPS sin warnings
- [ ] Open Graph se ve bien al pegar el link en WhatsApp
- [ ] Favicon aparece en la pestaña del navegador
- [ ] Aviso de privacidad publicado y vinculado
- [ ] Google Analytics enviando datos
- [ ] Lighthouse score > 90 en mobile y desktop
- [ ] Probado en iPhone real y Android real (no solo dev tools)
- [ ] Doctora ha aprobado el contenido final

---

¿Dudas o quieres priorizar algo específico? Empezar por **Fase 1 (contenido) + Fase 2 (formulario)** te deja con un sitio realmente funcional en menos de una semana.
