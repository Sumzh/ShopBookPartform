function CheckChoose(obj){


    //清空原来的价格框

    //选中多少个商品
    $("#ChooseNumber").attr("value",$("input[type='checkbox']:checked").length);

    var price=0;

    $.each($("input[type='checkbox']:checked"),function(){

        var prices=$(this).attr("price");


        price=price+parseInt(prices);

       // alert("选择的值有:"+$(this).attr("id"));






    });

    $("#TotalPrice").attr("value",price);
     price=0;
}


function UserPay(){


    if(confirm("确定要付款吗？")){

        var len=$("input[type='checkbox']:checked").length;

        var datas=new Array();

        var began=0;
        $.each($("input[type='checkbox']:checked"),function(){

            datas[began]=parseInt($(this).attr("id"));

            began++;

        });
        datas.push(parseInt($("#TotalPrice").attr("value")));



        //支付ajax请求
        $.ajax({url:"/Pay",type:"post",traditional: true,data:{"datas":datas},success:function(result){

            alert("付款成功！");

            window.location.href;

        }})
/*
        $.post("/Pay",$(datas).serializeArray(),function(result){



            alert(result);

        })*/



    }

}