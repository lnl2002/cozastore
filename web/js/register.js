var formBox = document.querySelector('.form-box');
var nextLink = document.querySelector('.next-link');

nextLink.addEventListener('click', () => {
    formBox.classList.add('active');
});
