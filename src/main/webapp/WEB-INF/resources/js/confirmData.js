
$(function(){
    $('#gymName').blur(function(){
        $('.showNameText').text($(this).val());
        $('.showName').val($(this).val());
     })

    let cityAddress="";
    let districtAddress="";
    $("#city").on("change",function(){
        cityAddress=$(this).children("option:selected").val();
        $('.showAddressText').text(cityAddress+districtAddress+$("#gymAddressDetail").val());
        $('.showAddress').val(cityAddress+districtAddress+$("#gymAddressDetail").val());
    })
    $("#district").on("change",function(){
        districtAddress=$(this).children("option:selected").val();
        $('.showAddressText').text(cityAddress+districtAddress+$("#gymAddressDetail").val());
        $('.showAddress').val(cityAddress+districtAddress+$("#gymAddressDetail").val());
    })

    $('#gymAddressDetail').blur(function(){
       $('.showAddressText').text(cityAddress+districtAddress+$(this).val());
       $('.showAddress').val(cityAddress+districtAddress+$(this).val());
    })
    
    let number=[];
    let weekdays=[];
    $(".btn-group").children("input").on("click",function(){
        let weekday =$(this).val();
        if(number.indexOf(weekday)==-1){
            number.push(weekday);
        }else{
            number.splice(number.indexOf(weekday),1);
        }
        weekdays=[];
        number.sort().forEach(element => {
            let strOfDays="一二三四五六日";
            weekdays.push("星期"+strOfDays[eval(element-1)]);
        });
        $('#hiddenP').val(weekdays+(openTime!=""&&closeTime!=""?openTime+"-"+closeTime:""));
    })

    let openTime="";
    $(".openTime").on("change",function(){
        openTime=$(this).val();
        $('#hiddenP').val(weekdays+(openTime!=""&&closeTime!=""?openTime+"-"+closeTime:""));
    })

    let closeTime="";
    $(".closeTime").on("change",function(){
        closeTime=$(this).val();
        $('#hiddenP').val(weekdays+(openTime!=""&&closeTime!=""?openTime+"-"+closeTime:""));
    })
    
    $("#morePeriods").on("click",function(){
        if($("#hiddenP").val()!=""){
            $("#finishedAddPeriods").prop("disabled",null);
            $("#hiddenDiv").append($("#hiddenP").val()+"<br>");
            $(".btn-group").children("input:checked").prop("disabled","true");
            number=[];
            $('#hiddenP').val("");
        }
    })

    $("#finishedAddPeriods").on("click",function(){
        $(".showTimesText").text($("#hiddenDiv").text());
        $(".showTimes").val($("#hiddenDiv").text());
    })
    
})