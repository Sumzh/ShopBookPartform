function showData2(data){


    var jsondata=[  {"name":"jenny","age":"18","sex":"female"},
                    {"name":"jenny","age":"18","sex":"female"},
                    {"name":"jenny","age":"18","sex":"female"},
                    {"name":"jenny","age":"18","sex":"female"},
                     {"name":"jenny","age":"18","sex":"female"}
                  ]

    var json={"name":"aa","Age":"18","sex":"female"}

    var array=[1,2,3,4,5]

/*
    if(data==1){



        $("#mytable").append("<tr><td>"+jsondata[i].name+"</td></tr>" +
        "<td></td>")
        for(var i in jsondata){

            console.log(jsondata[i].name+"=="+jsondata[i].age);

            if(i==3){

                     break;

                    }
        }


    }*/

    if(data==1){

        for(var i in jsondata){

/*
*
* <a onclick='Test(this)' href='javascript:void(0);' id='update?userId="+jsondata[i]+"'">修改</a>
* */

            $("#mytable tbody").append("<tr>" +
            "<td>"+jsondata[i].name+"</td>" +
            "<td>"+jsondata[i].age+"</td>" +
            "<td>"+jsondata[i].sex+"</td>" +
            "<td><button id='btn_add' " +
            "type='button'class='btn btn-info'>" +
            "<span class='glyphicon glyphicon-pencil' " +
            "aria-hidden='true' hidden="+jsondata[i].name+"></span></button></td>" +
            "<td><button id='btn_add' type='button'class='btn btn-info' onclick='Test(delete?userId="+jsondata[i].name.toString()+")'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>删除</button></td>"+
            "</tr>");



            console.log(jsondata[i].name+"=="+jsondata[i].age);

            if(i==2){

                break;

            }
        }


    }




}