

let currentIndex = 0;

function showSlide(index) {
    const carouselImages = document.getElementById('carouselImages');
    const totalImages = carouselImages.children.length;
    if (index >= totalImages) {
        currentIndex = 0;
    } else if (index < 0) {
        currentIndex = totalImages - 1;
    } else {
        currentIndex = index;
    }
    const offset = -currentIndex * 100;
    carouselImages.style.transform = `translateX(${offset}%)`;
}

function nextSlide() {
    showSlide(currentIndex + 1);
}

function prevSlide() {
    showSlide(currentIndex - 1);
}





document.addEventListener('DOMContentLoaded', (event) => {
    const frases = document.querySelectorAll('.titulo-carousel p');
    let index = 0;

    setInterval(() => {
        frases[index].style.display = 'none';
        index = (index + 1) % frases.length;
        frases[index].style.display = 'block';
    }, 10000); // Troca de frase a cada 10 segundos
});