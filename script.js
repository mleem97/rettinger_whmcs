/* ==========================================================================
  script.js – Rettinger25 demo JS (Dummy Content + Modal Control)
  Author: Marvin Meyer
  Copyright 2025
  ========================================================================== */

// Dummy Content einsetzen
document.addEventListener("DOMContentLoaded", () => {
  // Headline & Subline
  document.getElementById("headline").textContent = "Willkommen bei Rettinger25";
  document.getElementById("subline").textContent = "Dein Partner für Hosting, Domains und Cloud-Lösungen.";

  // Services Dummy
  const services = [
    { status: "Aktiv", domain: "example1.com", product: "Webhosting Basic" },
    { status: "Gesperrt", domain: "example2.net", product: "vServer Pro" },
    { status: "Ausstehend", domain: "example3.org", product: "Cloud Storage" }
  ];

  const servicesContainer = document.getElementById("services");
  services.forEach(svc => {
    const item = document.createElement("div");
    item.className = "div-service-item";
    item.innerHTML = `
      <div class="div-service-status">
        <span class="label label-placeholder">Status</span>
        <span class="label ${svc.status === 'Aktiv' ? 'label-active' : svc.status === 'Gesperrt' ? 'label-error' : 'label-pending'}">
          ${svc.status}
        </span>
      </div>
      <div class="div-service-name">
        <span class="font-weight-bold">${svc.product}</span>
        <span class="text-domain">${svc.domain}</span>
      </div>
      <div class="div-service-buttons">
        <button class="btn btn-default btn-sm">Details</button>
        <button class="btn btn-primary btn-sm">Verwalten</button>
      </div>
    `;
    servicesContainer.appendChild(item);
  });

  // Linked Accounts Dummy
  const accounts = [
    { provider: "Google", name: "Max Mustermann", email: "max@example.com" },
    { provider: "GitHub", name: "Anna Admin", email: "anna@example.net" }
  ];
  const linkedAccounts = document.getElementById("linked-accounts");
  accounts.forEach(acc => {
    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td>${acc.provider}</td>
      <td>${acc.name}</td>
      <td>${acc.email}</td>
      <td><button class="btn btn-outline btn-sm">Trennen</button></td>
    `;
    linkedAccounts.appendChild(tr);
  });

  // TLD Logos Dummy
  const tlds = [".com", ".net", ".org"];
  const tldLogos = document.getElementById("tld-logos");
  tlds.forEach(tld => {
    const li = document.createElement("li");
    li.innerHTML = `<img src="/assets/img/placeholder/32x24.png" alt="${tld}"> Registrierung möglich`;
    tldLogos.appendChild(li);
  });

  // Modal Dummy
  document.getElementById("modal-body-text").textContent =
    "Dies ist ein Beispielinhalt, der per JavaScript in das Modal eingefügt wurde.";
});

/* ==========================================================================
   Modal Logik (Bootstrap-unabhängig)
   ========================================================================== */
document.addEventListener("click", (e) => {
  const openBtn = e.target.closest("[data-toggle='modal']");
  if (openBtn) {
    const target = openBtn.getAttribute("data-target");
    const modal = document.querySelector(target);
    if (modal) modal.classList.add("show");
    e.preventDefault();
  }

  const closeBtn = e.target.closest("[data-dismiss='modal']");
  if (closeBtn) {
    const modal = closeBtn.closest(".modal");
    if (modal) modal.classList.remove("show");
    e.preventDefault();
  }
});

// Backdrop schließen
document.addEventListener("mousedown", (e) => {
  const modal = e.target.closest(".modal");
  const dialog = e.target.closest(".modal-dialog");
  if (modal && !dialog) {
    modal.classList.remove("show");
  }
});

// ESC Taste
document.addEventListener("keydown", (e) => {
  if (e.key === "Escape") {
    const open = document.querySelector(".modal.show");
    if (open) open.classList.remove("show");
  }
});
