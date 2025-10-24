document.addEventListener('DOMContentLoaded', () => {
    const modal = document.getElementById('modal');
    const modalBody = document.getElementById('modal-body');
    const closeBtn = document.querySelector('.close');

    // Cerrar modal al hacer click en la X
    if(closeBtn) {
        closeBtn.addEventListener('click', () => modal.style.display = 'none');
    }

    // Cerrar modal al hacer click fuera
    window.addEventListener('click', (e) => {
        if(e.target === modal) modal.style.display = 'none';
    });

    // Carrusel horizontal
    const carousel = document.querySelector('.platos');
    if(carousel){
        let isDown = false, startX, scrollLeft;

        carousel.addEventListener('mousedown', e => {
            isDown = true;
            startX = e.pageX - carousel.offsetLeft;
            scrollLeft = carousel.scrollLeft;
        });
        carousel.addEventListener('mouseleave', () => isDown = false);
        carousel.addEventListener('mouseup', () => isDown = false);
        carousel.addEventListener('mousemove', e => {
            if(!isDown) return;
            e.preventDefault();
            const x = e.pageX - carousel.offsetLeft;
            const walk = (x - startX) * 2;
            carousel.scrollLeft = scrollLeft - walk;
        });
    }

    // Abrir modal al hacer clic en un plato
    document.querySelectorAll('.plato').forEach(plato => {
        // Cada plato debe tener data-codigo
        const codigo = plato.getAttribute('data-codigo');
        if(!codigo) return;

        plato.addEventListener('click', () => {
            console.log('Clic en plato:', codigo); // debug
            fetch('detalle_plato.php?codigo_plato=' + codigo)
                .then(res => res.text())
                .then(data => {
                    console.log('Datos recibidos:', data); // debug
                    modalBody.innerHTML = data;
                    modal.style.display = 'flex';
                })
                .catch(err => console.error('Error al cargar plato:', err));
        });
    });
});