<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="{$charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$requestedAction} - {$companyname}</title>

    <link href="{assetPath file='all.min.css'}" rel="stylesheet">
    <link href="{assetPath file='theme.min.css'}?v={$versionHash}" rel="stylesheet">
    {assetExists file="custom.css"}
    <link href="{$__assetPath__}" rel="stylesheet">
    {/assetExists}
    <link href="{assetPath file='oauth.css'}" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support were removed from the theme to avoid forcing remote dependencies.
         If you need to support IE8/older browsers, re-add the polyfills from a local copy and load them conditionally here. -->
  </head>
  <body>

    <section id="header">
        <div class="container clearfix">
            <img src="{$logo}" />
            <div class="float-right text-right">
                {if $loggedin}
                    <form method="post" action="{$issuerurl}oauth/authorize.php" id="frmLogout">
                        <input type="hidden" name="logout" value="1"/>
                        <input type="hidden" name="request_hash" value="{$request_hash}"/>
                        <p>
                            {lang key='oauth.currentlyLoggedInAs' firstName=$userInfo.firstName lastName=$userInfo.lastName}{if $userInfo.clientName} ({$userInfo.clientName}){/if}.
                            <a href="#" onclick="jQuery('#frmLogout').submit()">{lang key='oauth.notYou'}</a>
                        </p>
                    </form>
                {/if}
                <form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
                    <input type="hidden" name="return_to_app" value="1"/>
                    <input type="hidden" name="request_hash" value="{$request_hash}"/>
                    <button type="submit" class="btn btn-default">
                        {lang key='oauth.returnToApp' appName=$appName}
                    </button>
                </form>
            </div>
        </div>
    </section>

    <section id="content">
        {$content}
    </section>

    <section id="footer">
        {lang key='oauth.copyrightFooter' dateYear=$date_year companyName=$companyname}
    </section>

    <script src="{assetPath file='scripts.min.js'}"></script>
  </body>
</html>
