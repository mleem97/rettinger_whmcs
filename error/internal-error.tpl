<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Fehler</title>
  <style>
    :root{
      --indigo-500:#6366f1;
      --indigo-600:#4f46e5;
      --indigo-400:#818cf8;
      --sky-400:#38bdf8;
      --sky-300:#7dd3fc;
      --gray-900:#111827;
      --gray-850:#1f2937;
      --gray-400:#9ca3af;
      --gray-200:#e5e7eb;
    }
    body{
      margin:0;
      font-family: Inter, sans-serif;
      background:var(--gray-900);
      color:var(--gray-200);
      display:grid; place-items:center;
      min-height:100vh;
      padding:40px 20px;
    }
    .card{
      background:linear-gradient(135deg, rgba(31,41,55,0.85), rgba(31,41,55,0.65));
      border:1px solid rgba(99,102,241,0.25);
      border-radius:20px;
      max-width:800px;
      width:100%;
      padding:40px 32px;
      box-shadow:0 30px 70px rgba(56,189,248,0.18);
      position:relative;
    }
    .badge{
      position:absolute; top:0; right:0;
      background:linear-gradient(135deg, var(--indigo-500), var(--sky-400));
      color:#0b1220; font-weight:900;
      padding:6px 14px; border-bottom-left-radius:14px;
      font-size:12px; text-transform:uppercase;
    }
    .eyebrow{
      display:inline-block;
      background:rgba(56,189,248,0.2);
      color:var(--sky-300);
      font-weight:800;
      text-transform:uppercase;
      padding:4px 12px; border-radius:999px;
      margin-bottom:16px;
    }
    h1{
      margin:0 0 6px;
      font-size:42px; font-weight:900;
      background:linear-gradient(135deg,#fff,var(--gray-200));
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
    }
    h2{ margin:0 0 12px; font-size:22px; font-weight:500; color:#cbd5e1; }
    p{ margin:8px 0; }
    a{ color:var(--sky-400); text-decoration:none; font-weight:700; border-bottom:1px solid rgba(56,189,248,0.35);}
    a:hover{ color:var(--indigo-400); border-color:rgba(99,102,241,0.45); }
    .btn-row{ display:flex; gap:12px; margin-top:20px; flex-wrap:wrap;}
    .btn{
      display:inline-block; padding:.75rem 1.2rem;
      border-radius:12px; font-weight:800; font-size:.95rem;
      text-decoration:none; border:1px solid transparent;
    }
    .btn-primary{ background:linear-gradient(135deg,var(--indigo-500),var(--indigo-600)); color:#fff;}
    .btn-outline{ background:transparent; color:var(--sky-400); border-color:var(--sky-400);}
    .btn-outline:hover{ background:var(--sky-400); color:#0b1220;}
    .info{ border:1px solid rgba(156,163,175,0.6); padding:12px 14px; background:rgba(129,140,248,0.08); border-radius:10px; margin-top:20px;}
    .debug{ margin-top:12px; font-family:monospace; font-size:14px; white-space:pre-wrap; color:#e5e7eb; border-top:1px dashed rgba(156,163,175,0.5); padding-top:12px;}
  </style>
</head>
<body>
  <div class="card">
    <div class="badge">Fehler</div>
    <span class="eyebrow">Ups!</span>
    <h1>Etwas ist schiefgelaufen</h1>
    <h2>Wir konnten Ihre Anfrage gerade nicht verarbeiten.</h2>
    <p>Bitte gehen Sie zur vorherigen Seite zurück und versuchen Sie es erneut.</p>
    <p>Wenn das Problem weiterhin besteht, <a href="mailto:{{email}}">kontaktieren Sie uns</a> bitte.</p>

    <div class="btn-row">
      <a class="btn btn-primary" href="{{systemurl}}">Zur Startseite</a>
      <a class="btn btn-outline" href="mailto:{{email}}">Support kontaktieren</a>
    </div>

    {{environmentIssues}}
    <div class="info">Wenn Sie Administrator sind, finden Sie unten weitere Details zur Diagnose.</div>
    <p class="debug">{{adminHelp}}<br/>{{stacktrace}}</p>
  </div>
</body>
</html>
