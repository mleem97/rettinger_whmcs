<!-- ===== Domain Search (Indigo / Sky / Gray Theme) ===== -->
<!-- Turnstile Script (in <head> deiner Seite einfügen, falls noch nicht vorhanden) -->
<script src="https://challenges.cloudflare.com/turnstile/v0/api.js" async defer></script>

<style>
  :root{
    --indigo-500:#6366f1; --indigo-600:#4f46e5; --indigo-400:#818cf8;
    --sky-400:#38bdf8; --sky-300:#7dd3fc;
    --gray-900:#111827; --gray-850:#1f2937; --gray-700:#374151; --gray-400:#9ca3af; --gray-200:#e5e7eb;
    --success-500:#10b981;
  }

  .home-domain-search{
    background: linear-gradient(135deg, var(--gray-900) 0%, var(--gray-850) 100%);
    color: var(--gray-200);
    border-top: 1px solid rgba(99,102,241,.25);
    border-bottom: 1px solid rgba(99,102,241,.25);
  }
  .home-domain-search .p-5{ padding:3rem 1.25rem; }
  .home-domain-search h2{
    font-size:2rem; font-weight:900; text-align:center; margin:0 0 1.25rem;
    background: linear-gradient(135deg, #fff, var(--gray-200));
    -webkit-background-clip:text; -webkit-text-fill-color:transparent;
  }

  /* Input Group */
  .input-group-wrapper{ max-width: 900px; margin: 1.5rem auto; }
  .input-group{
    display:flex; align-items:stretch; gap:.5rem; background: rgba(31,41,55,.6);
    border:1px solid rgba(99,102,241,.25);
    border-radius:14px; padding:.35rem; box-shadow:0 16px 40px rgba(56,189,248,.12);
  }
  .form-control{
    flex:1 1 auto; background:transparent; border:none; outline:none; color:#e5e7eb;
    padding:.9rem 1rem; font-size:1.05rem; border-radius:10px;
  }
  .form-control::placeholder{ color: var(--gray-400); }

  /* Buttons */
  .btn{
    display:inline-flex; align-items:center; justify-content:center; gap:.5rem;
    border-radius:10px; font-weight:800; font-size:.95rem; text-decoration:none; cursor:pointer;
    border:1px solid transparent; transition: transform .2s, box-shadow .2s, background .2s, color .2s, border-color .2s;
    padding:.9rem 1.25rem; white-space:nowrap;
  }
  .btn-block{ width:100%; }
  .btn-primary{
    background: linear-gradient(135deg, var(--indigo-500), var(--indigo-600));
    color:#fff; box-shadow:0 8px 24px rgba(99,102,241,.25);
  }
  .btn-primary:hover{ transform: translateY(-1px); box-shadow:0 12px 28px rgba(56,189,248,.35); }
  .btn-success{
    background: linear-gradient(135deg, var(--sky-400), var(--sky-300));
    color:#0b1220; border-color: transparent;
  }
  .btn-success:hover{ transform: translateY(-1px); box-shadow:0 12px 28px rgba(56,189,248,.35); }

  /* Featured TLDs */
  .tld-logos{ list-style:none; display:flex; gap:1.5rem; justify-content:center; margin:1.5rem 0 0; padding:0; flex-wrap:wrap; }
  .tld-logos li{
    background: rgba(31,41,55,.6); border:1px solid rgba(99,102,241,.25); border-radius:12px;
    padding:.6rem .9rem; color:#cbd5e1; display:flex; align-items:center; gap:.6rem;
  }
  .tld-logos img{ height:24px; width:auto; display:block; }

  /* Link rechts unten */
  .btn-link.btn-sm.float-right{
    color: var(--sky-400); font-weight:700; border-bottom:1px solid transparent; text-decoration:none;
  }
  .btn-link.btn-sm.float-right:hover{ color: var(--indigo-400); border-color: rgba(99,102,241,.45); }

  /* Layout Helpers für XS */
  @media (max-width: 576px){
    .input-group{ flex-direction:column; padding:.4rem; }
  }

  /* Turnstile Wrapper zur Ausrichtung */
  .recaptcha-container, .turnstile-wrapper{
    margin: 1rem auto 0; display:flex; justify-content:center;
  }
</style>

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
