<!-- ===== Domain Search (Rettinger25 — Indigo / Sky / Gray Theme) ===== -->
<!-- Turnstile Script: optional remote include. If you host Turnstile locally or via your platform, remove this line and ensure the script is loaded once in the page head. -->
{* Optional: enable Turnstile by configuring your site to load the Turnstile script in the page head. This template leaves the explicit external include commented so the theme itself doesn't force a remote dependency. *}
<!-- <script src="https://challenges.cloudflare.com/turnstile/v0/api.js" async defer></script> -->

<!-- Domain search styles moved to style.css -->

<form method="post" action="domainchecker.php" id="frmDomainHomepage">
  <div class="home-domain-search">
    <div class="container">
      <div class="p-5 clearfix">
        <h2 class="text-center">{lang key="secureYourDomainShort"}</h2>

        <!-- Hidden: Transfer-Flag, wird per Button gesetzt -->
        <input type="hidden" name="transfer" />

        <div class="input-group-wrapper">
          <div class="input-group">
            <input type="text" class="form-control" name="domain" placeholder="{lang key="exampledomain"}" autocapitalize="none">

            <!-- Desktop Buttons -->
            <span class="input-group-append d-none d-sm-block" style="display:flex; gap:.5rem;">
              {if $registerdomainenabled}
                <button type="submit" class="btn btn-primary" id="btnDomainSearch">
                  {lang key="search"}
                </button>
              {/if}
              {if $transferdomainenabled}
                <button type="submit" id="btnTransfer" data-domain-action="transfer" class="btn btn-success">
                  {lang key="domainstransfer"}
                </button>
              {/if}
            </span>
          </div>
        </div>

        <!-- Mobile Buttons -->
        <div class="row d-sm-none" style="display:none;">
          {if $registerdomainenabled}
            <div class="col-6">
              <button type="submit" class="btn btn-primary btn-block" id="btnDomainSearch2">
                {lang key="search"}
              </button>
            </div>
          {/if}
          {if $transferdomainenabled}
            <div class="col-6">
              <button type="submit" id="btnTransfer2" data-domain-action="transfer" class="btn btn-success btn-block">
                {lang key="domainstransfer"}
              </button>
            </div>
          {/if}
        </div>

        <!-- Turnstile statt integriertem Captcha -->
        <div class="turnstile-wrapper">
          <div class="cf-turnstile"
               data-sitekey="DEIN_TURNSTILE_SITEKEY"
               data-theme="dark"
               data-action="domain-search">
          </div>
        </div>

        {if $featuredTlds}
          <ul class="tld-logos">
            {foreach $featuredTlds as $num => $tldinfo}
              {if $num < 3}
                <li>
                  <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png" alt="{$tldinfo.tldNoDots}">
                  {if is_object($tldinfo.register)}
                    {$tldinfo.register->toFull()}
                  {else}
                    {lang key="domainregnotavailable"}
                  {/if}
                </li>
              {/if}
            {/foreach}
          </ul>
        {/if}

        <a href="{routePath('domain-pricing')}" class="btn btn-link btn-sm float-right">{lang key='viewAllPricing'}</a>
      </div>
    </div>
  </div>
</form>

<script>
  (function(){
    // Buttons "Transfer" setzen das Hidden-Feld
    function markTransfer(btn){
      var action = btn && btn.getAttribute('data-domain-action');
      var input = document.querySelector('#frmDomainHomepage input[name="transfer"]');
      if (!input) return;
      // Bei Transfer → beliebigen Wert setzen (WHMCS erwartet "transfer" o.ä.)
      input.value = action === 'transfer' ? 'true' : '';
    }

    document.addEventListener('click', function(e){
      var t = e.target.closest('#btnTransfer, #btnTransfer2, #btnDomainSearch, #btnDomainSearch2');
      if (!t) return;
      markTransfer(t);
    });

    // Optional: Wenn Benutzer Tippt + Enter drückt, Transfer zurücksetzen (Standard: Registrierung)
    var domainInput = document.querySelector('#frmDomainHomepage input[name="domain"]');
    if (domainInput){
      domainInput.addEventListener('keydown', function(e){
        if (e.key === 'Enter'){
          var transfer = document.querySelector('#frmDomainHomepage input[name="transfer"]');
          if (transfer) transfer.value = '';
        }
      });
    }
  })();
</script>
