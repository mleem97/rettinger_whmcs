<div class="providerLinkingFeedback"></div>

<form method="post" action="{routePath('login-validate')}" class="login-form" role="form">
    <div class="card" style="max-width: 540px; margin: 2rem auto; background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65)); border: 1px solid rgba(99,102,241,.25); border-radius: 16px; box-shadow: 0 16px 40px rgba(56,189,248,.12);">
        <div class="card-body" style="padding: 3rem 2.5rem; color: var(--gray-200);">
            <div class="mb-4" style="text-align: center;">
                <h6 class="h3" style="color: #fff; font-weight: 900; margin-bottom: .75rem; background: linear-gradient(135deg, #fff, var(--gray-200)); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent;">{lang key='loginbutton'}</h6>
                <p style="color: var(--gray-400); margin-bottom: 0;">{lang key='userLogin.signInToContinue'}</p>
            </div>
            {include file="$template/includes/flashmessage.tpl"}
            <div class="form-group">
                <label for="inputEmail" class="form-control-label" style="color: var(--gray-200); font-weight: 700; margin-bottom: .35rem;">{lang key='clientareaemail'}</label>
                <div class="input-group input-group-merge" style="background: rgba(31,41,55,.6); border: 1px solid rgba(99,102,241,.25); border-radius: 14px; padding: .35rem; box-shadow: 0 16px 40px rgba(56,189,248,.12);">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="background: transparent; border: none; color: var(--sky-400);"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="email" class="form-control" name="username" id="inputEmail" placeholder="name@example.com" autofocus style="background: transparent; border: none; color: #f9fafb; outline: none;">
                </div>
            </div>
            <div class="form-group mb-4 focused">
                <div class="d-flex align-items-center justify-content-between">
                    <label for="inputPassword" class="form-control-label" style="color: var(--gray-200); font-weight: 700; margin-bottom: .35rem;">{lang key='clientareapassword'}</label>
                    <div class="mb-2">
                        <a href="{routePath('password-reset-begin')}" style="color: var(--sky-400); text-decoration: none; font-size: .9rem; border-bottom: 1px solid transparent;" tabindex="-1">{lang key='forgotpw'}</a>
                    </div>
                </div>
                <div class="input-group input-group-merge" style="background: rgba(31,41,55,.6); border: 1px solid rgba(99,102,241,.25); border-radius: 14px; padding: .35rem; box-shadow: 0 16px 40px rgba(56,189,248,.12);">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="background: transparent; border: none; color: var(--sky-400);"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" class="form-control pw-input" name="password" id="inputPassword" placeholder="{lang key='clientareapassword'}" autocomplete="off" style="background: transparent; border: none; color: #f9fafb; outline: none;">
                    <div class="input-group-append">
                        <button class="btn btn-default btn-reveal-pw" type="button" tabindex="-1" style="background: transparent; border: none; color: var(--sky-400);">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
            </div>
            {if $captcha->isEnabled()}
                {include file="$template/includes/captcha.tpl"}
            {/if}
            <div class="float-left">
                <button id="login" type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}" style="background: linear-gradient(135deg, var(--indigo-500), var(--indigo-600)); color: #fff; border: none; border-radius: 10px; font-weight: 800; font-size: .95rem; padding: .6rem 1rem;">
                    {lang key='loginbutton'}
                </button>
            </div>
            <div class="text-right">
                <label style="color: var(--gray-300); font-weight: 600; cursor: pointer;">
                    <input type="checkbox" class="form-check-input" name="rememberme" style="margin-right: .5rem;" />
                    {lang key='loginrememberme'}
                </label>
            </div>
        </div>
        <div class="card-footer" style="background: rgba(31,41,55,.4); border-top: 1px solid rgba(99,102,241,.18); padding: 1rem 2.5rem; border-radius: 0 0 16px 16px; color: var(--gray-400); text-align: center;">
            <small style="color: var(--gray-400);">{lang key='userLogin.notRegistered'}</small>
            <a href="{$WEB_ROOT}/register.php" style="color: var(--sky-400); font-weight: 700; text-decoration: none; border-bottom: 1px solid transparent; margin-left: .5rem;">{lang key='userLogin.createAccount'}</a>
        </div>
    </div>
</form>

{include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
