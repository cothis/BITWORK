document.addEventListener("DOMContentLoaded", function () {
    let menu = document.querySelectorAll(".nav-menu > li");
    let myTimer = {
        timer: null,
        dom: null
    }
    menu.forEach(function (el) {
        el.addEventListener("mouseenter", function () {
            if (myTimer.timer) {
                clearTimeout(myTimer.timer);
                myTimer.dom.classList.remove("show");
            }

            let subMenu = this.querySelector(".sub-menu");
            if (subMenu) {
                subMenu.classList.add("show");
                el.addEventListener("mouseleave", function () {
                    clearTimeout(myTimer.timer);
                    myTimer.timer = setTimeout(function () {
                        subMenu.classList.remove("show");
                    }, 500);

                    subMenu.addEventListener("mouseenter", function () {
                        clearTimeout(myTimer.timer);
                        subMenu.classList.add("show");
                    });

                    myTimer.dom = subMenu;
                });
            }
        });
    });
});