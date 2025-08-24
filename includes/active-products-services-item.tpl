<!-- ===== Service Item (Rettinger25 — Indigo / Sky / Gray Theme) ===== -->
<style>
  :root{
    --indigo-500:#6366f1; --indigo-600:#4f46e5; --indigo-400:#818cf8;
    --sky-400:#38bdf8; --sky-300:#7dd3fc;
    --gray-900:#111827; --gray-850:#1f2937; --gray-700:#374151;
    --gray-400:#9ca3af; --gray-300:#d1d5db; --gray-200:#e5e7eb;
  }

  /* Karte */
  .div-service-item{
    display:grid;
    grid-template-columns: 1.2fr 2fr auto;
    gap: 1rem;
    align-items: center;
    background: linear-gradient(135deg, rgba(31,41,55,0.85), rgba(31,41,55,0.65));
    border: 1px solid rgba(99,102,241,0.25);
    border-radius: 16px;
    padding: 1.1rem 1.25rem;
    color: var(--gray-200);
    transition: border-color .25s, box-shadow .25s, transform .25s;
    cursor: pointer;
    margin-bottom: 1rem;
  }
  .div-service-item:hover{
    border-color: rgba(56,189,248,0.45);
    box-shadow: 0 18px 50px rgba(56,189,248,0.18);
    transform: translateY(-2px);
  }

  /* Status-Pills */
  .div-service-status{ display:flex; gap:.5rem; align-items:center; flex-wrap:wrap; }
  .label{
    display:inline-flex; align-items:center; justify-content:center;
    border-radius:999px; padding:.2rem .6rem;
    font-size:.75rem; font-weight:800; letter-spacing:.02em;
    border:1px solid transparent; user-select:none; white-space:nowrap;
  }
  .label-placeholder{
    color: var(--gray-400);
    background: rgba(31,41,55,.8);
    border-color: rgba(156,163,175,.35);
  }
  /* Mapping für Modifiers → bleibe im Indigo/Sky-Schema */
  .label-active, .label-ok{
    color: var(--sky-300);
    background: rgba(56,189,248,.12);
    border-color: rgba(56,189,248,.35);
  }
  .label-pending, .label-waiting{
    color: var(--indigo-400);
    background: rgba(129,140,248,.12);
    border-color: rgba(129,140,248,.35);
  }
  .label-suspended, .label-terminated, .label-error{
    color: #e5e7eb;
    background: rgba(99,102,241,.10);
    border-color: rgba(99,102,241,.45);
  }

  /* Name + Domain */
  .div-service-name{ display:flex; flex-direction:column; gap:.25rem; min-width:0; }
  .div-service-name .font-weight-bold{
    font-weight:900; color:#f1f5f9; letter-spacing:.01em;
  }
  .div-service-name .text-domain{
    color:#9ca3af; font-size:.9rem; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;
  }

  /* Buttons / Dropdowns */
  .div-service-buttons{ display:flex; gap:.5rem; align-items:center; justify-content:flex-end; flex-wrap:wrap; }
  .btn{ 
    display:inline-flex; align-items:center; gap:.5rem;
    padding:.5rem .9rem; border-radius:10px; font-weight:800; font-size:.87rem;
    text-decoration:none; border:1px solid transparent; background:transparent; color:var(--gray-200);
    transition: transform .2s, box-shadow .2s, background .2s, color .2s, border-color .2s;
    cursor:pointer;
  }
  .btn-sm{ padding:.45rem .8rem; font-size:.85rem; border-radius:10px; }
  .btn-default{
    color: var(--sky-400); border-color: var(--sky-400);
  }
  .btn-default:hover{
    background: var(--sky-400); color:#0b1220;
  }
  .btn-primary{
    background: linear-gradient(135deg, var(--indigo-500), var(--indigo-600));
    color:#fff; box-shadow:0 8px 24px rgba(99,102,241,.25);
  }
  .btn-primary:hover{ transform: translateY(-1px); box-shadow:0 12px 28px rgba(56,189,248,.35); }
  .btn-group{ position:relative; display:inline-flex; }
  .btn-group-primary .btn-default{ border-color: var(--indigo-500); color: var(--indigo-400); }
  .btn-group-primary .btn-default:hover{ background:var(--indigo-500); color:#fff; }

  .dropdown-toggle{ position:relative; padding-right:2rem; }
  .dropdown-toggle .caret,
  .dropdown-toggle::after{
    content:""; display:inline-block; border-left:5px solid transparent; border-right:5px solid transparent; border-top:6px solid currentColor;
    margin-left:.5rem; transform: translateY(2px);
  }
  .dropdown-menu{
    position:absolute; right:0; top:calc(100% + 6px);
    min-width: 220px;
    background: rgba(31,41,55,.98);
    border:1px solid rgba(99,102,241,.25);
    border-radius:12px; padding:.4rem; list-style:none; margin:0;
    box-shadow:0 20px 50px rgba(56,189,248,.18);
    display:none; z-index:20;
  }
  .btn-group.open > .dropdown-menu{ display:block; }
  .dropdown-item{
    padding:.55rem .7rem; border-radius:8px; font-weight:700; color:#e5e7eb; cursor:pointer;
    display:flex; align-items:center; gap:.5rem;
  }
  .dropdown-item:hover{ background: rgba(56,189,248,.12); color: var(--sky-300); }
  .dropdown-item.disabled{ opacity:.5; cursor:not-allowed; }
  .dropdown-menu-right{ right:0; left:auto; }

  .btn .loading{ display:inline-flex; }
  .btn .loading i{ margin-right:.25rem; }

  /* Info Icon + Details */
  .btn-view-details i{ font-size:1rem; }
  .btn-view-details span:last-child{ font-weight:800; }

  /* A11y */
  .btn:focus-visible, .dropdown-item:focus-visible{
    outline:2px solid var(--sky-400); outline-offset:2px;
  }

  /* Responsive */
  @media (max-width: 900px){
    .div-service-item{ grid-template-columns: 1fr; align-items: start; }
    .div-service-buttons{ justify-content:flex-start; }
  }
</style>

<div class="div-service-item" data-href="clientarea.php?action=productdetails&id={$service->id}">
  <div class="div-service-status">
    <span class="label label-placeholder">
      {$statusProperties[array_key_first($statusProperties)]['translation']}
    </span>

    <!-- 
      WICHTIG:
      Die Modifiers aus WHMCS/Theme mappe ich auf obige Styles.
      Falls deine Modifier anders heißen, ergänze hier weitere .label-<modifier>-Regeln.
      Beispiele: active|ok → label-active, pending|waiting → label-pending, suspended|terminated|error → label-suspended
    -->
    <span class="label label-{$statusProperties[$service->domainStatus]['modifier']}"
          title="{$statusProperties[$service->domainStatus]['translation']}">
      {$statusProperties[$service->domainStatus]['translation']}
    </span>
  </div>

  <div class="div-service-name">
    <span class="font-weight-bold">
      {$service->product->productGroup->name} - {$service->product->name}
    </span>
    <span class="text-domain">{$service->domain}</span>
  </div>

  <div class="div-service-buttons">
    {if !empty($buttonData)}
      <div class="btn-group btn-group-sm btn-group-primary" role="group">
        <button type="button"
                class="btn btn-sm btn-default dropdown-toggle"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false">
          <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
          {foreach $buttonData as $buttonDatum}
            <li class="dropdown-item btn-custom-action{if !$buttonDatum['active']} disabled{/if}"
                data-serviceid="{$buttonDatum['serviceid']}"
                data-identifier="{$buttonDatum['identifier']}"
                data-active="{$buttonDatum['active']}"
                {if !$buttonDatum['active']}disabled="disabled"{/if}>
              <span class="loading" style="display:none;">
                <i class="fas fa-spinner fa-spin"></i>
              </span>
              {$buttonDatum['display']}
            </li>
          {/foreach}
        </ul>
      </div>

      {foreach $accentPrimaryServiceBtns as $accentPrimaryServiceBtn}
        <div class="btn-group btn-group-sm btn-group-secondary" role="group">
          <button class="btn btn-primary btn-sm btn-custom-action{if !$accentPrimaryServiceBtn['active']} disabled{/if}"
                  data-serviceid="{$accentPrimaryServiceBtn['serviceid']}"
                  data-identifier="{$accentPrimaryServiceBtn['identifier']}"
                  data-active="{$accentPrimaryServiceBtn['active']}"
                  {if !$accentPrimaryServiceBtn['active']}disabled="disabled"{/if}>
            <span class="loading" style="display:none;">
              <i class="fas fa-spinner fa-spin"></i>
            </span>
            {$accentPrimaryServiceBtn['display']}
          </button>
        </div>
      {/foreach}

      {if $primaryServiceBtn}
        <div class="btn-group btn-group-sm btn-group-secondary" role="group">
          <button class="btn btn-default btn-sm btn-custom-action{if !$primaryServiceBtn['active']} disabled{/if}"
                  data-serviceid="{$primaryServiceBtn['serviceid']}"
                  data-identifier="{$primaryServiceBtn['identifier']}"
                  data-active="{$primaryServiceBtn['active']}"
                  {if !$primaryServiceBtn['active']}disabled="disabled"{/if}>
            <span class="loading" style="display:none;">
              <i class="fas fa-spinner fa-spin"></i>
            </span>
            {$primaryServiceBtn['display']}
          </button>

          {if $secondaryButtons}
            <div class="btn-group btn-group-sm" role="group">
              <button type="button"
                      class="btn btn-sm btn-default dropdown-toggle"
                      data-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false">
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-right">
                {foreach $secondaryButtons as $secondaryButton}
                  <li class="dropdown-item btn-custom-action{if !$secondaryButton['active']} disabled{/if}"
                      data-serviceid="{$secondaryButton['serviceid']}"
                      data-identifier="{$secondaryButton['identifier']}"
                      data-active="{$secondaryButton['active']}"
                      {if !$secondaryButton['active']}disabled="disabled"{/if}>
                    <span class="loading" style="display:none;">
                      <i class="fas fa-spinner fa-spin"></i>
                    </span>
                    {$secondaryButton['display']}
                  </li>
                {/foreach}
              </ul>
            </div>
          {/if}
        </div>
      {/if}
    {/if}

    <button class="btn btn-default btn-sm btn-view-details">
      <i aria-hidden="true" class="far fa-info-circle" title="{lang key="clientareaviewdetails"}"></i>
      <span class="sr-only">{lang key="clientareaviewdetails"}</span>
      <span>{lang key="clientareaviewdetails"}</span>
    </button>
  </div>
</div>

<script>
  // Karte als Link
  document.addEventListener('click', function(e){
    const card = e.target.closest('.div-service-item');
    if (card && !e.target.closest('.btn, .dropdown-menu, .dropdown-item')) {
      const href = card.getAttribute('data-href');
      if (href) window.location.href = href;
    }
  });

  // Dropdown-Toggles (ohne jQuery/Bootstrap)
  document.addEventListener('click', function(e){
    const toggle = e.target.closest('.dropdown-toggle');
    const groups = document.querySelectorAll('.btn-group');
    if (toggle) {
      const group = toggle.closest('.btn-group');
      const isOpen = group.classList.contains('open');
      groups.forEach(g => g.classList.remove('open'));
      if (!isOpen) group.classList.add('open');
      e.stopPropagation();
      e.preventDefault();
    } else {
      // Klick außerhalb → alle schließen
      groups.forEach(g => g.classList.remove('open'));
    }
  });
</script>
