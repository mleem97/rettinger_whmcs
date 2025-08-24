{include file="$template/error/page-not-found.tpl"}

<div class="alert text-center mb-5" 
     style="margin:2rem auto; max-width:900px; padding:1.5rem 2rem; border:1px solid rgba(56,189,248,0.35); border-radius:12px; 
            background:linear-gradient(135deg, rgba(31,41,55,0.75), rgba(31,41,55,0.55)); 
            color:#e5e7eb; font-size:1rem; line-height:1.6;">

    Entschuldigung, aber die vorherige Seite 
    (<a href="{$referrer|escape}" 
        style="color:#38bdf8; font-weight:600; text-decoration:none; border-bottom:1px solid rgba(56,189,248,0.35); transition:.3s;">
        {$referrer|escape}
     </a>) 
    hat einen ungültigen Seitenlink übergeben.
</div>
