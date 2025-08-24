<div class="card" style="background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65)); border: 1px solid rgba(99,102,241,.25); border-radius: 16px; box-shadow: 0 16px 40px rgba(56,189,248,.12); margin-bottom: 2rem;">
    <div class="card-body" style="padding: 2rem; color: var(--gray-200);">

        <div class="mb-4" style="text-align: center;">
            <h6 class="h3" style="color: #fff; font-weight: 900; margin-bottom: .75rem; background: linear-gradient(135deg, #fff, var(--gray-200)); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent;">{lang key='contactus'}</h6>
            <p style="color: var(--gray-400); margin-bottom: 0;">{lang key='readyforquestions'}</p>
        </div>

        {if $sent}
            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='contactsent'}" textcenter=true}
        {/if}

        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}

        {if !$sent}
            <form method="post" action="contact.php" role="form">
            <input type="hidden" name="action" value="send" />

                <div class="form-group row">
                    <label for="inputName" class="col-sm-3 col-form-label text-right" style="color: var(--gray-200); font-weight: 700;">{lang key='supportticketsclientname'}</label>
                    <div class="col-sm-7">
                        <input type="text" name="name" value="{$name}" class="form-control" id="inputName" style="background: rgba(17,24,39,.6); border: 1px solid rgba(99,102,241,.25); border-radius: 10px; color: #f9fafb; padding: .6rem .8rem;" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-3 col-form-label text-right" style="color: var(--gray-200); font-weight: 700;">{lang key='supportticketsclientemail'}</label>
                    <div class="col-sm-7">
                        <input type="email" name="email" value="{$email}" class="form-control" id="inputEmail" style="background: rgba(17,24,39,.6); border: 1px solid rgba(99,102,241,.25); border-radius: 10px; color: #f9fafb; padding: .6rem .8rem;" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputSubject" class="col-sm-3 col-form-label text-right">{lang key='supportticketsticketsubject'}</label>
                    <div class="col-sm-7">
                        <input type="text" name="subject" value="{$subject}" class="form-control" id="inputSubject" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputMessage" class="col-sm-3 col-form-label text-right">{lang key='contactmessage'}</label>
                    <div class="col-sm-9">
                        <textarea name="message" rows="7" class="form-control" id="inputMessage">{$message}</textarea>
                    </div>
                </div>

                {if $captcha}
                    <div class="text-center margin-bottom">
                        {include file="$template/includes/captcha.tpl"}
                    </div>
                {/if}

                <div class="text-center">
                    <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}">{lang key='contactsend'}</button>
                </div>
            </form>

        {/if}

    </div>
</div>
