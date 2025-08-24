<!-- Generate Password modal styles moved to style.css -->

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
