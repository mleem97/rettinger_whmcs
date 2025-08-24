<!-- ===== Generate Password Modal (Rettinger25 — Indigo / Sky / Gray Theme) ===== -->
<style>
  :root {
    --indigo-500:#6366f1; --indigo-600:#4f46e5; --indigo-400:#818cf8;
    --sky-400:#38bdf8; --sky-300:#7dd3fc;
    --gray-900:#111827; --gray-850:#1f2937; --gray-400:#9ca3af; --gray-200:#e5e7eb;
    --danger-500:#ef4444;
  }

  .modal{ display:none; }
  .modal.show{ display:block; }

  .modal::before{
    content:""; position:fixed; inset:0; z-index:1040;
    background: rgba(2,6,23,.75);
    backdrop-filter: blur(2px);
    opacity:0; transition:.2s ease;
    pointer-events:none;
  }
  .modal.show::before{ opacity:1; pointer-events:auto; }

  .modal-dialog{
    position:fixed; top:50%; left:50%;
    transform:translate(-50%,-50%);
    z-index:1050; width:100%; max-width:560px;
    padding:0 1rem;
  }
  .modal-content{
    background:linear-gradient(135deg, rgba(31,41,55,.92), rgba(31,41,55,.78));
    border:1px solid rgba(99,102,241,.25);
    border-radius:16px;
    box-shadow:0 30px 70px rgba(56,189,248,.2);
    color:var(--gray-200);
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
    border:none; background:transparent; color:var(--sky-400); font-size:1.5rem; cursor:pointer;
    border-radius:8px; padding:.25rem .4rem;
  }
  .close:hover{ color:var(--indigo-400); background:rgba(56,189,248,.12); }
  .modal-body{ padding:1rem 1.25rem; }

  /* Form */
  .form-group{ margin-bottom:1rem; }
  .col-form-label{ font-weight:700; color:var(--gray-200); }
  .form-control{
    width:100%; border-radius:10px; padding:.6rem .8rem;
    border:1px solid rgba(99,102,241,.25);
    background:rgba(17,24,39,.6); color:#f9fafb;
  }
  .form-control:focus{ border-color:var(--sky-400); outline:none; }

  /* Buttons */
  .btn{
    display:inline-flex; align-items:center; gap:.4rem;
    border-radius:10px; font-weight:800; font-size:.9rem; cursor:pointer;
    border:1px solid transparent; padding:.5rem .9rem;
    transition:.2s;
  }
  .btn-default{
    color:var(--sky-400); border-color:var(--sky-400); background:transparent;
  }
  .btn-default:hover{ background:var(--sky-400); color:#0b1220; }
  .btn-primary{
    background:linear-gradient(135deg,var(--indigo-500),var(--indigo-600));
    color:#fff; box-shadow:0 8px 24px rgba(99,102,241,.25);
  }
  .btn-primary:hover{ transform:translateY(-1px); box-shadow:0 12px 28px rgba(56,189,248,.35); }

  .alert{
    padding:.8rem 1rem; border-radius:12px; margin-bottom:1rem;
    border:1px solid rgba(239,68,68,.45);
    background:linear-gradient(135deg, rgba(239,68,68,.12), rgba(31,41,55,.6));
    color:var(--danger-500);
    font-size:.9rem;
  }
  .w-hidden{ display:none !important; }
</style>

<form action="#" id="frmGeneratePassword">
  <div class="modal fade" id="modalGeneratePassword" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <h4 class="modal-title">{lang key='generatePassword.title'}</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
        </div>

        <div class="modal-body">
          <div class="alert w-hidden" id="generatePwLengthError">
            {lang key='generatePassword.lengthValidationError'}
          </div>

          <div class="form-group row">
            <label for="generatePwLength" class="col-sm-4 col-form-label">
              {lang key='generatePassword.pwLength'}
            </label>
            <div class="col-sm-8">
              <input type="number" min="8" max="64" value="12" step="1"
                     class="form-control" id="inputGeneratePasswordLength">
            </div>
          </div>

          <div class="form-group row">
            <label for="generatePwOutput" class="col-sm-4 col-form-label">
              {lang key='generatePassword.generatedPw'}
            </label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="inputGeneratePasswordOutput">
            </div>
          </div>

          <div class="row">
            <div class="col-sm-8 offset-sm-4" style="display:flex; gap:.5rem; flex-wrap:wrap;">
              <button type="submit" class="btn btn-default btn-sm">
                <i class="fas fa-plus fa-fw"></i> {lang key='generatePassword.generateNew'}
              </button>
              <button type="button" class="btn btn-default btn-sm copy-to-clipboard"
                      data-clipboard-target="#inputGeneratePasswordOutput">
                <img src="{$WEB_ROOT}/assets/img/clippy.svg" alt="Copy" width="15">
                {lang key='copy'}
              </button>
            </div>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">
            {lang key='close'}
          </button>
          <button type="button" class="btn btn-primary" id="btnGeneratePasswordInsert"
                  data-clipboard-target="#inputGeneratePasswordOutput">
            {lang key='generatePassword.copyAndInsert'}
          </button>
        </div>

      </div>
    </div>
  </div>
</form>

<script>
  // kleines JS für Modal öffnen/schließen
  (function(){
    document.addEventListener('click', e => {
      const btn = e.target.closest('[data-toggle="modal"]');
      if (btn){
        e.preventDefault();
        document.querySelector(btn.dataset.target)?.classList.add('show');
      }
      const close = e.target.closest('[data-dismiss="modal"]');
      if (close){
        e.preventDefault();
        close.closest('.modal').classList.remove('show');
      }
    });
  })();
</script>
