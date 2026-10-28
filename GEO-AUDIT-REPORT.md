# GEO Audit Report: KERF 3D STUDIO

**Audit Date:** October 29, 2026  
**Target Domain:** `https://kerf3d.store` (Audited on Production-Mirror Fleet `http://localhost:8080`)  
**Business Type:** E-commerce / Precision On-Demand Additive Manufacturing  
**Pages Analyzed:** 7 Core Templates (`/`, `/shop`, `/product/:slug`, `/quote`, `/materials`, `/track`, `/checkout`)  
**Auditor:** GEO-SEO Multi-Agent Audit Engine  

---

## Executive Summary

**Overall GEO Score: 47 / 100 (Rating: Poor — Weak GEO Signals)**

KERF 3D Studio possesses exceptional foundational engineering assets: **100% Server-Side Rendered (SSR) HTML**, instantaneous OpenLiteSpeed response times, robust HTTP security headers, and tangible hardware telemetry (calibrated Bambu Lab A1 fleet in Dhaka, ±0.15mm tolerances, and physical polymer specifications). 

However, the site is currently **under-optimized for Generative Engine Discovery (ChatGPT Search, Perplexity AI, Claude, and Google AI Overviews)**. The most severe vulnerabilities include a **total absence of Schema.org JSON-LD structured data**, missing `/llms.txt` and `/llms-full.txt` files, low passage citability due to aesthetic prose that lacks self-contained answer blocks, and minimal entity disambiguation linking the Dhaka workshop to external authority nodes.

### Score Breakdown

| Category | Score | Weight | Weighted Score | Grade | Status |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **AI Citability** | 34 / 100 | 25% | 8.5 | F | Needs self-contained answer blocks & statistical density |
| **Brand Authority & Entity** | 42 / 100 | 20% | 8.4 | F | Lacks `sameAs` social links, entity disambiguation |
| **Content E-E-A-T** | 68 / 100 | 20% | 13.6 | D+ | Strong hardware telemetry; needs author byline & trust badges |
| **Technical GEO Infrastructure** | 72 / 100 | 15% | 10.8 | C | High-speed SSR; lacks `/llms.txt` & AI crawler directives |
| **Schema & Structured Data** | 12 / 100 | 10% | 1.2 | Critical | **0 schema definitions** found on homepage & product pages |
| **Platform-Specific Readiness** | 45 / 100 | 10% | 4.5 | F | Unoptimized for Perplexity & Google AI Overviews Q&A |
| **COMPOSITE GEO SCORE** | | | **47.0 / 100** | **POOR** | **Significant AI Discovery Upside Available** |

---

## Issue Severity Classification

### 1. Critical Issues (Fix Immediately)
1. **Zero Structured Data (Schema.org JSON-LD Missing)**:
   - *Impact*: AI engines cannot parse prices (BDT), product availability, material properties, or organization credentials programmatically.
   - *Fix*: Inject `Organization` and `LocalBusiness` JSON-LD on `/`, and dynamic `Product` + `Offer` schema on all `/product/:slug` views.

### 2. High Priority Issues (Fix Within 1 Week)
1. **Missing `/llms.txt` and `/llms-full.txt`**:
   - *Impact*: Modern AI crawlers seeking a concise index of the catalog and service specs receive HTTP 404.
   - *Fix*: Publish an `/llms.txt` markdown index describing Kerf 3D Studio, available materials (PLA, PETG, TPU 95A, PA-CF), instant CAD quoting, and product catalog URLs.
2. **Low AI Passage Citability (Average Score: 23.6 - 38.0)**:
   - *Impact*: Existing body text is concise marketing copy (20–36 words). LLMs prioritize self-contained 134–167 word factual paragraphs with definition patterns ("X is...", "The tolerance for Bambu Lab A1 printing in Dhaka is ±0.15mm...").
   - *Fix*: Add dedicated technical FAQ and factual answer blocks to `/`, `/materials`, and `/quote`.
