// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require masonry/jquery.masonry

//= require bootstrap
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales/zh-CN
//= require social-share-button
//= require social-share-button/wechat

//= require_tree .




$(function(){
    var $pins = $('#pins');
    $pins.imagesLoaded(function(){
      // $box.fadeIn();
      $pins.masonry({
        itemSelector : '.product-box',
        isFitWidth: true,
      });
    });
  });


  // 图片自适应大小支持代码块
   // 在product/show.html.erb的页面中，对img图片用这一格式进行校正
   // 让图片在大于div宽度时自动缩小不而溢出，确保版面的公正和美观
   function ReImgSize(){
     for (j=0;j<document.images.length;j++)
     {
       document.images[j].width=(document.images[j].width>420)?"420":document.images[j].width;
     }
   }

   //预览图
//    $(document).on('mouseover', '.intro-preview-item', function () {
//   var src = $(this).find('img').attr('src')
//   $('.intro-bigPic img').attr('src', src)
//     $('#thumb-lens').css('background-image', 'url(' + src + ')')
//   $(this).addClass('intro-preview-activeItem').siblings().removeClass('intro-preview-activeItem')
//   m.attach({
//         thumb: '#thumb',
//         large: src,
//         largeWrapper: 'preview'
//   })
// })
//
// $('.intro-preview-activeItem').trigger('mouseover')
// $(document).on('mouseover', '.magnifier-thumb-wrapper', function (e) {
//     $('#preview').css('visibility', 'visible')
// })
// $(document).on('mouseout', '.magnifier-thumb-wrapper', function (e) {
//     $('#preview').css('visibility', 'hidden')
// })
//fangdajing
// 放大镜
// $('#preview').css('visibility', 'hidden')
// var evt = new Event(),
//     m = new Magnifier(evt);
// m.attach({
//     thumb: '#thumb',
//     large: $('.intro-preview-activeItem img').attr('src'),
//     largeWrapper: 'preview',
//     zoom: 2
// })

