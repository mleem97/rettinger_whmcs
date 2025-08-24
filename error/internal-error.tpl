<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Fehler</title>
  <!-- Internal error styles moved to style.css; body is scoped with .error-page class -->
</head>
<body class="error-page">
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
