<!-- ===== Generic Modal Theme (Rettinger25 — Indigo / Sky / Gray) ===== -->
<style>
  :root{
    --indigo-500:#6366f1; --indigo-600:#4f46e5; --indigo-400:#818cf8;
    --sky-400:#38bdf8; --sky-300:#7dd3fc;
    --gray-900:#111827; --gray-850:#1f2937; --gray-400:#9ca3af; --gray-200:#e5e7eb;
  }

  /* Grundzustand / Backdrop */
  .modal{ display:none; }
  .modal.show{ display:block; }
  .modal.fade .modal-dialog{ transform: translateY(10px); opacity:0; transition: transform .2s ease, opacity .2s ease; }
  .modal.show .modal-dialog{ transform: translateY(0); opacity:1; }

  .modal::before{
    content:""; position:fixed; inset:0; z-index:1040;
    background: rgba(2,6,23,.75); backdrop-filter: blur(2px);
    opacity:0; transition: opacity .2s ease; pointer-events:none;
  }
  .modal.show::before{ opacity:1; pointer-events:auto; }

  /* Dialog + Inhalt */
  .modal-dialog{
    position:fixed; z-index:1050; left:50%; top:50%;
    transform: translate(-50%,-50%);
    width:100%; max-width:640px; padding:0 1rem;
  }
  .modal-content{
    background: linear-gradient(135deg, rgba(31,41,55,.92), rgba(31,41,55,.78));
    border:1px solid rgba(99,102,241,.25);
    border-radius:16px; overflow:hidden; color:var(--gray-200);
    box-shadow:0 30px 70px rgba(56,189,248,.20);
  }
  .modal-header, .modal-footer{ padding:1rem 1.25rem; display:flex; align-items:center; }
  .modal-header{ justify-content:space-between; border-bottom:1px solid rgba(99,102,241,.18); }
  .modal-footer{ justify-content:flex-end; gap:.5rem; border-top:1px solid rgba(99,102,241,.18); }

  .modal-title{
    margin:0; font-size:1.1rem; font-weight:900;
    background:linear-gradient(135deg,#fff,var(--gray-200));
    -webkit-background-clip:text; -webkit-text-fill-color:transparent;
  }

  .close{
    border:none; background:transparent; color:var(--sky-400);
    font-size:1.5rem; line-height:1; cursor:pointer; border-radius:8px; padding:.25rem .4rem;
  }
  .close:hover{ color:var(--indigo-400); background:rgba(56,189,248,.12); }

  .modal-body{ padding:1rem 1.25rem; color:#cbd5e1; }
  .text-center{ text-align:center; }
  .w-hidden{ display:none !important; }

  /* Loader/Spinner im Loader-Body */
  #modal{$name}Loader i.fa-spinner{ color: var(--sky-300); }

  /* Buttons */
  .btn{
    display:inline-flex; align-items:center; gap:.45rem;
    border-radius:10px; font-weight:800; font-size:.92rem; cursor:pointer;
    border:1px solid transparent; padding:.55rem .95rem; text-decoration:none;
    transition: transform .2s, box-shadow .2s, background .2s, color .2s, border-color .2s;
    color:var(--gray-200); background:transparent;
  }
  .btn-default{ color:var(--sky-400); border-color:var(--sky-400); }
  .btn-default:hover{ background:var(--sky-400); color:#0b1220; }

  .btn-primary{
    background: linear-gradient(135deg, var(--indigo-500), var(--indigo-600));
    color:#fff; box-shadow:0 8px 24px rgba(99,102,241,.25);
  }
  .btn-primary:hover{ transform: translateY(-1px); box-shadow:0 12px 28px rgba(56,189,248,.35); }

  /* Responsiv */
  @media (max-width:520px){
    .modal-dialog{ max-width: 94vw; }
  }
</style>

<!-- ==== Dein bestehendes Markup (unverändert) ==== -->
<div class="modal fade" id="modal{$name}">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="modal{$name}Title">{$title}</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <!-- Loader-State (aus-/einblendbar über .w-hidden) -->
      <div class="modal-body text-center w-hidden" id="modal{$name}Loader">
        <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
      </div>

      <div class="modal-body" id="modal{$name}Body">
        {if isset($content)} <p>{$content}</p> {/if}
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">
          {if isset($closeLabel)}{$closeLabel}{else}{lang key='closewindow'}{/if}
        </button>
        {if isset($submitAction)}
          <button type="button" class="btn btn-primary" onclick="{$submitAction}">
            {if isset($submitLabel)}{$submitLabel}{else}{lang key='clientareasavechanges'}{/if}
          </button>
        {/if}
      </div>
    </div>
  </div>
</div>

<!-- Optional: Mini-JS, damit data-dismiss/data-toggle ohne Bootstrap funktionieren -->
<script>
  (function(){
    // Öffnen via [data-toggle="modal"] irgendwo auf der Seite
    document.addEventListener('click', function(e){
      const openBtn = e.target.closest('[data-toggle="modal"]');
      if (openBtn){
        const target = openBtn.getAttribute('data-target');
        const modal = target && document.querySelector(target);
        if (modal){ modal.classList.add('show'); modal.setAttribute('aria-hidden','false'); }
        e.preventDefault();
      }
    });
    // Schließen via [data-dismiss="modal"]
    document.addEventListener('click', function(e){
      const closeBtn = e.target.closest('[data-dismiss="modal"]');
      if (closeBtn){
        const modal = closeBtn.closest('.modal');
        if (modal){ modal.classList.remove('show'); modal.setAttribute('aria-hidden','true'); }
        e.preventDefault();
      }
    });
    // Backdrop-Klick schließt
    document.addEventListener('mousedown', function(e){
      const isDialog = e.target.closest('.modal-dialog');
      const modal = e.target.closest('.modal');
      if (modal && !isDialog){ modal.classList.remove('show'); modal.setAttribute('aria-hidden','true'); }
    });
    // ESC schließt
    document.addEventListener('keydown', function(e){
      if (e.key === 'Escape'){
        const open = document.querySelector('.modal.show');
        if (open){ open.classList.remove('show'); open.setAttribute('aria-hidden','true'); }
      }
    });
  })();
</script>
