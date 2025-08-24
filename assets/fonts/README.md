This folder should contain the webfont files required by the theme's local @font-face declarations.

Expected layout and filenames (place WOFF2 preferred, WOFF fallback optional):

- assets/fonts/inter/
  - Inter-Regular.woff2
  - Inter-SemiBold.woff2
  - Inter-Bold.woff2

- assets/fonts/fontawesome/
  - fa-solid-900.woff2
  - fa-regular-400.woff2
  - fa-brands-400.woff2

Notes:
- Inter can be obtained from the Inter project (https://github.com/rsms/inter) or exported from Google Fonts using a font download tool. Ensure licensing fits your use.
- Font Awesome webfont files require a Font Awesome license. If you don't have a paid license, consider using the Free variants (fa-*.woff2) from the Font Awesome download for the free icons.
- After placing the files, the theme will use them automatically via the @font-face rules in style.css.
