(function ($) {
    "use strict";

    /*[ Load page ]
    ===========================================================*/
    $(".animsition").animsition({
        inClass: 'fade-in',
        outClass: 'fade-out',
        inDuration: 1500,
        outDuration: 800,
        linkElement: '.animsition-link',
        loading: true,
        loadingParentElement: 'html',
        loadingClass: 'animsition-loading-1',
        loadingInner: '<div class="loader05"></div>',
        timeout: false,
        timeoutCountdown: 5000,
        onLoadEvent: true,
        browser: ['animation-duration', '-webkit-animation-duration'],
        overlay: false,
        overlayClass: 'animsition-overlay-slide',
        overlayParentElement: 'html',
        transition: function (url) { window.location.href = url; }
    });

    /*[ Back to top ]
    ===========================================================*/
    var windowH = $(window).height() / 2;

    $(window).on('scroll', function () {
        if ($(this).scrollTop() > windowH) {
            $("#myBtn").css('display', 'flex');
        } else {
            $("#myBtn").css('display', 'none');
        }
    });

    $('#myBtn').on("click", function () {
        $('html, body').animate({ scrollTop: 0 }, 300);
    });


    /*==================================================================
    [ Fixed Header ]*/
    var headerDesktop = $('.container-menu-desktop');
    var wrapMenu = $('.wrap-menu-desktop');

    if ($('.top-bar').length > 0) {
        var posWrapHeader = $('.top-bar').height();
    }
    else {
        var posWrapHeader = 0;
    }


    if ($(window).scrollTop() > posWrapHeader) {
        $(headerDesktop).addClass('fix-menu-desktop');
        $(wrapMenu).css('top', 0);
    }
    else {
        $(headerDesktop).removeClass('fix-menu-desktop');
        $(wrapMenu).css('top', posWrapHeader - $(this).scrollTop());
    }

    $(window).on('scroll', function () {
        if ($(this).scrollTop() > posWrapHeader) {
            $(headerDesktop).addClass('fix-menu-desktop');
            $(wrapMenu).css('top', 0);
        }
        else {
            $(headerDesktop).removeClass('fix-menu-desktop');
            $(wrapMenu).css('top', posWrapHeader - $(this).scrollTop());
        }
    });


    /*==================================================================
    [ Menu mobile ]*/
    $('.btn-show-menu-mobile').on('click', function () {
        $(this).toggleClass('is-active');
        $('.menu-mobile').slideToggle();
    });

    var arrowMainMenu = $('.arrow-main-menu-m');

    for (var i = 0; i < arrowMainMenu.length; i++) {
        $(arrowMainMenu[i]).on('click', function () {
            $(this).parent().find('.sub-menu-m').slideToggle();
            $(this).toggleClass('turn-arrow-main-menu-m');
        })
    }

    $(window).resize(function () {
        if ($(window).width() >= 992) {
            if ($('.menu-mobile').css('display') == 'block') {
                $('.menu-mobile').css('display', 'none');
                $('.btn-show-menu-mobile').toggleClass('is-active');
            }

            $('.sub-menu-m').each(function () {
                if ($(this).css('display') == 'block') {
                    console.log('hello');
                    $(this).css('display', 'none');
                    $(arrowMainMenu).removeClass('turn-arrow-main-menu-m');
                }
            });

        }
    });


    /*==================================================================
    [ Show / hide modal search ]*/
    $('.js-show-modal-search').on('click', function () {
        $('.modal-search-header').addClass('show-modal-search');
        $(this).css('opacity', '0');
    });

    $('.js-hide-modal-search').on('click', function () {
        $('.modal-search-header').removeClass('show-modal-search');
        $('.js-show-modal-search').css('opacity', '1');
    });

    $('.container-search-header').on('click', function (e) {
        e.stopPropagation();
    });


    /*==================================================================
    [ Isotope ]*/
    var $topeContainer = $('.isotope-grid');
    var $filter = $('.filter-tope-group');

    // filter items on button click
    $filter.each(function () {
        $filter.on('click', 'button', function () {
            var filterValue = $(this).attr('data-filter');
            $topeContainer.isotope({ filter: filterValue });
        });

    });

    // init Isotope
    $(window).on('load', function () {
        var $grid = $topeContainer.each(function () {
            $(this).isotope({
                itemSelector: '.isotope-item',
                layoutMode: 'fitRows',
                percentPosition: true,
                animationEngine: 'best-available',
                masonry: {
                    columnWidth: '.isotope-item'
                }
            });
        });
    });

    var isotopeButton = $('.filter-tope-group button');

    $(isotopeButton).each(function () {
        $(this).on('click', function () {
            for (var i = 0; i < isotopeButton.length; i++) {
                $(isotopeButton[i]).removeClass('how-active1');
            }

            $(this).addClass('how-active1');
        });
    });

    /*==================================================================
    [ Filter / Search product ]*/
    $('.js-show-filter').on('click', function () {
        $(this).toggleClass('show-filter');
        $('.panel-filter').slideToggle(400);

        if ($('.js-show-search').hasClass('show-search')) {
            $('.js-show-search').removeClass('show-search');
            $('.panel-search').slideUp(400);
        }
    });

    $('.js-show-search').on('click', function () {
        $(this).toggleClass('show-search');
        $('.panel-search').slideToggle(400);

        if ($('.js-show-filter').hasClass('show-filter')) {
            $('.js-show-filter').removeClass('show-filter');
            $('.panel-filter').slideUp(400);
        }
    });




    /*==================================================================
    [ Cart ]*/
    $('.js-show-cart').on('click', function () {
        $('.js-panel-cart').addClass('show-header-cart');
        window.location.href = "/sepet";
    });

    $('.js-hide-cart').on('click', function () {
        $('.js-panel-cart').removeClass('show-header-cart');
    });


    /*==================================================================
    [ Cart ]*/
    //$('.js-show-sidebar').on('click',function(){
    //    $('.js-sidebar').addClass('show-sidebar');
    //});

    //$('.js-hide-sidebar').on('click',function(){
    //    $('.js-sidebar').removeClass('show-sidebar');
    //});

    /*==================================================================
    [ +/- num product ]*/
    $(document).ready(function () {
        $('.btn-num-product-down').on('click', function () {
            var input = $(this).siblings('.num-product');
            var currentValue = parseInt(input.val());
            var price = parseFloat(input.data('price'));
            if (currentValue > 1) {
                input.val(currentValue - 1); // Miktarı 1 azalt
                updateTotalPrice(input, price);
            }
        });

        $('.btn-num-product-up').on('click', function () {
            var input = $(this).siblings('.num-product');
            var currentValue = parseInt(input.val());
            var price = parseFloat(input.data('price'));
            input.val(currentValue + 1); // Miktarı 1 arttır
            updateTotalPrice(input, price);
        });

        function updateTotalPrice(input, price) {
            var quantity = parseInt(input.val());
            var totalPrice = quantity * price;
            var totalPriceField = input.closest('.table_row').find('.column-5');
            totalPriceField.text(totalPrice.toFixed(2) + ' ₺');

            // Sepetin toplam fiyatını güncelle
            updateCartTotalPrice();
        }

        // Sepetin toplam fiyatını güncellemek için bu işlevi çağırın
        function updateCartTotalPrice() {
            var total = 0;
            $('.table_row').each(function () {
                var priceStr = $(this).find('.column-5').text().trim();
                var price = parseFloat(priceStr.replace('₺', ''));
                total += price;
            });

            // Güncellenmiş toplam fiyatı göster
            $('#cart-total').text(total.toFixed(2) + ' ₺');
        }

        // İlk yüklemeye göre toplam fiyatı güncelleyin
        updateCartTotalPrice();
    });



    /*==================================================================
    [ Rating ]*/
    $('.wrap-rating').each(function () {
        var item = $(this).find('.item-rating');
        var rated = -1;
        var input = $(this).find('input');
        $(input).val(0);

        $(item).on('mouseenter', function () {
            var index = item.index(this);
            var i = 0;
            for (i = 0; i <= index; i++) {
                $(item[i]).removeClass('zmdi-star-outline');
                $(item[i]).addClass('zmdi-star');
            }

            for (var j = i; j < item.length; j++) {
                $(item[j]).addClass('zmdi-star-outline');
                $(item[j]).removeClass('zmdi-star');
            }
        });

        $(item).on('click', function () {
            var index = item.index(this);
            rated = index;
            $(input).val(index + 1);
        });

        $(this).on('mouseleave', function () {
            var i = 0;
            for (i = 0; i <= rated; i++) {
                $(item[i]).removeClass('zmdi-star-outline');
                $(item[i]).addClass('zmdi-star');
            }

            for (var j = i; j < item.length; j++) {
                $(item[j]).addClass('zmdi-star-outline');
                $(item[j]).removeClass('zmdi-star');
            }
        });
    });

    /*==================================================================
    [ Show modal1 ]*/
    $('.js-show-modal1').on('click', function (e) {
        e.preventDefault();
        $('.js-modal1').addClass('show-modal1');
    });

    $('.js-hide-modal1').on('click', function () {
        $('.js-modal1').removeClass('show-modal1');
    });

    getCartCount()

})(jQuery);

