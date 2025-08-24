{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
    <div class="section">
        <div class="container">
            <h2 class="text-center title-gradient">{lang key='clientHomePanels.productsAndServices'}</h2>

            <div class="features-grid">
                {foreach $productGroups as $productGroup}
                    <div class="feature-card">
                        <div class="icon">
                            <i class="fas fa-cube"></i>
                        </div>
                        <h3>{$productGroup->name}</h3>
                        <p>{$productGroup->tagline}</p>
                        <a href="{$productGroup->getRoutePath()}" class="btn btn-primary">
                            {lang key='browseProducts'}
                        </a>
                    </div>
                {/foreach}

                {if $registerdomainenabled}
                    <div class="feature-card">
                        <div class="icon">
                            <i class="fas fa-globe"></i>
                        </div>
                        <h3>{lang key='orderregisterdomain'}</h3>
                        <p>{lang key='secureYourDomain'}</p>
                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="btn btn-primary">
                            {lang key='navdomainsearch'}
                        </a>
                    </div>
                {/if}
                {if $transferdomainenabled}
                    <div class="feature-card">
                        <div class="icon">
                            <i class="fas fa-exchange-alt"></i>
                        </div>
                        <h3>{lang key='transferYourDomain'}</h3>
                        <p>{lang key='transferExtend'}</p>
                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="btn btn-primary">
                            {lang key='transferYourDomain'}
                        </a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
{/if}

<div class="section">
    <div class="container">
        <h2 class="text-center title-gradient">{lang key='howCanWeHelp'}</h2>
        
        <div class="features-grid">
            <div class="feature-card">
                <div class="icon">
                    <i class="fas fa-bullhorn"></i>
                </div>
                <h3>{lang key='announcementstitle'}</h3>
                <p>Stay updated with our latest news and announcements</p>
                <a href="{routePath('announcement-index')}" class="btn btn-outline">View Announcements</a>
            </div>
            <div class="feature-card">
                <div class="icon">
                    <i class="fas fa-server"></i>
                </div>
                <h3>{lang key='networkstatustitle'}</h3>
                <p>Check the status of our servers and network infrastructure</p>
                <a href="serverstatus.php" class="btn btn-outline">Check Status</a>
            </div>
            <div class="feature-card">
                <div class="icon">
                    <i class="fas fa-book"></i>
                </div>
                <h3>{lang key='knowledgebasetitle'}</h3>
                <p>Find answers to common questions and learn how to use our services</p>
                <a href="{routePath('knowledgebase-index')}" class="btn btn-outline">Browse Articles</a>
            </div>
            <div class="feature-card">
                <div class="icon">
                    <i class="fas fa-download"></i>
                </div>
                <h3>{lang key='downloadstitle'}</h3>
                <p>Download software, tools and resources for your services</p>
                <a href="{routePath('download-index')}" class="btn btn-outline">View Downloads</a>
            </div>
            <div class="feature-card">
                <div class="icon">
                    <i class="fas fa-life-ring"></i>
                </div>
                <h3>{lang key='homepage.submitTicket'}</h3>
                <p>Get help from our support team by submitting a support ticket</p>
                <a href="submitticket.php" class="btn btn-success">Submit Ticket</a>
            </div>
        </div>
    </div>
</div>

<div class="section">
    <div class="container">
        <h2 class="text-center title-gradient">{lang key='homepage.yourAccount'}</h2>
        
        <div class="tech-grid">
            <div class="tech-card">
                <div class="icon">
                    <i class="fas fa-home"></i>
                </div>
                <h3>{lang key='homepage.yourAccount'}</h3>
                <p>Access your client area dashboard</p>
                <a href="clientarea.php" class="btn btn-primary">Go to Dashboard</a>
            </div>
            <div class="tech-card">
                <div class="icon">
                    <i class="fas fa-cubes"></i>
                </div>
                <h3>{lang key='homepage.manageServices'}</h3>
                <p>Manage your active services and products</p>
                <a href="clientarea.php?action=services" class="btn btn-primary">Manage Services</a>
            </div>
            {if $registerdomainenabled || $transferdomainenabled || $numberOfDomains}
                <div class="tech-card">
                    <div class="icon">
                        <i class="fas fa-globe"></i>
                    </div>
                    <h3>{lang key='homepage.manageDomains'}</h3>
                    <p>Control your domain names and DNS settings</p>
                    <a href="clientarea.php?action=domains" class="btn btn-primary">Manage Domains</a>
                </div>
            {/if}
            <div class="tech-card">
                <div class="icon">
                    <i class="fas fa-comments"></i>
                </div>
                <h3>{lang key='homepage.supportRequests'}</h3>
                <p>View and manage your support tickets</p>
                <a href="supporttickets.php" class="btn btn-primary">View Tickets</a>
            </div>
            <div class="tech-card">
                <div class="icon">
                    <i class="fas fa-credit-card"></i>
                </div>
                <h3>{lang key='homepage.makeAPayment'}</h3>
                <p>Pay your outstanding invoices quickly</p>
                <a href="clientarea.php?action=masspay&all=true" class="btn btn-success">Make Payment</a>
            </div>
        </div>
    </div>
</div>
