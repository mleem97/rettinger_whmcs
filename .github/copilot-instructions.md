## Quick orientation — Rettinger25 WHMCS theme

This repository is a WHMCS theme composed of Smarty templates (.tpl), static assets (CSS/JS/images), and a small demo page. The goal of these instructions is to help an AI coding agent become productive quickly by pointing out the project's structure, conventions, and important editing rules.

1) Big picture
- Template layer: `.tpl` files at repo root and `store/`, `includes/` implement WHMCS pages (server-side rendered by WHMCS/PHP). Example: `includes/head.tpl`, `oauth/layout.tpl`, `viewinvoice.tpl`.
- Static assets: `style.css` (main theme CSS), `assets/css/*`, `assets/img/*`, `assets/fonts/*`, `icons/*` and `js/*` provide visuals and client behavior. `script.js` contains theme demo behaviors (vanilla JS modal handlers, placeholders).
- Vendor JS: `js/scripts.js` / `js/scripts.min.js` contains bundled/third-party libraries (jQuery, Bootstrap, DataTables, etc.). Treat these as vendor code — avoid editing unless necessary.

2) Key files to read first
- `style.css` — central CSS variables, @font-face references and component styles. Uses CSS variables (`:root`) for Indigo / Sky / Gray palette.
- `includes/head.tpl` — where CSS/JS assets are included in pages.
- `assets/css/fontawesome-all.min.css` — local shim that maps legacy `.fa` classes to the local webfont.
- `assets/fonts/README.md` — documents expected webfont filenames and where to place them.
- `icons/icons.css` + `icons/icons.js` — local inline SVG masks and tiny accessibility helper used by the demo.
- `script.js` — demo interactivity and lightweight modal implementation (vanilla JS).

3) Conventions & patterns
- Theme is dark-first. Colors are defined as CSS variables in `style.css`. Use those variables for new components (e.g. `var(--indigo-500)`, `var(--sky-400)`, `var(--gray-850)`).
- Fonts: the theme expects local webfonts under `/assets/fonts/` and uses @font-face in `style.css`. Current filenames expected in repo (update if different):
  - Inter variable fonts: `Inter-Variable.woff2` and `Inter-Italic-Variable.woff2` (if available use these in @font-face with weight-range/variation settings)
  - Font Awesome webfonts: `fa-solid-900.woff2`, `fa-regular-400.woff2`, `fa-brands-400.woff2`
- Avoid changing vendor/minified files (e.g. `js/scripts.js`, `js/scripts.min.js`). If functionality must be refactored, wrap or replace behavior in new files (e.g. add `assets/js/patch-*.js`).
- Accessibility touches: focus outlines use `--sky-400`; modals implement ESC and backdrop click handlers in `script.js`. Keep these patterns when porting behavior.

4) External dependencies & integration points
- WHMCS server-side rendering: templates are processed by WHMCS/PHP — to fully test template logic you must run inside a WHMCS instance.
- Third-party embeds: templates include optional external scripts (Twitter widgets, Cloudflare Turnstile, Vimeo). These were intentionally commented/guarded in templates — prefer optional/local alternatives.
- Fonts must be supplied locally (not committed here). Place Inter and Font Awesome woff2 files under `assets/fonts/` following `assets/fonts/README.md`.

5) Developer workflows & quick checks
- Static visual smoke test (fast): run a local static server from the repo root and open `demo.html` in browser. This verifies CSS/JS/static assets but not WHMCS PHP logic.

  PowerShell (from repo root):
  ```powershell
  python -m http.server 8000
  # then open http://localhost:8000/demo.html in a browser
  ```

- Full integration: to test templates in context deploy theme to a WHMCS installation (PHP + MySQL) and enable the theme in WHMCS admin.

6) Editing rules for AI agents
- Preserve vendor license headers and minified bundles — do not reformat vendor files. If you must replace a vendor library, add the new library under `assets/js/` and update `includes/head.tpl` to include it locally.
- When changing fonts, update `style.css` @font-face blocks only; leave `assets/css/fontawesome-all.min.css` as a minimal shim unless you can provide full mapping files.
- Prefer non-breaking changes in templates: add new markup and classes rather than removing existing classes used elsewhere. Many templates still use Bootstrap-like classes; changing them can have wide effects.
- When introducing JS changes that replace jQuery behavior, add small vanilla helpers (e.g. `assets/js/vanilla-helpers.js`) and include them via `includes/head.tpl` rather than editing `js/scripts.js`.

7) Common patterns & examples
- Modal handling: `script.js` uses data attributes `data-toggle='modal'`, `data-target` and `data-dismiss='modal'` with vanilla handlers. Mirror that approach when adding modal triggers.
- Icons: demo uses `icons/icons.css` (SVG masks) and a local Font Awesome webfont. Templates still contain `<i class="fa ...">` markup — the shim `assets/css/fontawesome-all.min.css` maps those to the local webfont.
- Domain search: `includes/domain-search.tpl` contains the search UI with Turnstile integration commented; use `turnstile-wrapper` class when styling.

8) What an AI agent should ask before large changes
- Do you want full removal/porting of jQuery/Bootstrap behaviors, or should those remain (served locally) to preserve compatibility?
- Where will webfont binaries be placed and what are the exact filenames? (`Inter-Variable.woff2` vs older Inter-Regular names)

9) Where to look for follow-up context
- Templates: root .tpl files, `includes/`, `store/` subfolders.
- CSS and fonts: `style.css`, `assets/css/`, `assets/fonts/`.
- JS: `script.js` (theme), `js/scripts.js` (vendor), `icons/`.

If you want, I will merge these notes into `.github/copilot-instructions.md` (this file) and can update the `@font-face` blocks in `style.css` to reference your `Inter-Variable` files — tell me the exact filenames and I'll patch them.
