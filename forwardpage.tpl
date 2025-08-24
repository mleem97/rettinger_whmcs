<div class="my-2">
    {include file="$template/includes/alert.tpl" type="info" msg=$message textcenter=true}
</div>

<div class="mb-5 d-flex flex-column justify-content-center align-items-center">

    <div class="progress-bar" style="width: 25%; margin: 2rem 0; background: rgba(31,41,55,.6); border-radius: 999px; height: 12px; overflow: hidden; border: 1px solid rgba(99,102,241,.25);">
        <div class="progress-bar-fill" style="width: 100%; height: 100%; background: linear-gradient(90deg, var(--sky-400), var(--indigo-500)); border-radius: 999px; animation: pulse 2s infinite;" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
            <span class="sr-only">{lang key='loading'}</span>
        </div>
    </div>

    <div id="frmPayment">

        {$code}

        <form method="post" action="{if $invoiceid}viewinvoice.php?id={$invoiceid}{else}clientarea.php{/if}">
        </form>

    </div>

</div>

<style>
@keyframes pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.7; }
}
</style>

<script>
    setTimeout("autoSubmitFormByContainer('frmPayment')", 5000);
</script>
