// Simple helper to add .icon to any span.icon elements (compatibility and optional aria-hidden handling)
document.addEventListener('DOMContentLoaded',function(){
  document.querySelectorAll('span.icon').forEach(function(el){
    // ensure element has role/presentation
    el.setAttribute('role','img');
    if(!el.getAttribute('aria-hidden')) el.setAttribute('aria-hidden','true');
  });
});
