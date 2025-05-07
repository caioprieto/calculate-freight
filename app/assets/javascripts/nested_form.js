document.addEventListener("DOMContentLoaded", function () {
  const moduloContainer = document.getElementById("modulos");
  const moduloTemplate = document.getElementById("modulo-template").innerHTML;
  const aulaTemplate = document.getElementById("aula-template").innerHTML;

  let moduloIndex = 0;

  document.getElementById("add-modulo").addEventListener("click", function () {
    const newHtml = moduloTemplate.replace(/NEW_MODULO/g, moduloIndex++);
    moduloContainer.insertAdjacentHTML("beforeend", newHtml);
  });

  document.addEventListener("click", function (e) {
    // Remover Módulo
    if (e.target.classList.contains("remove-modulo")) {
      const wrapper = e.target.closest(".modulo");
      if (wrapper.dataset.newRecord === "true") {
        wrapper.remove();
      } else {
        wrapper.querySelector(".destroy-flag").value = 1;
        wrapper.style.display = "none";
      }
    }

    // Adicionar Aula
    if (e.target.classList.contains("add-aula")) {
      const wrapper = e.target.closest(".modulo");
      const aulasDiv = wrapper.querySelector(".aulas");
      const uniqueId = new Date().getTime();
      const newAula = aulaTemplate.replace(/NEW_AULA/g, uniqueId);
      aulasDiv.insertAdjacentHTML("beforeend", newAula);
    }

    // Remover Aula
    if (e.target.classList.contains("remove-aula")) {
      const wrapper = e.target.closest(".aula");
      if (wrapper.dataset.newRecord === "true") {
        wrapper.remove();
      } else {
        wrapper.querySelector(".destroy-flag").value = 1;
        wrapper.style.display = "none";
      }
    }
  });
});
