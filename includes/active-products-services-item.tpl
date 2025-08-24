<!-- ===== Service Item (Rettinger25 — Indigo / Sky / Gray Theme) ===== -->
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
