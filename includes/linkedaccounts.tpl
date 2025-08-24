<!-- ===== Linked Accounts (Rettinger25 — Indigo / Sky / Gray Theme) ===== -->
<style>
  :root{
    --indigo-500:#6366f1; --indigo-600:#4f46e5; --indigo-400:#818cf8;
    --sky-400:#38bdf8; --sky-300:#7dd3fc;
    --gray-900:#111827; --gray-850:#1f2937; --gray-700:#374151;
    --gray-400:#9ca3af; --gray-300:#d1d5db; --gray-200:#e5e7eb;
    --success-500:#10b981; --danger-500:#ef4444;
  }

  /* Tabellencontainer */
  #tableLinkedAccounts_wrapper,
  #tableLinkedAccounts{
    color: var(--gray-200);
  }

  /* Tabelle (DataTables/Bootstrap-agnostisch) */
  table.table.data-driven{
    width:100%;
    border-collapse:separate; border-spacing:0;
    background:linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65));
    border:1px solid rgba(99,102,241,.25);
    border-radius:16px;
    box-shadow:0 16px 40px rgba(56,189,248,.12);
    overflow:hidden;
  }
  table.table.data-driven thead th{
    font-weight:800; font-size:.9rem;
    color:#e5e7eb;
    background:rgba(17,24,39,.6);
    border-bottom:1px solid rgba(99,102,241,.25);
    padding:.9rem 1rem;
    text-transform:none;
  }
  table.table.data-driven tbody td{
    padding:.85rem 1rem; border-top:1px solid rgba(99,102,241,.15);
    color:#cbd5e1;
  }
  table.table.data-driven tbody tr:hover{
    background:rgba(56,189,248,.06);
  }
  table.table.data-driven .text-center{ text-align:center; }

  /* Subheadings / Hinweise */
  .sub-heading, .sub-heading-borderless{
    display:flex; justify-content:center; margin:1.5rem 0 .5rem;
  }
  .sub-heading > span{
    display:inline-block;
    padding:.3rem .9rem;
    border:1px solid rgba(56,189,248,.35);
    border-radius:999px;
    background:rgba(31,41,55,.6);
    color:var(--sky-300); font-weight:800; letter-spacing:.04em;
  }
  .sub-heading-borderless > span{ color:var(--indigo-400); font-weight:800; }

  .text-muted{ color:var(--gray-400) !important; }
  .small{ font-size:.9rem; }

  /* Feedback- bzw. Messages-Blöcke (nutzt unsere Alert-Optik) */
  .providerLinkingFeedback,
  #providerLinkingMessages p{
    margin: .6rem 0;
    padding: .8rem 1rem;
    border-radius:12px;
    border:1px solid rgba(99,102,241,.25);
    background:linear-gradient(135deg, rgba(31,41,55,.75), rgba(31,41,55,.55));
    color: var(--gray-200);
  }
  #providerLinkingMessages .providerLinkingMsg-preLink-linking_complete{
    border-color: rgba(16,185,129,.45);
    background: linear-gradient(135deg, rgba(16,185,129,.10), rgba(31,41,55,.6));
    color: var(--success-500);
  }
  #providerLinkingMessages .providerLinkingMsg-preLink-connect_error,
  #providerLinkingMessages .providerLinkingMsg-preLink-init_failed,
  #providerLinkingMessages .providerLinkingMsg-preLink-default{
    border-color: rgba(239,68,68,.45);
    background: linear-gradient(135deg, rgba(239,68,68,.12), rgba(31,41,55,.6));
    color: var(--danger-500);
  }

  /* Social-Buttons Wrapper */
  .providerPreLinking{ margin: 1rem 0; }
  .social-signin-btns{
    display:flex; flex-wrap:wrap; gap:.6rem; justify-content:center;
  }

  /* Generische Styles, falls Provider HTML nur einfache <a>/<button> liefert */
  .social-signin-btns a,
  .social-signin-btns button{
    display:inline-flex; align-items:center; gap:.5rem;
    padding:.65rem 1rem; border-radius:10px; font-weight:800; font-size:.95rem;
    text-decoration:none; border:1px solid rgba(99,102,241,.25);
    background:linear-gradient(135deg, rgba(31,41,55,.9), rgba(31,41,55,.7));
    color:#e5e7eb; transition:.2s;
  }
  .social-signin-btns a:hover,
  .social-signin-btns button:hover{
    transform:translateY(-1px);
    box-shadow:0 12px 28px rgba(56,189,248,.2);
    border-color:rgba(56,189,248,.45);
  }

  /* Optional: Provider-Farben erkennen & leicht akzentuieren (wenn Klassen vorhanden sind) */
  .social-signin-btns .btn-google    { border-color:#ea4335; }
  .social-signin-btns .btn-facebook  { border-color:#1877f2; }
  .social-signin-btns .btn-github    { border-color:#6e7681; }
  .social-signin-btns .btn-twitter,
  .social-signin-btns .btn-x         { border-color:#1d9bf0; }
  .social-signin-btns .btn-microsoft { border-color:#2f2f2f; }
  .social-signin-btns .btn-discord   { border-color:#5865F2; }

  /* Utilities */
  .w-hidden{ display:none !important; }
</style>


{if ($linkableProviders || $hasLinkedProvidersEnabled) && $linkContext == 'linktable'}
    <table id="tableLinkedAccounts" class="table display data-driven"
           data-ajax-url="{$linkedAccountsUrl}"
           data-on-draw-rebind-confirmation-modal="true"
           data-lang-empty-table="{lang key='remoteAuthn.noLinkedAccounts'}"
    >
        <thead>
        <tr class="text-center">
            <th>{lang key='remoteAuthn.provider'}</th>
            <th>{lang key='remoteAuthn.name'}</th>
            <th>{lang key='remoteAuthn.emailAddress'}</th>
            <th>{lang key='remoteAuthn.actions'}</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td colspan="4" class="text-center">{lang key='remoteAuthn.noLinkedAccounts'}</td>
        </tr>
        </tbody>
    </table>
{elseif $linkableProviders}

    <div id="providerLinkingMessages" class="w-hidden">
        <p class="providerLinkingMsg-preLink-init_failed">
            <span class="provider-name"></span> {lang key='remoteAuthn.unavailable'}
        </p>
        <p class="providerLinkingMsg-preLink-connect_error">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.connectError'}
        </p>
        <p class="providerLinkingMsg-preLink-complete_sign_in">
            {lang key='remoteAuthn.completeSignIn'}
        </p>
        <p class="providerLinkingMsg-preLink-2fa_needed">
            {lang key='remoteAuthn.redirecting'}
        </p>
        <p class="providerLinkingMsg-preLink-linking_complete">
            <strong>{lang key='remoteAuthn.success'}</strong> {lang key='remoteAuthn.accountNowLinked'}
        </p>
        <p class="providerLinkingMsg-preLink-login_to_link-signin-required">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.oneTimeAuthRequired'}
        </p>
        <p class="providerLinkingMsg-preLink-login_to_link-registration-required">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.completeRegistrationForm'}
        </p>
        <p class="providerLinkingMsg-preLink-checkout-new">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.completeNewAccountForm'}
        </p>
        <p class="providerLinkingMsg-preLink-other_user_exists">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.linkedToAnotherClient'}
        </p>
        <p class="providerLinkingMsg-preLink-already_linked">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.alreadyLinkedToYou'}
        </p>
        <p class="providerLinkingMsg-preLink-default">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.connectError'}
        </p>
    </div>

    {if $linkContext == 'registration'}
        <div class="sub-heading">
            <span>{lang key='remoteAuthn.titleSignUpVerb'}</span>
        </div>
    {elseif $linkContext == 'checkout-existing'}
        <div class="sub-heading-borderless">
            <span>{lang key='remoteAuthn.titleOr'}</span>
        </div>
        <p class="small text-center text-muted">{lang key='remoteAuthn.saveTimeByLinking'}</p>
    {elseif $linkContext == 'checkout-new'}
        <div class="sub-heading">
            <span>{lang key='remoteAuthn.titleSignUpVerb'}</span>
        </div>
        <p class="small text-center text-muted">{lang key='remoteAuthn.saveTimeByLinking'}</p>
    {elseif $linkContext == 'clientsecurity'}
        <p>{lang key='remoteAuthn.mayHaveMultipleLinks'}</p>
    {/if}

    <div class="providerPreLinking" data-link-context="{$linkContext}"
         data-hide-on-prelink={if in_array($linkContext, ['clientsecurity','login'])}0{else}1{/if}
         data-disable-on-prelink=0>
        <div class="social-signin-btns">
            {foreach $linkableProviders as $provider }
                {if in_array($linkContext, ['checkout-existing'])}
                    {$provider.login_button}
                {else}
                    {$provider.code}
                {/if}
            {/foreach}
        </div>
    </div>

    {if !isset($customFeedback) || !$customFeedback}
        <div class="providerLinkingFeedback"></div>
    {/if}

{/if}