//yueyan
(function($) {
  $.fn.imagezoom = function(options) {
    var settings = {
      xzoom: 460,
      yzoom: 460,
      offset: 10,
      position: "BTR",
      preload: 1
    };
    if (options) {
      $.extend(settings, options);
    }
    var noalt = '';
    var self = this;
    $(this).bind("mouseenter",
    function(ev) {
      var imageLeft = $(this).offset().left;
      var imageTop = $(this).offset().top;
      var imageWidth = $(this).get(0).offsetWidth;
      var imageHeight = $(this).get(0).offsetHeight;
      var boxLeft = $(this).parent().offset().left;
      var boxTop = $(this).parent().offset().top;
      var boxWidth = $(this).parent().width();
      var boxHeight = $(this).parent().height();
      noalt = $(this).attr("alt");
      var bigimage = $(this).attr("rel");
      $(this).attr("alt", '');
      if ($("div.zoomDiv").get().length == 0) {
        $(document.body).append("<div class='zoomDiv'><img class='bigimg' src='" + bigimage + "'/></div><div class='zoomMask'>&nbsp;</div>");
      }
      if (settings.position == "BTR") {
        if (boxLeft + boxWidth + settings.offset + settings.xzoom > screen.width) {
          leftpos = boxLeft - settings.offset - settings.xzoom;
        } else {
          leftpos = boxLeft + boxWidth + settings.offset;
        }
      } else {
        leftpos = imageLeft - settings.xzoom - settings.offset;
        if (leftpos < 0) {
          leftpos = imageLeft + imageWidth + settings.offset;
        }
      }
      $("div.zoomDiv").css({
        top: boxTop,
        left: leftpos
      });
      $("div.zoomDiv").width(settings.xzoom);
      $("div.zoomDiv").height(settings.yzoom);
      $("div.zoomDiv").show();
      $(this).css('cursor', 'crosshair');
      $(document.body).mousemove(function(e) {
        mouse = new MouseEvent(e);
        if (mouse.x < imageLeft || mouse.x > imageLeft + imageWidth || mouse.y < imageTop || mouse.y > imageTop + imageHeight) {
          mouseOutImage();
          return;
        }
        var bigwidth = $(".bigimg").get(0).offsetWidth;
        var bigheight = $(".bigimg").get(0).offsetHeight;
        var scaley = 'x';
        var scalex = 'y';
        if (isNaN(scalex) | isNaN(scaley)) {
          var scalex = (bigwidth / imageWidth);
          var scaley = (bigheight / imageHeight);
          $("div.zoomMask").width((settings.xzoom) / scalex);
          $("div.zoomMask").height((settings.yzoom) / scaley);
          $("div.zoomMask").css('visibility', 'visible');
        }
        xpos = mouse.x - $("div.zoomMask").width() / 2;
        ypos = mouse.y - $("div.zoomMask").height() / 2;
        xposs = mouse.x - $("div.zoomMask").width() / 2 - imageLeft;
        yposs = mouse.y - $("div.zoomMask").height() / 2 - imageTop;
        xpos = (mouse.x - $("div.zoomMask").width() / 2 < imageLeft) ? imageLeft: (mouse.x + $("div.zoomMask").width() / 2 > imageWidth + imageLeft) ? (imageWidth + imageLeft - $("div.zoomMask").width()) : xpos;
        ypos = (mouse.y - $("div.zoomMask").height() / 2 < imageTop) ? imageTop: (mouse.y + $("div.zoomMask").height() / 2 > imageHeight + imageTop) ? (imageHeight + imageTop - $("div.zoomMask").height()) : ypos;
        $("div.zoomMask").css({
          top: ypos,
          left: xpos
        });
        $("div.zoomDiv").get(0).scrollLeft = xposs * scalex;
        $("div.zoomDiv").get(0).scrollTop = yposs * scaley;
      });
    });
    function mouseOutImage() {
      $(self).attr("alt", noalt);
      $(document.body).unbind("mousemove");
      $("div.zoomMask").remove();
      $("div.zoomDiv").remove();
    }
    count = 0;
    if (settings.preload) {
      $('body').append("<div style='display:none;' class='jqPreload" + count + "'></div>");
      $(this).each(function() {
        var imagetopreload = $(this).attr("rel");
        var content = jQuery('div.jqPreload' + count + '').html();
        jQuery('div.jqPreload' + count + '').html(content + '<img src=\"' + imagetopreload + '\">');
      });
    }
  }
})(jQuery);
function MouseEvent(e) {
  this.x = e.pageX;
  this.y = e.pageY;
};

// addCart

$(function() {
    var offset = $("#end").offset();
    $(".addCartBtn").click(function(event){
        var addcar = $(this);
        var img = addcar.closest('.productList-item').find('.productList-item-pic img').attr('src');
        if (!img) img = $('#thumb').attr('src');
        var flyer = $('<img class="u-flyer" src="'+img+'">');
        flyer.fly({
            start: {
                left: event.pageX - 20, //开始位置（必填）#fly元素会被设置成position: fixed
                top: event.clientY - 20 //开始位置（必填）
            },
            end: {
                left: $('.fa-shopping-cart').offset().left, //结束位置（必填）
                top: $('.fa-shopping-cart').offset().top - $(window).scrollTop(), //结束位置（必填）
                width: 10, //结束时宽度
                height: 10 //结束时高度
            },
            onEnd: function(){ //结束回调
                this.destory(); //移除dom
            }
        });
    });
});

// go toTop
$(window).scroll(function () {
  if ($(this).scrollTop() > 1000) {
    $(".goTop").fadeIn(100);
  } else {
    $(".goTop").fadeOut(200);
  }

    $(".goTop").click(
    function() {
      $('html,body').scrollTop(0);
    });
})
