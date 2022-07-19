$(function () {
    $('.sub-nav').hide()
    $('.main-nav > li').each(function (i) {
        $(this).hover(
            function () {
                $(this).find('.sub-nav').stop().slideDown()
                $('.main-nav > li').not($(this)).addClass('active')
                $(this).addClass('active2')
                $(this).find('.bar').css({
                    opacity: 1
                })
            },
            function () {
                $(this).find('.sub-nav').stop().slideUp()
                $('.main-nav > li').removeClass('active')
                $(this).removeClass('active2')
                $(this).find('.bar').css({
                    opacity: 0
                })
            }
        )
    })

var checkState = true;
$('.tttt').click(function(){
    if (checkState){
        $('.ttttt').css({"display":"block","margin-top":"3px","margin-bottom":"20px"})
        $('.mo_schedule').css({"display":"block","display":"flex"})
        $('.mo_schedule').css({"padding":"23px 0"})
        checkState = false;
    } else {
        $('.ttttt').css({"display":"none"})
        checkState = true;
    }
})



var checkState_1 = true;
$('.btn').click(function(){
    if (checkState_1){
        $('.buy_pass').css({"border-bottom":"none"})
        $('.buy_bt').toggleClass('bpm')
        $('.uspec_oneday_pass_SubBox').css({"margin-top":"23px"})
        $('.buy_bt').toggleClass('vv')
        // $('.mo_schedule').css({"display":"block","display":"flex"})
        // $('.mo_schedule').css({"padding":"23px 0"})


        checkState_1 = false;
    } else {
        $('.buy_bt').removeClass('vv')
        $('.buy_bt').removeClass('bpm')
        $('.buy_pass').css({"border-bottom":"2px solid black"})
        $('.uspec_oneday_pass_SubBox').css({"margin-top":"-22px"})
        checkState_1 = true;
    }
})

var checkState_2 = true;
$('.login').click(function(){
    if(checkState_2){
        $('.main_menu').show()
        checkState_2 = false;
    }  else{
        
        $('.main_menu').hide()
        checkState_2 = true;
    }
 })


$('.open').click(function(){
    $('.mypage_Box').toggleClass('V_h')
    $('.uspec_oneday_pass_AllBox').toggleClass('V_h')
    $('#cancel').toggleClass('V_h')
    $('footer').hide()
    $('.open>.Db').hide()
    $('#X>.Dn_1').show()
    $('#mypage_menu').show()
    $('.mypage_Text_Box').css('height','61px')
})



$('#X>.Dn_1').click(function(){
    $('.open>.Db').show()
    $('#X>.Dn_1').hide()
    $('footer').show()
    $('#mypage_menu').hide()
    $('#cancel').removeClass('V_h')
    $('.uspec_oneday_pass_AllBox').removeClass('V_h')
    $('.mypage_Box').toggleClass('V_v')
    $('.mypage_Box').removeClass('V_h')
})



// $('.open').click(function(){
//     $('.mypage_Box').toggleClass('V_h')
//     $('#mypage_menu').toggleClass('Dn')
//     $('.open>.Db').hide();

//     $('#X>.Dn_1').toggleClass('Db_1')
//     $('#X>.Dn_1').removeClass('Dn_1')
// })

// $('#X').click(function(){
//     $('#mypage_menu').toggleClass('Dn')
//     $('#X').hide()
//     $('.open>.Db').show();
    
// })


$('.EDIT_All_Box').click(function(){
    $('.ok_Box_All').toggleClass('V_v')
})








$('.EDIT_All_Box_1').click(function(){
    $('.ok_Box_All').toggleClass('V_v')
})



$('.login').mouseover(function(){
    $('#test_1').css("display","none")
    $('#test_2').css("display","block")
})

$('.login').mouseleave(function(){
    $('#test_1').css("display","block")
    $('#test_2').css("display","none")
})

 $('.mo_Instructors_search').click(function(){
     $('.mo_Instructors_search').css("display","none")
     $('.none').css("display","block")
 })
//  $('.mo_Instructors_searchlog a').click(function(){
//     $('.none').css("display","none")
//     $('.mo_Instructors_search').css("display","block")
//  })




function count(type)  {
    // 결과를 표시할 element
    const resultElement = document.getElementById('result');
    
    // 현재 화면에 표시된 값
    let number = resultElement.innerText;
    
    // 더하기/빼기
    if(type === 'plus') {
      number = parseInt(number) + 1;
    }else if(type === 'minus')  {
      number = parseInt(number) - 1;
    }
    
    // 결과 출력
    resultElement.innerText = number;
  }

})