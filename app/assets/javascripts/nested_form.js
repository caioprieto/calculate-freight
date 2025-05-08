document.addEventListener("DOMContentLoaded", function () {
  const moduloContainer = document.getElementById("modulos");
  const moduloTemplate = document.getElementById("modulo-template").innerHTML;
  const aulaTemplate = document.getElementById("aula-template").innerHTML;

  // Inicializa o índice baseado nos módulos existentes
  let moduloIndex = Array.from(moduloContainer.querySelectorAll(".modulo"))
    .map((el) => parseInt(el.dataset.index))
    .reduce((max, curr) => (curr > max ? curr : max), -1) + 1;

  document.getElementById("add-modulo").addEventListener("click", function () {
    const index = moduloIndex++;
    console.log(index);
    const newHtml = moduloTemplate.replace(/NEW_MODULO/g, index);
    moduloContainer.insertAdjacentHTML("beforeend", newHtml);

    const lastModulo = moduloContainer.querySelectorAll(".modulo")[moduloContainer.querySelectorAll(".modulo").length - 1];
    lastModulo.dataset.index = index;
  });

  document.addEventListener("click", function (e) {
    if (e.target.classList.contains("remove-modulo")) {
      const wrapper = e.target.closest(".modulo");
      if (wrapper.dataset.newRecord === "true") {
        wrapper.remove();
      } else {
        wrapper.querySelector(".destroy-flag").value = 1;
        wrapper.style.display = "none";
      }
    }

    if (e.target.classList.contains("add-aula")) {
      const wrapper = e.target.closest(".modulo");
      const aulasDiv = wrapper.querySelector(".aulas");
      const moduloIndex = wrapper.dataset.index;
      const aulaIndex = new Date().getTime();

      let newAulaHtml = aulaTemplate
        .replace(/NEW_MODULO/g, moduloIndex)
        .replace(/NEW_AULA/g, aulaIndex);
      aulasDiv.insertAdjacentHTML("beforeend", newAulaHtml);
    }

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
