{include file="$template/includes/flashmessage.tpl"}

<div class="stats-section">
    <div class="stats-grid">
        <a href="clientarea.php?action=services" class="stat-card" style="text-decoration: none;">
            <i class="fas fa-cube" style="color: var(--sky-400); font-size: 2rem; margin-bottom: 1rem;"></i>
            <span class="number">{$clientsstats.productsnumactive}</span>
            <span class="label">{lang key='navservices'}</span>
        </a>
        {if $clientsstats.numdomains || $registerdomainenabled || $transferdomainenabled}
            <a href="clientarea.php?action=domains" class="stat-card" style="text-decoration: none;">
                <i class="fas fa-globe" style="color: var(--sky-400); font-size: 2rem; margin-bottom: 1rem;"></i>
                <span class="number">{$clientsstats.numactivedomains}</span>
                <span class="label">{lang key='navdomains'}</span>
            </a>
        {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
            <a href="affiliates.php" class="stat-card" style="text-decoration: none;">
                <i class="fas fa-shopping-cart" style="color: var(--sky-400); font-size: 2rem; margin-bottom: 1rem;"></i>
                <span class="number">{$clientsstats.numaffiliatesignups}</span>
                <span class="label">{lang key='affiliatessignups'}</span>
            </a>
        {else}
            <a href="clientarea.php?action=quotes" class="stat-card" style="text-decoration: none;">
                <i class="far fa-file-alt" style="color: var(--sky-400); font-size: 2rem; margin-bottom: 1rem;"></i>
                <span class="number">{$clientsstats.numquotes}</span>
                <span class="label">{lang key='quotes'}</span>
            </a>
        {/if}
        <a href="supporttickets.php" class="stat-card" style="text-decoration: none;">
            <i class="fas fa-comments" style="color: var(--sky-400); font-size: 2rem; margin-bottom: 1rem;"></i>
            <span class="number">{$clientsstats.numactivetickets}</span>
            <span class="label">{lang key='navtickets'}</span>
        </a>
        <a href="clientarea.php?action=invoices" class="stat-card" style="text-decoration: none;">
            <i class="fas fa-credit-card" style="color: var(--sky-400); font-size: 2rem; margin-bottom: 1rem;"></i>
            <span class="number">{$clientsstats.numunpaidinvoices}</span>
            <span class="label">{lang key='navinvoices'}</span>
        </a>
    </div>
</div>

{foreach $addons_html as $addon_html}
    <div>
        {$addon_html}
    </div>
{/foreach}

{if $captchaError}
    <div class="alert alert-danger">
        {$captchaError}
    </div>
{/if}

<div class="client-home-panels">
    <div class="row">
        <div class="col-12">
            {function name=outputHomePanels}
                <div menuItemName="{$item->getName()}" class="card{if $item->getClass()} {$item->getClass()}{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
                    <div class="card-header" style="background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65)); border: 1px solid rgba(99,102,241,.25); border-bottom: 1px solid rgba(99,102,241,.18); padding: 1rem 1.25rem; border-radius: 16px 16px 0 0;">
                        <h3 class="card-title m-0" style="color: var(--gray-200); font-weight: 700;">
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                                <div class="float-right">
                                    <a href="{$item->getExtra('btn-link')}" class="btn btn-outline btn-sm">
                                        {if $item->getExtra('btn-icon')}<i class="{$item->getExtra('btn-icon')}"></i>{/if}
                                        {$item->getExtra('btn-text')}
                                    </a>
                                </div>
                            {/if}
                            {if $item->hasIcon()}<i class="{$item->getIcon()}" style="color: var(--sky-400);"></i>&nbsp;{/if}
                            {$item->getLabel()}
                            {if $item->hasBadge()}&nbsp;<span class="label label-active">{$item->getBadge()}</span>{/if}
                        </h3>
                    </div>
                    {if $item->hasBodyHtml()}
                        <div class="card-body" style="background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65)); color: var(--gray-300); padding: 1rem 1.25rem;">
                            {$item->getBodyHtml()}
                        </div>
                    {/if}
                    {if $item->hasChildren()}
                        <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}" style="background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65));">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getUri()}
                                    <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item list-group-item-action{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}" style="background: transparent; border: none; border-bottom: 1px solid rgba(99,102,241,.15); color: var(--gray-300); padding: .75rem 1.25rem;"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}" style="color: var(--sky-400);"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="label label-active">{$childItem->getBadge()}</span>{/if}
                                    </a>
                                {else}
                                    <div menuItemName="{$childItem->getName()}" class="list-group-item list-group-item-action{if $childItem->getClass()} {$childItem->getClass()}{/if}" style="background: transparent; border: none; border-bottom: 1px solid rgba(99,102,241,.15); color: var(--gray-300); padding: .75rem 1.25rem;" id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}" style="color: var(--sky-400);"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="label label-active">{$childItem->getBadge()}</span>{/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/if}
                    <div class="card-footer" style="background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65)); border: 1px solid rgba(99,102,241,.25); border-top: 1px solid rgba(99,102,241,.18); padding: 1rem 1.25rem; border-radius: 0 0 16px 16px; color: var(--gray-400);">
                        {if $item->hasFooterHtml()}
                            {$item->getFooterHtml()}
                        {/if}
                    </div>
                </div>
            {/function}

            {foreach $panels as $item}
                {if $item->getExtra('colspan')}
                    {outputHomePanels}
                    {assign "panels" $panels->removeChild($item->getName())}
                {/if}
            {/foreach}

        </div>
        <div class="col-md-6 col-lg-12 col-xl-6">

            {foreach $panels as $item}
                {if $item@iteration is odd}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
        <div class="col-md-6 col-lg-12 col-xl-6">

            {foreach $panels as $item}
                {if $item@iteration is even}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
    </div>
</div>
