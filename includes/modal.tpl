<!-- ===== Generic Modal Theme (Rettinger25 — Indigo / Sky / Gray) ===== -->

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
