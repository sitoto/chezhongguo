$(function(){
  $("#header .nav .more a,.nav_more_menu").hover(function(){
    $('body').unbind('mousedown');
  }, function(){
    $('body').bind('mousedown', function(){
      if($("#header .nav .more").hasClass("shown")){
        $("#header .nav .more").removeClass("shown");
        $(".nav_more_menu").css("display", "none");
      }
    });
  });
  $("#header .nav .more a").click(function(){
    if(!$("#header .nav .more").hasClass("shown")){
      $(".nav_more_menu").css("display", "block");
      $("#header .nav .more").addClass("shown");
    }else{
      $("#header .nav .more").removeClass("shown");
      $(".nav_more_menu").css("display", "none");
    }
  });
});
$(function () {
  $("table.list tr").mouseover(function () {
    $(this).addClass("over");
  });
  $("table.list tr").mouseout(function () {
    $(this).removeClass("over");
  });

  $("table.list tr:even").addClass("double");
});
