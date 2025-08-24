<!-- ========== Modal Theme (Indigo / Sky / Gray) ========== -->
<style>
  :root{
    --indigo-500:#6366f1; --indigo-600:#4f46e5; --indigo-400:#818cf8;
    --sky-400:#38bdf8;
    --gray-900:#111827; --gray-850:#1f2937; --gray-400:#9ca3af; --gray-200:#e5e7eb;
    --green-500:#10b981;
  }

  /* Trigger Button: .btn-default / .btn-success */
  .btn{
    display:inline-flex; align-items:center; gap:.5rem;
    padding:.5rem .9rem; border-radius:10px; font-weight:800; font-size:.87rem;
    text-decoration:none; border:1px solid transparent; background:transparent; color:var(--gray-200);
    transition: transform .2s, box-shadow .2s, background .2s, color .2s, border-color .2s;
    cursor:pointer;
  }
  .btn-sm{ padding:.45rem .8rem; font-size:.85rem; }
  .btn-default{ color:var(--sky-400); border-color:var(--sky-400); }
  .btn-default:hover{ background:var(--sky-400); color:#0b1220; }
  .btn-success{
    background:linear-gradient(135deg, var(--indigo-500), var(--indigo-600));
    color:#fff; box-shadow:0 8px 24px rgba(99,102,241,.25);
  }
  .btn-success:hover{ transform:translateY(-1px); box-shadow:0 12px 28px rgba(56,189,248,.35); }

  /* Modal Base */
  .modal{ display:none; }
  .modal.show{ display:block; }

  .modal.fade .modal-dialog{
    transform: translateY(10px); opacity:0; transition: transform .2s ease, opacity .2s ease;
  }
  .modal.show .modal-dialog{
    transform: translateY(0); opacity:1;
  }

  /* Backdrop */
  .modal::before{
    content:""; position:fixed; inset:0; z-index:1040;
    background: rgba(2,6,23,.75); /* near-black */
    backdrop-filter: blur(2px);
    opacity:0; transition: opacity .2s ease;
    pointer-events:none;
  }
  .modal.show::before{ opacity:1; pointer-events:auto; }

  /* Dialog + Content */
  .modal-dialog{
    position:fixed; z-index:1050; inset:auto 0 0 0; top:50%; transform:translateY(-50%);
    margin:0 auto; width:100%; max-width:560px; padding:0 1rem;
  }
  .modal-content{
    background: linear-gradient(135deg, rgba(31,41,55,.92), rgba(31,41,55,.78));
    border:1px solid rgba(99,102,241,.25);
    border-radius:16px; overflow:hidden; color:var(--gray-200);
    box-shadow:0 30px 70px rgba(56,189,248,.2);
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
    border:none; background:transparent; color:var(--sky-400); font-size:1.5rem; line-height:1;
    cursor:pointer; border-radius:8px; padding:.25rem .4rem;
  }
  .close:hover{ color:var(--indigo-400); background:rgba(56,189,248,.12); }

  .modal-body{ padding:1rem 1.25rem; color:#cbd5e1; }
</style>

<!-- ========== Dein bestehendes Markup bleibt bestehen ========== -->
<button type="button" class="btn btn-sm btn-default" data-toggle="modal" data-target="#confirmModal{$modalId}">
    {$buttonTitle}
</button>

<div class="modal fade" id="confirmModal{$modalId}" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel{$modalId}" aria-hidden="true">
  <div class="modal-dialog" role="document" aria-modal="true">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmModalLabel{$modalId}">{$modalTitle}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        {$modalBody}
      </div>
      <div class="modal-footer">
        <button id="btnConfirmModalConfirmBtn"
                type="button"
                class="btn btn-sm btn-success"
                data-target-url="{$targetUrl}">
          {if $saveBtnIcon}<i class="{$saveBtnIcon}"></i>{/if}
          {$saveBtnTitle}
        </button>
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">
          {if $closeBtnIcon}<i class="{$closeBtnIcon}"></i>{/if}
          {$closeBtnTitle}
        </button>
      </div>
    </div>
  </div>
</div>

<!-- ========== Minimal JS, um data-toggle/data-dismiss ohne Bootstrap lauffähig zu machen ========== -->
<script>
  (function(){
    // Öffnen
    document.addEventListener('click', function(e){
      const btn = e.target.closest('[data-toggle="modal"]');
      if (!btn) return;
      const targetSel = btn.getAttribute('data-target');
      if (!targetSel) return;
      const modal = document.querySelector(targetSel);
      if (!modal) return;
      modal.classList.add('show');
      modal.setAttribute('aria-hidden', 'false');
      // Focus auf Close-Button
      const closeBtn = modal.querySelector('[data-dismiss="modal"]');
      if (closeBtn) closeBtn.focus();
      e.preventDefault();
    });

    // Schließen (Buttons)
    document.addEventListener('click', function(e){
      const close = e.target.closest('[data-dismiss="modal"]');
      if (!close) return;
      const modal = close.closest('.modal');
      if (!modal) return;
      hide(modal);
      e.preventDefault();
    });

    // Schließen (Backdrop)
    document.addEventListener('mousedown', function(e){
      const dialog = e.target.closest('.modal-dialog');
      const modal  = e.target.closest('.modal');
      if (modal && !dialog){
        hide(modal);
      }
    });

    // ESC zum Schließen
    document.addEventListener('keydown', function(e){
      if (e.key === 'Escape'){
        const open = document.querySelector('.modal.show');
        if (open) hide(open);
      }
    });

    // Confirm-Button → Weiterleiten
    document.addEventListener('click', function(e){
      const confirmBtn = e.target.closest('#btnConfirmModalConfirmBtn');
      if (!confirmBtn) return;
      const url = confirmBtn.getAttribute('data-target-url');
      if (url){
        window.location.href = url;
      }
    });

    function hide(modal){
      modal.classList.remove('show');
      modal.setAttribute('aria-hidden', 'true');
    }
  })();
</script>
