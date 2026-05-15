# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Static single-page website for **Dra. Lili Nieto**, an orthodontist in San Luis Potosí, México. No build step — plain HTML, CSS, and vanilla JS. Deploy target is Vercel or Netlify.

## File Structure

| File | Purpose |
|------|---------|
| `index.html` | Single page — all sections live here |
| `tokens.css` | Design system: colors, typography, spacing, shadows |
| `styles.css` | Component and layout styles; imports tokens via cascade |
| `assets/` | Logos (PNG), doctor and clinic photos |
| `fonts/` | Self-hosted Quicksand variable font |

## Design System

All visual constants are CSS custom properties in `tokens.css`. Never hard-code colors or spacing; use the tokens.

**Brand colors:** `--color-ametista` (#BD71FF, primary purple), `--color-magnolia` (#F4F3FF, near-white lavender), `--color-malva`, `--color-azul`, `--color-gris`, `--color-sal`, `--color-onix`.

**Typography:** `--font-display` (DM Sans 800) for headings, `--font-body` (Quicksand 300) for body, `--font-ui` (Quicksand 600) for labels/buttons.

**Key utility classes:** `.wrap` (1200px centered container), `.eyebrow` (uppercase section label), `.h-display` (fluid display heading with purple `em` highlight), `.lead` (intro paragraph), `.btn.btn-primary` / `.btn.btn-ghost` (CTA buttons), `.reveal` (scroll-triggered fade-in).

## Page Sections (in order)

`#inicio` (Hero) → `#tratamientos` → `#acerca` → `#ubicacion` → `#contacto` → Footer

## External Dependencies

- **Lucide icons** loaded via CDN (`unpkg.com/lucide`). Icons are declared as `<i data-lucide="icon-name">` and initialized with `lucide.createIcons()`. Plan: replace with inline SVG before launch.
- **Google Fonts** (DM Sans) — loaded via `@import` in `tokens.css`. Plan: self-host before launch.
- No JS framework, no bundler, no package.json.

## Development

Open `index.html` directly in a browser, or use any static server:

```bash
npx serve .
# or
python3 -m http.server
```

## Pre-launch Checklist (see `plan-prod.md` for full detail)

- Replace placeholder images: `.about-img`, `.hero-photo`, `.loc-photo.placeholder`, `.pin-slide` tiles
- Wire up the contact form (Formspree, EmailJS, or WhatsApp redirect)
- Add real social media URLs (Facebook, Instagram)
- Add Open Graph tags, favicon set, Schema.org JSON-LD (`Dentist` type)
- Create `robots.txt` and `sitemap.xml`
- Add privacy notice page and checkbox in contact form (LFPDPPP compliance)
- Self-host fonts and replace Lucide CDN with inline SVG
- Convert images to WebP with `srcset`

## Contact Info (hardcoded in site)

- Address: Av. Eugenio Garza Sada 155-L 11, Lomas del Tecnologico, 78215 San Luis Potosí, S.L.P.
- Phone: 444 219 5371
- Email: drlilinieto@gmail.com
- Hours: Lun–Vie 9:00–19:00 / Sáb 9:00–14:00