3. **No Explicit AI Crawler Rules in `robots.txt`**:
   - *Impact*: `robots.txt` defaults to `User-agent: *`. Explicitly welcoming `GPTBot`, `ClaudeBot`, `PerplexityBot`, and `Google-Extended` guarantees crawl prioritization.
   - *Fix*: Add explicit `User-agent: GPTBot`, `User-agent: ClaudeBot`, `User-agent: PerplexityBot` allow blocks with link to `Sitemap` and `llms.txt`.

### 3. Medium Priority Issues (Fix Within 1 Month)
1. **Missing Entity Disambiguation (`sameAs` links)**:
   - *Impact*: AI search models cannot map "Kerf 3D Studio" to external verified entities (MakerWorld, Facebook, LinkedIn, Google Maps).
   - *Fix*: Add an `Organization` schema `sameAs` array with links to MakerWorld profile, WhatsApp business, and social channels.
2. **Product Pages Lack Technical Specs Summary Table**:
   - *Impact*: Perplexity and Claude prioritize structured comparison tables when answering "Which 3D printed AirPods case is best?".
   - *Fix*: Add an HTML comparison table for dimensions, weight, layer height, and polymer grade in product dossiers.

### 4. Low Priority Issues (Optimize When Possible)
1. **Missing Explicit `HSTS` and `Permissions-Policy` HTTP Headers**.
2. **Missing `BreadcrumbList` Schema on Shop and Product Pages**.

---

## Category Deep Dives

### 1. AI Citability (Score: 34 / 100 — Grade: F)
- **Empirical Test Results (`citability_scorer.py`)**:
  - Homepage average: **23.6 / 100** (5 content blocks analyzed; 0 optimal-length passages).
  - Materials page average: **38.0 / 100** (3 content blocks analyzed; Grade D).
- **Primary Bottleneck**: Copy is concise and brutalist, but lacks explicit definition patterns and factual density.
- **Before / After Rewrite Example for Homepage**:
  - *Current (Word Count: 26 — Citability: 26/100)*:
    > "Curated tactile artifacts and on-demand FDM additive manufacturing. Printed in Dhaka on calibrated Bambu Lab A1 hardware using architectural Bio-PLA, PETG, TPU 95A, ASA, and PA-CF."
  - *GEO-Optimized Passage (Word Count: 142 — Citability: 88/100)*:
    > "Kerf 3D Studio is an architectural additive manufacturing atelier and design store located in Dhaka, Bangladesh. Operating a fleet of direct-drive Bambu Lab A1 3D printers, the studio provides precision FDM fabrication with a build envelope of 256×256×256 mm and mechanical tolerances calibrated to ±0.15 mm. The workshop stocks engineering-grade thermoplastics including renewable Bio-PLA (starting at ৳140 per specimen), chemical-resistant PETG, flexible TPU 95A for vibration dampeners, and carbon-fiber-reinforced PA-CF with thermal resistance up to 150°C. For industrial designers and architects, Kerf 3D provides an instant online volumetric slicing calculator that evaluates uploaded STL, OBJ, and 3MF geometry against Bambu Studio toolpath profiles. Standard workshop fulfillment delivers within 24 to 48 hours inside Dhaka (with free shipping on orders exceeding ৳1,200) and nationwide courier delivery within 2 to 4 days across Bangladesh."

### 2. Brand Authority & Entity Recognition (Score: 42 / 100 — Grade: F)
- **Current Strengths**: Coordinates (`23.8103° N, 90.4125° E`), hardware attribution (Bambu Lab A1), MakerWorld model credit citations, and direct WhatsApp contact (+880 1754-550297).
- **Gaps**: No Google Business Profile Knowledge Panel linked, missing `sameAs` entity citations in structured data, no Wikipedia or Wikidata entity anchor.

