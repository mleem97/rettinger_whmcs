<!-- ===== Flash Messages (Rettinger25 — Indigo / Sky / Gray Theme) ===== -->
<!-- Flash styles moved to style.css -->

{if $message = get_flash_message()}
    <div role="alert"
         class="alert alert-{if $message.type == "error"}danger{elseif $message.type == 'success'}success{elseif $message.type == 'warning'}warning{else}info{/if}{if isset($align)} text-{$align}{/if}">
        {$message.text}
    </div>
{/if}