function getCartCount() {
    $.ajax({
        type: "GET",
        url: "/sepet/sepetsayisi",
        success: function (data) {
            $(".icon-header-noti[data-notify]").attr("data-notify", data); // Değişiklik burada
        },
        error: function (e) {
            alert(e.responseText);
        }
    });
}




function addCart(productid, stock) {
    var istenilenMiktar = $(".num-product").val();
    if (istenilenMiktar <= stock) {
        // Sepete eklenecek toplam ürün sayısını hesapla
        var totalInCart = getTotalInCart();
        if (stock - totalInCart === 1 && istenilenMiktar === 2) {
            // Sepette son 1 ürün kaldığında ve eklenen ürün sayısı 2 ise mesajı göster
            alert('Son 1 ürün kaldı!');
        }
        $.ajax({
            type: "POST",
            url: "/sepet/sepeteekle",
            data: { "productid": productid, "quantity": istenilenMiktar },
            success: function (data) {
                if (data.indexOf("~") == -1) {
                    Swal.fire({
                        title: 'Başarılı!',
                        text: data + " ürününden " + istenilenMiktar + " adet sepete eklendi!",
                        icon: 'success',
                        confirmButtonText: 'Tamam'
                    });
                    getCartCount(); // Sepetteki ürün sayısını güncelle
                } else {
                    alert(data); // Eğer beklenmeyen bir hata varsa alert ile göster
                }
            },
            error: function (xhr, status, error) {
                var errorMessage = xhr.status + ': ' + xhr.statusText;
                alert('Error - ' + errorMessage);
            }
        });
    } else {
        alert("Maksimum " + stock + " adet ürün sipariş edebilirsiniz");
    }
}


