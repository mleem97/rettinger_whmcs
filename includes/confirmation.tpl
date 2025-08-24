<!-- ========== Modal Theme (Rettinger25 — Indigo / Sky / Gray) ========== -->
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
