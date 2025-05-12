document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll("[data-nested]").forEach(function (container) {
    const nestedType = container.dataset.nested;
    const template = document.getElementById(`${nestedType}-template`).innerHTML;
    const itemsContainer = container.querySelector(".nested-items");

    let index = Array.from(itemsContainer.children)
      .map(el => parseInt(el.dataset.index))
      .reduce((max, curr) => (curr > max ? curr : max), -1) + 1;

    // Adiciona item
    container.querySelector(".add-item").addEventListener("click", function () {
      const newHtml = template.replace(/NEW_ITEM/g, index++);
      itemsContainer.insertAdjacentHTML("beforeend", newHtml);
    });

    // Remove item (delegado)
    container.addEventListener("click", function (e) {
      if (e.target.classList.contains("remove-item")) {
        const wrapper = e.target.closest(".nested-record");
        if (wrapper.dataset.newRecord === "true") {
          wrapper.remove();
        } else {
          wrapper.querySelector(".destroy-flag").value = 1;
          wrapper.style.display = "none";
        }
      }
    });
  });
});
