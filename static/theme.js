/* Theme toggle, pre-paint, no external requests. Dark-first design. */
(function(){
  var KEY='blame-theme';
  function stored(){ try{return localStorage.getItem(KEY);}catch(e){return null;} }
  function apply(m){ if(m==='dark'||m==='light'){document.documentElement.setAttribute('data-theme',m);} else {document.documentElement.removeAttribute('data-theme');} }
  apply(stored());
  document.addEventListener('DOMContentLoaded',function(){
    var btn=document.querySelector('.theme-toggle'); if(!btn) return;
    function isDark(){ var s=stored(); if(s) return s==='dark'; return !(window.matchMedia&&window.matchMedia('(prefers-color-scheme: light)').matches); }
    function label(){ btn.textContent = isDark()?'☀ light':'☾ dark'; }
    label();
    btn.addEventListener('click',function(){ var next=isDark()?'light':'dark'; try{localStorage.setItem(KEY,next);}catch(e){} apply(next); label(); });
  });
})();
