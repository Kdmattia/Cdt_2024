document.addEventListener('DOMContentLoaded', function() {
    var pulsanti = document.querySelector('.pulsanti');
    var pulsantiOffsetTop = pulsanti.offsetTop;

    window.addEventListener('scroll', function() {
        if (window.scrollY > pulsantiOffsetTop) {
            pulsanti.classList.add('fixed');
        } else {
            pulsanti.classList.remove('fixed');
        }
    });
});


$(document).ready(function(){
    // Funzione per alternare il background-colore dello span1
    $('.yellow').click(function(){
        let pers_reale = $('.pers_reale');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(pers_reale.css('background-color') == 'rgb(255, 255, 0)') {
            pers_reale.css('background-color', '');
        } else {
            pers_reale.css('background-color', 'rgb(255, 255, 0)');
        }
    });

    // Funzione per alternare il background-colore dello span2
    $('.gray').click(function(){
        let personaggio = $('.personaggio');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(personaggio.css('background-color') === 'rgb(128, 128, 128)') {
            personaggio.css('background-color', '');
        } else {
            personaggio.css('background-color', 'rgb(128, 128, 128)');
        }
    });

    // Funzione per alternare il background-colore dello span3
    $('.gold').click(function(){
        let titolo_opera = $('.titolo_opera');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(titolo_opera.css('background-color') === 'rgb(218, 165, 32)') {
            titolo_opera.css('background-color', '');
        } else {
            titolo_opera.css('background-color', 'rgb(218, 165, 32)');
        }
    });

    // Funzione per alternare il background-colore dello span4
    $('.pink').click(function(){
        let luogo = $('.luogo');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(luogo.css('background-color') === 'rgb(255, 105, 180)') {
            luogo.css('background-color', '');
        } else {
            luogo.css('background-color', 'rgb(255, 105, 180)');
        }
    });

    // Funzione per alternare il background-colore dello span5
    $('.purple').click(function(){
        let luogo_naturale = $('.luogo_naturale');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(luogo_naturale.css('background-color') === 'rgb(128, 0, 128)') {
            luogo_naturale.css('background-color', '');
        } else {
            luogo_naturale.css('background-color', 'rgb(128, 0, 128)');
        }
    });

    // Funzione per alternare il background-colore dello span6
    $('.orange').click(function(){
        let Rivista = $('.Rivista');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(Rivista.css('background-color') === 'rgb(255, 140, 0)') {
            Rivista.css('background-color', '');
        } else {
            Rivista.css('background-color', 'rgb(255, 140, 0)');
        }
    });

    // Funzione per alternare il background-colore dello span7
    $('.light_green').click(function(){
        let date = $('.date');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(date.css('background-color') === 'rgb(124, 252, 0)') {
            date.css('background-color', '');
        } else {
            date.css('background-color', 'rgb(124, 252, 0)');
        }
    });

    // Funzione per alternare il background-colore dello span8
    $('.red').click(function(){
        let verbum = $('.verbum');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(verbum.css('background-color') === 'rgb(255, 0, 0)') {
            verbum.css('background-color', '');
        } else {
            verbum.css('background-color', 'rgb(255, 0, 0)');
        }
    });

    // Funzione per alternare il background-colore dello span9
    $('.dark_green').click(function(){
        let tema = $('.tema');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(tema.css('background-color') === 'rgb(0, 100, 0)') {
            tema.css('background-color', '');
        } else {
            tema.css('background-color', 'rgb(0, 100, 0)');
        }
    });

    // Funzione per alternare il background-colore dello span10
    $('.cyan').click(function(){
        let foreign = $('.foreign');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(foreign.css('background-color') === 'rgb(0, 206, 209)') {
            foreign.css('background-color', '');
        } else {
            foreign.css('background-color', 'rgb(0, 206, 209)');
        }
    });

    // Funzione per alternare il background-colore dello span11
    $('.blue').click(function(){
        let cit = $('.cit');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(cit.css('background-color') === 'rgb(0, 0, 255)') {
            cit.css('background-color', '');
        } else {
            cit.css('background-color', 'rgb(0, 0, 255)');
        }
    });

    // Funzione per alternare il background-colore dello span12
    $('.brown').click(function(){
        let organizzazione = $('.organizzazione');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'
        if(organizzazione.css('background-color') === 'rgb(139, 69, 19)') {
            organizzazione.css('background-color', '');
        } else {
            organizzazione.css('background-color', 'rgb(139, 69, 19)');
        }
    });
    
    // Funzione per mostrare e nascondere correzioni
    $('.correzioni').click(function() {
        let sic = $('.sic');
        let corr = $('.corr');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'

        
        if (sic.css('display') != 'none') {
            sic.css('display', 'none');
            corr.css('display', 'inline');
        } else {
            corr.css('display', 'none');
            sic.css('display', 'inline');
        }
    });

    // Funzione per mostrare e nascondere normalizzazioni
    $('.normalizzazioni').click(function() {
        let orig = $('.orig');
        let reg = $('.reg');
        $(this).toggleClass('active'); // Aggiungi o rimuovi la classe 'active'

        
        if (orig.css('display') != 'none') {
            orig.css('display', 'none');
            reg.css('display', 'inline');
        } else {
            reg.css('display', 'none');
            orig.css('display', 'inline');
        }
    })

    $('area').click(function() {
        $("b").removeClass('paragrafo_mappa');
        var areaId = $(this).attr('id'); // Ottieni l'ID dell'area cliccata
        var targetB = $("b#" + areaId); // Seleziona il b con l'ID corrispondente
        targetB.addClass('paragrafo_mappa');
    
        if (targetB.length) {
            var offset = 100;
            $('html, body').animate({
                scrollTop: targetB.offset().top - offset // Scorri fino alla posizione del b considerando lo spazio occupato dai pulsanti
            }, 1000);
        } else {
            console.error('<b> con classe ' + areaId + ' non trovato');
        }
    });
})


