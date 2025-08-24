<!-- ===== Breadcrumb (Rettinger25 — Indigo / Sky / Gray Theme) ===== -->
<style>
  :root{
    --indigo-500:#6366f1; --indigo-600:#4f46e5; --indigo-400:#818cf8;
    --sky-400:#38bdf8; --sky-300:#7dd3fc;
    --gray-900:#111827; --gray-850:#1f2937; --gray-400:#9ca3af; --gray-200:#e5e7eb;
  }

  .breadcrumb{
    display:flex;
    flex-wrap:wrap;
    list-style:none;
    margin:1rem 0 2rem;
    padding:.75rem 1rem;
    border-radius:12px;
    background:linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65));
    border:1px solid rgba(99,102,241,.25);
    box-shadow:0 8px 24px rgba(56,189,248,.12);
  }
  .breadcrumb-item{
    font-size:.9rem;
    color:var(--gray-400);
    display:flex;
    align-items:center;
  }
  .breadcrumb-item + .breadcrumb-item::before{
    content:"›";
    color:var(--sky-400);
    padding:0 .5rem;
    font-weight:700;
  }
  .breadcrumb-item a{
    color:var(--sky-400);
    text-decoration:none;
    font-weight:600;
    transition:color .25s, border-color .25s;
    border-bottom:1px solid transparent;
  }
  .breadcrumb-item a:hover{
    color:var(--indigo-400);
    border-color:rgba(99,102,241,.45);
  }
  .breadcrumb-item.active{
    color:var(--indigo-500);
    font-weight:800;
  }
</style>

<ol class="breadcrumb">
    {foreach $breadcrumb as $item}
        <li class="breadcrumb-item{if $item@last} active{/if}"{if $item@last} aria-current="page"{/if}>
            {if !$item@last}<a href="{$item.link}">{/if}
            {$item.label}
            {if !$item@last}</a>{/if}
        </li>
    {/foreach}
</ol>
