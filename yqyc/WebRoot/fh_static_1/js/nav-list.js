$(function () {
    $(".menu_open").click(function () {
        $(".nav").animate({ 'left': '0' }, 400);
        $(".hcover").animate({ 'right': '0' }, 400);
    });
    $(".hcover").click(function () {
        $(this).animate({ 'right': '-64%' }, 400);
        $(".nav").animate({ 'left': '-64%' }, 400);
        $(".nav_ul").animate({ 'left': '0' }, 400);
        $('.nav_item_open').css('left', '-64%');
    });
    $(".nav_item i").click(function () {
        $(".nav_ul").animate({ 'left': '-100%' }, 400);
        $(this).next('.nav_item_open').css('left', '0');
    });
    $(".subopen").click(function () {
        $(this).parent('.nav_item_open').css('left', '-50%');
        $(".nav_ul").animate({ 'left': '0' }, 400);
    });
});