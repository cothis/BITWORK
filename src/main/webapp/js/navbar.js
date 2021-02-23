document.addEventListener("DOMContentLoaded", function () {
    let menu = document.querySelectorAll(".nav-menu > li");
    let timer;
    menu.forEach(function (el) {
        el.addEventListener("mouseenter", function () {
            let subMenu = this.querySelector(".sub-menu");
            if (subMenu) {
                subMenu.classList.add("show");
                el.addEventListener("mouseleave", function () {
                    clearTimeout(timer);
                    timer = setTimeout(function () {
                        subMenu.classList.remove("show");
                    }, 500);
                    subMenu.addEventListener("mouseenter", function () {
                        clearTimeout(timer);
                        subMenu.classList.add("show");
                    });
                });
            }
        });
    });
});