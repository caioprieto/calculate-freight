window.showLoadingAndRedirect = function () {
  console.log('entrei');
  const overlay = document.getElementById('loadingOverlay');
  if (overlay) {
    overlay.style.display = 'flex';

    setTimeout(() => {
      window.location.href = "/user/dashboard";
      overlay.style.display = 'none';
    }, 2000);
  } else {
    console.warn('Overlay não encontrado!');
  }
};
