<div class="card" style="max-width: 540px; margin: 2rem auto; background: linear-gradient(135deg, rgba(31,41,55,.85), rgba(31,41,55,.65)); border: 1px solid rgba(99,102,241,.25); border-radius: 16px; box-shadow: 0 16px 40px rgba(56,189,248,.12);">
    <div class="card-body" style="padding: 3rem 2.5rem; text-align: center; color: var(--gray-200);">
        <h2 style="color: #fff; font-weight: 900; margin-bottom: 1.5rem;">
            <i class="far fa-times fa-2x" style="color: var(--danger-500); margin-bottom: 1rem; display: block;"></i>
            {lang key='store.addon.notFound.productUnavailable'}
        </h2>

        <p style="color: var(--gray-300); margin-bottom: 1rem;">{lang key='store.addon.notFound.productUnavailableText'}</p>

        <p style="color: var(--gray-400); font-style: italic; margin-bottom: 2rem;"><em>{lang key='store.addon.notFound.ref'}: {$productName}</em></p>

        <a href="{$WEB_ROOT}/contact.php" class="btn btn-primary" style="background: linear-gradient(135deg, var(--indigo-500), var(--indigo-600)); color: #fff; border: none; border-radius: 10px; font-weight: 800; font-size: .95rem; padding: .6rem 1rem; text-decoration: none; display: inline-flex; align-items: center; justify-content: center;">
            {lang key='store.addon.notFound.contactSupport'}
        </a>
    </div>
</div>
