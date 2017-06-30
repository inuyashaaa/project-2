//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
//= require easing
//= require easyResponsiveTabs
//= require jquery.chocolat
//= require jquery.magnific-popup
//= require lightbox
//= require modernizr.custom
//= require move-top
//= require owl.carousel
//= require responsiveslides.min

$(document).on('turbolinks:load', function(){
  addEventListener('load', function(){setTimeout(hideURLbar, 0);}, false);
  function hideURLbar(){window.scrollTo(0,1);}

  $(document).ready(function($){
    $('.scroll').click(function(event){
      event.preventDefault();
      $('html,body').animate({scrollTop: $(this.hash).offset().top},900);
    });

    $('span.menu').click(function(){
      $('.top-menu ul').slideToggle(300, function(){});
    });

    $(function(){
      $('#slider4').responsiveSlides({
        auto: true,
        pager: true,
        nav: true,
        speed: 500,
        namespace: 'callbacks',
        before: function(){
          $('.events').append('<li>before event fired.</li>');
        },
        after: function(){
          $('.events').append('<li>after event fired.</li>');
        }
      });
    });

    $().UItoTop({easingType:'easeOutQuart'});
  });
});
