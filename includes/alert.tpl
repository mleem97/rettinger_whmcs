<!-- ===== Alerts (Rettinger25 — Indigo / Sky / Gray Theme) ===== -->
<style>
  :root{
    --indigo-500:#6366f1; --indigo-600:#4f46e5; --indigo-400:#818cf8;
    --sky-400:#38bdf8; --sky-300:#7dd3fc;
    --gray-900:#111827; --gray-850:#1f2937; --gray-400:#9ca3af; --gray-200:#e5e7eb;
  }

  .alert{
    margin:1rem 0;
    padding:1rem 1.25rem;
    background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65)); /* gray-850 glass */
    border:1px solid rgba(99,102,241,.25); /* indigo baseline */
    color:var(--gray-200);
    border-radius:14px;
    box-shadow:0 16px 40px rgba(56,189,248,.12);
  }
  .alert h2{
    margin:.25rem 0 .5rem;
    font-size:1.05rem; font-weight:900; color:#f1f5f9;
  }
  .alert ul{ margin:.5rem 0 0 1.1rem; }
  .alert a{
    color:var(--sky-300);
    text-decoration:none;
    border-bottom:1px solid rgba(56,189,248,.35);
  }
  .alert a:hover{ color:var(--indigo-400); border-color:rgba(99,102,241,.45); }

  /* Varianten (Bootstrap-kompatible Klassennamen, eigenes Design) */
  .alert-info{
    border-color: rgba(56,189,248,.35);
    background: linear-gradient(135deg, rgba(56,189,248,.10), rgba(31,41,55,.6));
  }
  .alert-success{
    border-color: rgba(16,185,129,.35);
    background: linear-gradient(135deg, rgba(16,185,129,.10), rgba(31,41,55,.6));
  }
  .alert-warning{
    border-color: rgba(245,158,11,.45);
    background: linear-gradient(135deg, rgba(245,158,11,.12), rgba(31,41,55,.6));
  }
  .alert-danger, .alert-error{
    border-color: rgba(244,63,94,.45);
    background: linear-gradient(135deg, rgba(244,63,94,.12), rgba(31,41,55,.6));
  }

  /* Utility-Klassen, falls von außen gesetzt */
  .text-center{ text-align:center; }
  .w-hidden{ display:none !important; }
</style>

<div class="alert alert-{if $type eq "error"}danger{elseif $type}{$type}{else}info{/if}{if $textcenter} text-center{/if}{if $additionalClasses} {$additionalClasses}{/if}{if $hide} w-hidden{/if}"{if $idname} id="{$idname}"{/if}>
{if $errorshtml}
    <strong>{lang key='clientareaerrors'}</strong>
    <ul>
        {$errorshtml}
    </ul>
{else}
    {if $title}
        <h2>{$title}</h2>
    {/if}
    {$msg}
{/if}
</div>
