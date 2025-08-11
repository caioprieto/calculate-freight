document.addEventListener("DOMContentLoaded", () => {
  const modal = document.getElementById("notify-modal");
  const list = modal.querySelector("ul");
  let lastNotificationId = null;

  function playNotificationSound() {
    const audio = new Audio('/audios/notification.mp3');
    audio.play();
  }

  async function fetchNotifications() {
    try {
      const response = await fetch('/notifications.json'); // Crie essa rota ou API
      const data = await response.json();

      if (data.length > 0) {
        const newest = data[0];
        if (!lastNotificationId || newest.id > lastNotificationId) {
          lastNotificationId = newest.id;
          updateNotificationList(data);
          playNotificationSound();
          showNotificationModal();
        }
      }
    } catch (error) {
      console.error('Erro ao buscar notificações:', error);
    }
  }

  function updateNotificationList(notifications) {
    list.innerHTML = '';
    notifications.forEach((notification) => {
      const li = document.createElement('li');
      li.className = 'list-group-item notification-item p-0';

      li.innerHTML = `
        <button class="accordion-toggle w-100 border-0 text-start px-3 py-3 bg-white d-flex justify-content-between align-items-center" type="button">
          <div>
            <h6 class="fw-semibold mb-0" style="font-size: 14px;">${notification.title || 'Nova notificação'}</h6>
          </div>
          <span class="badge bg-primary rounded-pill">Novo</span>
        </button>
        <div class="accordion-body px-3 py-2 text-muted" style="display: none; font-size: 13px">
          ${notification.body}
        </div>
      `;

      list.appendChild(li);
    });

    // rebind accordion toggle
    document.querySelectorAll(".accordion-toggle").forEach(function (button) {
      button.addEventListener("click", function () {
        const body = this.nextElementSibling;
        body.style.display = (body.style.display === "none" || body.style.display === "") ? "block" : "none";
      });
    });
  }

  function showNotificationModal() {
    modal.style.display = "block";
    modal.classList.add("pulse");
    setTimeout(() => modal.classList.remove("pulse"), 2000);
  }

  // 🔁 Checa novas notificações a cada 15 segundos
  setInterval(fetchNotifications, 15000);

  fetchNotifications();
});
