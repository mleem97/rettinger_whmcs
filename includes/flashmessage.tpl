<!-- ===== Flash Messages (Indigo / Sky / Gray Theme) ===== -->
<style>
  :root{
    --indigo-500:#6366f1; --indigo-600:#4f46e5;
    --sky-400:#38bdf8; --sky-300:#7dd3fc;
    --gray-900:#111827; --gray-850:#1f2937;
    --gray-200:#e5e7eb; --gray-400:#9ca3af;
    --success-500:#10b981; --warning-500:#f59e0b; --danger-500:#ef4444;
  }

  .alert{
    margin:1rem 0;
    padding:1rem 1.25rem;
    border-radius:14px;
    background:linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65));
    border:1px solid rgba(99,102,241,.25);
    color:var(--gray-200);
    box-shadow:0 16px 40px rgba(56,189,248,.12);
    font-size:.95rem;
    font-weight:500;
  }

  /* Typvarianten */
  .alert-info{
    border-color: rgba(56,189,248,.35);
    background: linear-gradient(135deg, rgba(56,189,248,.10), rgba(31,41,55,.6));
    color: var(--sky-300);
  }
  .alert-success{
    border-color: rgba(16,185,129,.45);
    background: linear-gradient(135deg, rgba(16,185,129,.10), rgba(31,41,55,.6));
    color: var(--success-500);
  }
  .alert-warning{
    border-color: rgba(245,158,11,.45);
    background: linear-gradient(135deg, rgba(245,158,11,.12), rgba(31,41,55,.6));
    color: var(--warning-500);
  }
  .alert-danger{
    border-color: rgba(239,68,68,.45);
    background: linear-gradient(135deg, rgba(239,68,68,.12), rgba(31,41,55,.6));
    color: var(--danger-500);
  }

  .text-center{ text-align:center; }
  .text-right{ text-align:right; }
  .text-left{ text-align:left; }
</style>

{if $message = get_flash_message()}
    <div class="alert alert-{if $message.type == "error"}danger{elseif $message.type == 'success'}success{elseif $message.type == 'warning'}warning{else}info{/if}{if isset($align)} text-{$align}{/if}">
        {$message.text}
    </div>
{/if}
