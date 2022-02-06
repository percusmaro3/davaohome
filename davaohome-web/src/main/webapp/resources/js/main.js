$(document).ready(function () {
    var button = $('.tab>li');
    var tabs = $('.tab_cont>div');

    button.click(function () {
        var index = $(this).index();
        button.css('background-color', '#ebe4cf').css('color', '#042e47');
        $(this).css('background-color', '#e66900').css('color', 'white');

        tabs.css('display', 'none');
        tabs.eq(index).css('display', 'block');
    });

    $('.mobile_menu_btn').click(function(){
        $('.mobile_menu').css('display','block');
    });
    
    $('#x_btn').click(function(){
        $('.mobile_menu').css('display','none');
    });
    
    $('.mobile_menu>ul>li').hover(function(){
        var mIndex = $(this).index();
        console.log(mIndex)
        $(this).css('background-color','#dfe7eb');
    }, function(){
        $(this).css('background-color','white');
    })
}); //ready
