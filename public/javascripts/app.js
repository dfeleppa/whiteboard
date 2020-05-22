const navSlide = () => {
    const burger = document.querySelector('.burger');
    const nav = document.querySelector('.nav-links');
    const navLinks = document.querySelectorAll('nav-links li');

    burger.addEventListener('click', () => {
        nav.classList.toggle('nav-active');
        
        // navLinks.forEach((link, index) => {
        //     link.style.animation = `navLinkFade 2s ease forwards ${index/5+2}s`;
        //     if (link.style.animation) {
        //         link.style.animation = '';
        //     } else {        
        //         link.style.animation = `navLinkFade 2s ease forwards ${index/5+2}s`;
        //     }
        // });
        burger.classList.toggle('toggle');

    });
}

navSlide();