# ML Design Instructions

## Theme

- Always use a **dark theme**.
- **Background colors:**  
    - `gray-900` for body  
    - `gray-850` for cards/sections
- **Accent colors:**  
    - Indigo (`500/600/700`) for primary actions  
    - Sky (`400/500`) for links, hover, and secondary actions
- **Text colors:**  
    - Standard: White (`#fff`)  
    - Secondary: `gray-300`  
    - Meta: `gray-500`
- **Font:** Inter (Google Fonts)

## Typography

- Use Inter font for all components.
- **Headings:** Bold (`700–900`), optionally with Indigo→Sky gradient.
- **Body text:** Weight `400–500`, color `gray-300`.
- **Meta info:** Weight `400`, color `gray-500`.
- Maintain a clear hierarchy: Hero > Section > Card > Body.

## Layout

- **Container:** Max width 1200px, side padding 16px.
- **Section padding:** ~60px top and bottom.
- **Grids:**  
    - Use flexible CSS grids for stats, features, pricing, news, etc.
    - **Breakpoints:**  
        - XL (≥1200px): 4 columns  
        - LG (≥992px): 3 columns  
        - MD (≥768px): 2 columns  
        - SM (<768px): 1 column

## Component Guidelines

### Header

- Background: `gray-850`
- Sticky on scroll
- Links: `gray-300`, hover `sky-400`
- Right: CTA buttons (outline + primary)

### Hero

- Background: Indigo-700→Indigo-600 gradient
- Title: Large, Indigo→Sky gradient
- Subtitle: `gray-300`
- Two buttons: Primary (Indigo), Outline (Sky)
- Stats grid below

### Features / Why

- Cards: `gray-850`
- Hover: subtle lift + shadow
- Icons: Sky, text: White/`gray-300`
- Bullet lists: `gray-300`

### Tech

- 6 cards in grid, same style as features

### News

- 4-card grid
- Featured card: Indigo border
- Date: `gray-500`, category bold, title/link: Sky

### Newsletter / WhatsApp

- Large card with two areas:  
    - Left: Icon, content  
    - Right: CTA in WhatsApp green

### Pricing

- 3 cards in grid
- Popular card: Sky border
- Specs: dashed line
- Button: full width

### Footer

- Background: `gray-850`
- 4 columns: Services, Support, Company, Legal
- Links: `gray-300`, hover `sky-400`
- Footer bottom: text `gray-500`

## Buttons

- **Primary:** Indigo, hover lighter Indigo
- **Outline:** Sky border, hover filled Sky + white text
- **Success:** Green (e.g., WhatsApp, Order)
- **Link:** Sky text, no background


### Other UI Elements (Details)

- **Alerts:**  
    - Use a card-style container with rounded corners and subtle shadow.
    - Always include a left-aligned icon matching the alert type (Info: Sky, Success: Green, Warning: Orange, Error: Red).
    - Title in bold, message in regular weight.
    - Dismiss button (Sky for Info, Green for Success, Orange for Warning, Red for Error), top-right, only visible on hover.
    - Padding: 20–24px vertical, 24–32px horizontal.
    - Spacing between icon and text: 16px.

- **Breadcrumb:**  
    - Horizontal layout, vertically centered.
    - Links: Sky color, underline on hover.
    - Last item: Indigo, bold, no link.
    - Separator: "›" in `gray-500`, 8px horizontal spacing.
    - Responsive: Collapses to single "Home › … › Current" on mobile.

- **Tables:**  
    - Background: `gray-850`.
    - Header row: `gray-900`, bold, Sky underline on hover.
    - Rows: Alternate between `gray-850` and `gray-900`.
    - Row hover: Sky background highlight, text turns white.
    - Borders: None, except subtle bottom border (`gray-800`).
    - Pagination: Sky for active page, `gray-500` for others.

- **Service Items:**  
    - Card layout, background `gray-850`, rounded corners, shadow on hover.
    - Status label: Top-right, pill-shaped, color-coded (Active: Sky, Error: Red, Pending: Indigo).
    - Service icon left, name/title bold, meta info below in `gray-500`.
    - Action buttons: Sky outline, full width on mobile.

- **Domain Search:**  
    - Input: Full width, background `gray-900`, border Sky, rounded.
    - Buttons: Indigo (search), Sky (clear), both with icon.
    - TLD logos: Small cards, `gray-850` background, Sky border on hover.
    - Suggestions dropdown: Dark, shadow, Sky highlight on hover.

- **Modals:**  
    - Overlay: Semi-transparent black (`rgba(0,0,0,0.7)`).
    - Modal: `gray-900` background, rounded corners, max-width 480px.
    - Header: Bold, Indigo text, bottom border Sky.
    - Footer: Actions right-aligned, Sky/Indigo buttons.
    - Close button: Top-right, Sky on hover.
    - Focus trap and ESC to close for accessibility.

- **Forms:**  
    - Inputs: `gray-850` background, Sky border on focus, rounded, white text.
    - Labels: `gray-300`, bold.
    - Helper/error text: `gray-500` (helper), Red (error).
    - Checkbox/radio: Custom, Sky accent, larger touch area.
    - Spacing: 16–24px vertical between fields.

- **Tooltips:**  
    - Background: `gray-900`, text: `gray-300`, Sky border.
    - Arrow points to trigger, subtle shadow.
    - Small font, padding 8–12px.

- **Badges:**  
    - Pill-shaped, small font, bold.
    - Color: Sky (info), Green (success), Orange (warning), Red (error), Indigo (default).
    - Used for status, categories, or highlights.

- **Loaders/Spinners:**  
    - Circular, Sky or Indigo color.
    - Centered in container, subtle shadow.
    - Use for async actions, overlays, or inline loading.

