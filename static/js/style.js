document.addEventListener('DOMContentLoaded', function () {
    const mainImage = document.getElementById('main-product-image');
    const thumbnails = document.querySelectorAll('.product-thumbnail');
    if (!mainImage || thumbnails.length === 0) {
        return;
    }

    thumbnails.forEach(function (thumbnail) {
        thumbnail.addEventListener('click', function () {
            const selectedImage = thumbnail.dataset.image;

            mainImage.src = selectedImage;

            thumbnails.forEach(function (item) {
                item.classList.remove('active');
            });

            thumbnail.classList.add('active');
        });
    });
});
