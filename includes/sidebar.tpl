{foreach $sidebar as $item}
    <div menuItemName="{$item->getName()}" class="mb-3 card{if $item->getClass()} {$item->getClass()}{/if}{if $item->getExtra('mobileSelect') and $item->hasChildren()} d-none d-md-block{/if}" style="background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65)); border: 1px solid rgba(99,102,241,.25); border-radius: 16px; box-shadow: 0 16px 40px rgba(56,189,248,.12);"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
        <div class="card-header" style="background: rgba(31,41,55,.4); border-bottom: 1px solid rgba(99,102,241,.18); padding: 1rem 1.25rem; border-radius: 16px 16px 0 0;">
            <h3 class="card-title m-0" style="color: var(--gray-200); font-weight: 700; display: flex; align-items: center; justify-content: space-between;">
                <span>
                    {if $item->hasIcon()}<i class="{$item->getIcon()}" style="color: var(--sky-400); margin-right: .5rem;"></i>{/if}
                    {$item->getLabel()}
                    {if $item->hasBadge()}<span class="label label-active" style="margin-left: .5rem;">{$item->getBadge()}</span>{/if}
                </span>
                <i class="fas fa-chevron-up card-minimise" style="color: var(--sky-400); cursor: pointer;"></i>
            </h3>
        </div>
        <div class="collapsable-card-body">
            {if $item->hasBodyHtml()}
                <div class="card-body" style="background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65)); color: var(--gray-300); padding: 1rem 1.25rem;">
                    {$item->getBodyHtml()}
                </div>
            {/if}
            {if $item->hasChildren()}
                <div class="list-group list-group-flush d-md-flex{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}" role="tablist" style="background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65));">
                    {foreach $item->getChildren() as $childItem}
                        {if $childItem->getUri()}
                            <a menuItemName="{$childItem->getName()}"
                               href="{$childItem->getUri()}"
                               class="list-group-item list-group-item-action{if $childItem->isDisabled()} disabled{/if}{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"
                               style="background: transparent; border: none; border-bottom: 1px solid rgba(99,102,241,.15); color: var(--gray-300); padding: .75rem 1.25rem; text-decoration: none; transition: background .2s, color .2s;{if $childItem->isCurrent()} background: rgba(56,189,248,.06); color: var(--sky-400); border-left: 3px solid var(--sky-400);{/if}"
                               {if $childItem->getAttribute('dataToggleTab')}
                                   data-toggle="list" role="tab"
                               {/if}
                               {assign "customActionData" $childItem->getAttribute('dataCustomAction')}
                               {if is_array($customActionData)}
                                   data-active="{$customActionData['active']}"
                                   data-identifier="{$customActionData['identifier']}"
                                   data-serviceid="{$customActionData['serviceid']}"
                               {/if}
                               {if $childItem->getAttribute('target')}
                                   target="{$childItem->getAttribute('target')}"
                               {/if}
                               id="{$childItem->getId()}"
                            >
                                <div class="sidebar-menu-item-wrapper">
                                    {if $childItem->hasIcon()}
                                        <div class="sidebar-menu-item-icon-wrapper">
                                            {if is_array($customActionData)}
                                                <span class="loading" style="display: none;">
                                                    <i class="fas fa-spinner fa-spin fa-fw"></i>
                                                </span>
                                            {/if}
                                            <i class="{$childItem->getIcon()} sidebar-menu-item-icon"></i>
                                        </div>
                                    {/if}
                                    <div class="sidebar-menu-item-label">
                                        {$childItem->getLabel()}
                                    </div>
                                    {if $childItem->hasBadge()}
                                        <div class="sidebar-menu-item-badge">
                                            <span class="badge">{$childItem->getBadge()}</span>
                                        </div>
                                    {/if}
                                </div>
                            </a>
                        {else}
                            <div menuItemName="{$childItem->getName()}" class="list-group-item list-group-item-action{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                {if $childItem->hasBadge()}<span class="badge float-right">{$childItem->getBadge()}</span>{/if}
                                {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                {$childItem->getLabel()}
                            </div>
                        {/if}
                    {/foreach}
                </div>
            {/if}
        </div>
        {if $item->hasFooterHtml()}
            <div class="card-footer clearfix">
                {$item->getFooterHtml()}
            </div>
        {/if}
    </div>
    {if $item->getExtra('mobileSelect') and $item->hasChildren()}
        {* Mobile Select only supports dropdown menus *}
        <div class="card d-block d-md-none {if $item->getClass()}{$item->getClass()}{else}bg-light{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
            <div class="card-header">
                <h3 class="card-title">
                    {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                    {$item->getLabel()}
                    {if $item->hasBadge()}&nbsp;<span class="badge float-right">{$item->getBadge()}</span>{/if}
                </h3>
            </div>
            <div class="card-body">
                <form role="form">
                    <select class="form-control" onchange="selectChangeNavigate(this)">
                        {foreach $item->getChildren() as $childItem}
                            <option menuItemName="{$childItem->getName()}" value="{$childItem->getUri()}" class="list-group-item list-group-item-action" {if $childItem->isCurrent()}selected="selected"{/if}>
                                {$childItem->getLabel()}
                                {if $childItem->hasBadge()}({$childItem->getBadge()}){/if}
                            </option>
                        {/foreach}
                    </select>
                </form>
            </div>
            {if $item->hasFooterHtml()}
                <div class="card-footer">
                    {$item->getFooterHtml()}
                </div>
            {/if}
        </div>
    {/if}
{/foreach}