$(document).ready(function() {
    var timeout;

    $('.pers_reale').on('mouseover', function() {
        clearTimeout(timeout);
        var infoDiv = $(this).next('.pers_info');
        infoDiv.css({
            'visibility': 'visible',
            'opacity': '1'
        });
    });

    $('.pers_reale').on('mouseleave', function() {
        var infoDiv = $(this).next('.pers_info');
        timeout = setTimeout(function() {
            infoDiv.css({
                'visibility': 'hidden',
                'opacity': '0'
            });
        }, 500);
    });

    $('.personaggio').on('mouseover', function() {
        clearTimeout(timeout);
        var infoDiv = $(this).next('.pers_info');
        infoDiv.css({
            'visibility': 'visible',
            'opacity': '1'
        });
    });

    $('.personaggio').on('mouseleave', function() {
        var infoDiv = $(this).next('.pers_info');
        timeout = setTimeout(function() {
            infoDiv.css({
                'visibility': 'hidden',
                'opacity': '0'
            });
        }, 500);
    });

    $('.pers_info').on('mouseover', function() {
        clearTimeout(timeout);
    });

    $('.pers_info').on('mouseleave', function() {
        var infoDiv = $(this);
        timeout = setTimeout(function() {
            infoDiv.css({
                'visibility': 'hidden',
                'opacity': '0'
            });
        });
    });
});

$(document).ready(function() {
    var timeout_biblio;

    $('.titolo_opera').on('mouseover', function() {
        clearTimeout(timeout_biblio);
        var infoDiv = $(this).next('.bibliografia');
        infoDiv.css({
            'visibility': 'visible',
            'opacity': '1'
        });
    });

    $('.titolo_opera').on('mouseleave', function() {
        var infoDiv = $(this).next('.bibliografia');
        timeout_biblio = setTimeout(function() {
            infoDiv.css({
                'visibility': 'hidden',
                'opacity': '0'
            });
        }, 500);
    });

    $('.bibliografia').on('mouseover', function() {
        clearTimeout(timeout);
    });

    $('.bibliografia').on('mouseleave', function() {
        var infoDiv = $(this);
        timeout = setTimeout(function() {
            infoDiv.css({
                'visibility': 'hidden',
                'opacity': '0'
            });
        });
    });
});

$(document).ready(function() {
    // Gestisce Descrizione Bibliografica
    $('#bibliografia').click(function() {
        $('#el_footer1').toggle();
        $('#el_footer2').hide();
    });

    //     // Gestisce Informazioni sulla Codifica
    $('#codifica').click(function() {
        $('#el_footer2').toggle();
        $('#el_footer1').hide();
    });
});