// Sepetteki toplam ürün sayısını alır
function getTotalInCart() {
    var total = 0;
    $('.num-product').each(function () {
        total += parseInt($(this).val());
    });
    return total;
}


function removeCart(productid) {
    $.ajax({
        type: "POST",
        url: "/sepet/sepettensil",
        data: { productid: productid },
        success: function (response) {
            if (response === "OK") {
                // Sepetin yeniden yüklenmesi gerekebilir
                location.reload();
            } else {
                alert("Ürünü sepetten kaldırırken bir hata oluştu.");
            }
        },
        error: function () {
            alert("Sunucu hatası. Ürünü sepetten kaldırırken bir hata oluştu.");
        }
    });
}



function funcSelectPaymentOption(_obje) {
    var selectOption = $(_obje).val();
    $(".divPaymentOption").slideUp();
    switch (selectOption) {

        case "1": $(".creditCard").slideDown();
            break;
        case "2": $(".bank").slideDown();
            break;
        case "3": $(".door").slideDown();
            break;
    }
}

function checkoutControl() {
    var mesaj = "";
    if ($(".selectPaymentOption").val() == "") {
        mesaj = "Lütfen Bir Ödeme Seçeneği Belirtiniz";
    } if (mesaj != "") {
        alert(mesaj)
        return false;
    }
}