### 3. Content E-E-A-T Quality (Score: 68 / 100 — Grade: D+)
- **Experience (High)**: Clear physical workshop specifications, actual Bambu Lab A1 nozzle calibrations (0.2mm, 0.4mm, 0.6mm), gyroid/honeycomb infills.
- **Expertise (High)**: Polymer behavior documentation on `/materials` (Young's modulus, heat deflection, dimensional shrinkage).
- **Authoritativeness (Moderate)**: Needs explicit technician / engineering lead profile to boost Google E-E-A-T signals.
- **Trustworthiness (High)**: Transparent BDT pricing, real-time ticket tracking (`/track`), physical invoice receipts with barcode, explicit Dhaka delivery SLAs.

### 4. Technical GEO Infrastructure (Score: 72 / 100 — Grade: C)
- **SSR (Server-Side Rendering)**: **10/10**. CodeIgniter 4 delivers fully rendered HTML to bots without requiring a headless browser to execute JavaScript.
- **Speed & Caching**: **9.5/10**. OpenLiteSpeed response time < 50ms locally.
- **Security Headers**: **8.5/10**. `x-frame-options: SAMEORIGIN`, `x-content-type-options: nosniff`, `referrer-policy: same-origin` active.
- **AI Crawler Readiness**: **3/10**. No `/llms.txt` endpoint; `robots.txt` does not explicitly name AI crawlers.

### 5. Schema & Structured Data (Score: 12 / 100 — Grade: Critical)
- **Current Coverage**: 0% JSON-LD present.
- **Required Schemas**:
  1. `Organization`: Name, URL, Logo, ContactPoint, Address, sameAs.
  2. `LocalBusiness`: Location, geo coordinates, opening hours, areaServed ("Dhaka, Bangladesh").
  3. `Product` & `Offer`: Name, description, image, SKU, priceCurrency ("BDT"), price, availability, material, brand.
  4. `FAQPage`: Common questions regarding 3D printing cost, tolerances, file formats, and delivery in Dhaka.

### 6. Platform-Specific Optimization (Score: 45 / 100 — Grade: F)
- **Google AI Overviews**: High potential due to clean HTML, but needs question-based H2/H3 headers and FAQ JSON-LD.
- **Perplexity AI**: Demands numerical density, comparative tables, and clear technical references.
- **ChatGPT Search / OpenAI**: Heavily prioritizes sites exposing an `/llms.txt` file and structured pricing metadata.

---

## 90-Day GEO Implementation Roadmap

### Phase 1: Immediate Baseline Fixes (Days 1–14) — Target Score: 75/100
- [ ] **Generate & Publish `/llms.txt` and `/llms-full.txt`**: Complete catalog and material index for LLM ingestion.
- [ ] **Deploy Schema.org JSON-LD**:
  - `Organization` & `LocalBusiness` on all layouts.
  - `Product` + `Offer` on `/product/:slug`.
  - `FAQPage` on `/quote` and `/materials`.
- [ ] **Update `robots.txt`**: Add explicit allow directives for `GPTBot`, `ClaudeBot`, `PerplexityBot`, and `Google-Extended`.

### Phase 2: Citability & Information Gain (Days 15–45) — Target Score: 85/100
- [ ] **Embed Q&A Citability Blocks**: Add 4–6 comprehensive definition blocks answering key 3D printing queries in Dhaka (140–160 words each).
- [ ] **Add Comparison Data Tables**: Include technical comparison matrices on `/materials` (Tensile strength, Glass transition temp, Price/gram).

### Phase 3: Entity Authority & Disambiguation (Days 46–90) — Target Score: 92+/100
- [ ] **Link Authority Entities**: Add `sameAs` links to MakerWorld atelier profile, Google Business profile, and social channels.
- [ ] **Publish Customer Case Studies & Mechanical Tolerances Report**.

---

## Quick Wins Checklist

| Action | Estimated Effort | Impact on GEO Score |
| :--- | :---: | :---: |
| 1. Create `/llms.txt` in `public/` | 15 mins | **+8 Points** |
| 2. Add Organization & Product JSON-LD | 30 mins | **+12 Points** |
| 3. Update `robots.txt` for AI user-agents | 5 mins | **+5 Points** |
| 4. Add 3 factual 150-word answer blocks to Homepage | 25 mins | **+9 Points** |
| **Combined Quick-Win Potential** | **~75 mins** | **47 -> 81 / 100 (Good)** |