- **Tabs:**  
    - Horizontal, background `gray-850`.
    - Active tab: Indigo underline, bold, white text.
    - Inactive: `gray-300`, hover Sky text.
    - Responsive: Scrollable on mobile.

- **Accordions:**  
    - Card-style, `gray-850` background, rounded.
    - Title: Bold, Sky arrow icon rotates on open.
    - Content: `gray-300`, padding 16–24px.
    - Only one open at a time (optional).

- **Avatars:**  
    - Circular, `gray-900` background, Sky border.
    - Initials or image, small shadow.
    - Used in user menus, comments, etc.

- **Chips:**  
    - Small, rounded, Sky or Indigo background, white text.
    - Removable with close icon (Sky on hover).

- **Progress Bars:**  
    - Background: `gray-850`, bar: Sky or Indigo.
    - Rounded ends, subtle shadow.
    - Label above or inside bar, `gray-300`.

- **Pagination:**  
    - Sky for active, `gray-500` for inactive.
    - Rounded buttons, hover Sky background.
    - Next/Prev icons, larger touch area on mobile.

- **Empty States:**  
    - Centered icon (Sky), title bold, message `gray-500`.
    - CTA button below (Indigo or Sky).

- **Cards:**  
    - Use for grouping content (features, pricing, news, etc.).
    - `gray-850` background, rounded, shadow on hover.
    - Padding: 24–32px, spacing between elements.
    - Optional border: Sky or Indigo for emphasis.

- **Dividers:**  
    - Horizontal: `gray-800`, 1px height, full width.
    - Vertical: `gray-800`, 1px width, used in toolbars/menus.

- **Icons:**  
    - Use outline style, Sky or Indigo color.
    - Consistent size (20–24px), align with text.

- **Notifications:**  
    - Slide-in from top-right, dark background, Sky/Indigo accent.
    - Dismissible, auto-hide after 5s.
    - Icon, title, message, action button (optional).

- **Timeline/Steps:**  
    - Vertical or horizontal, Sky/Indigo dots, connecting line.
    - Step title bold, meta `gray-500`.
    - Current step: Indigo, completed: Sky, upcoming: `gray-500`.

- **Switches:**  
    - Rounded, Sky accent when on, `gray-700` when off.
    - Thumb: White, shadow.
    - Label left or right, `gray-300`.

- **Menus/Dropdowns:**  
    - `gray-900` background, Sky highlight on hover.
    - Rounded, shadow, white text.
    - Separator: `gray-800`.

- **Tags:**  
    - Small, Sky or Indigo background, white text.
    - Used for categorization, removable.

- **Calendar/Date Picker:**  
    - Dark background, Sky highlight for selected, Indigo for today.
    - Days: `gray-300`, disabled: `gray-700`.
    - Navigation: Sky icons.

- **Stepper:**  
    - Horizontal, Sky/Indigo steps, connecting line.
    - Current: Indigo, completed: Sky, upcoming: `gray-500`.
    - Step label below icon.

- **Slider:**  
    - Track: `gray-800`, filled: Sky.
    - Thumb: Indigo, shadow, focus Sky outline.

- **File Upload:**  
    - Drop area: Dashed Sky border, `gray-850` background.
    - Icon: Sky, text `gray-300`.
    - Progress bar below, Sky color.

- **Avatar Group:**  
    - Overlapping avatars, Sky border, max 5 shown, "+N" badge for overflow.

- **Rating Stars:**  
    - Sky filled, `gray-700` empty.
    - Interactive, hover/focus Sky outline.

- **Timeline:**  
    - Vertical, Sky/Indigo dots, `gray-800` line.
    - Event title bold, meta `gray-500`.

- **Tooltip:**  
    - Dark background, Sky border, white text.
    - Arrow, subtle shadow, small font.

- **Scrollbars:**  
    - Custom: `gray-800` track, Sky thumb, rounded.

- **Code Blocks:**  
    - `gray-900` background, Sky border left, white text.
    - Monospace font, copy button (Sky on hover).

- **Syntax Highlighting:**  
    - Use Sky, Indigo, Green, Orange, Red for code tokens.
    - Background: `gray-900`, text: white/`gray-300`.

- **Charts:**  
    - Dark background, Sky/Indigo lines or bars.
    - Axis: `gray-700`, labels `gray-300`.
    - Tooltip: Sky background, white text.

- **Map:**  
    - Dark theme, Sky/Indigo markers.
    - Controls: Sky icons, rounded.

---

- **Alerts:**  
    - Info: Sky  
    - Success: Green  
    - Warning: Orange  
    - Error: Red  
    - Always with icon
- **Breadcrumb:** Links in Sky, last item Indigo, separator "›"
- **Tables:** Dark, alternating row colors, hover Sky highlight
- **Service items:** Cards with status label (active Sky, error Red, pending Indigo)
- **Domain search:** Input + buttons (Indigo/Sky), TLD logos as small cards
- **Modals:** Dark theme, rounded, distinct header/footer

## Responsive Behavior

- Grids auto-reduce on mobile
- Buttons: full width on small screens
- Hero title scales down

## Interactions

- **Hover:** Subtle movement + stronger shadow
- **Active:** Button slightly pressed in
- **Disabled:** 60% opacity, no hover, cursor "not-allowed"
- **Focus:** Clear Sky outline for accessibility

---

### Copilot Quick Rule

> Always use dark theme (`gray-900/850`), Indigo for primary, Sky for secondary elements. Text is white/`gray-300`, meta `gray-500`. Typography with Inter, bold/clear headings, buttons as per schema (Primary Indigo, Outline Sky). Layout uses 1200px container and flexible grids. Keep hover/active/focus states consistent. Alerts, service items, pricing, and news must fit the same schema.
