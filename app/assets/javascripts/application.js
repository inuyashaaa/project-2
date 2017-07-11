//= require rails-ujs
//= require jquery
//= require toastr
//= require bootstrap-sprockets
//= require ckeditor/init
//= require typeahead.bundle
//= require social-share-button
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

$(document).ready(function(){
  addEventListener('load', function(){setTimeout(hideURLbar, 0);}, false);
  function hideURLbar(){window.scrollTo(0,1);}

  var posts = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/posts/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  console.log(posts);
  $('#search').typeahead(null, {
    source: posts
  });

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

    $('.scroll').click(function(event){
      event.preventDefault();
      $('html,body').animate({scrollTop: $(this.hash).offset().top}, 900);
    });

    $().UItoTop({easingType: 'easeOutQuart'});
  });
});
