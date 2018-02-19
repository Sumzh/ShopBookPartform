package Controllers;

import Pagging.Pagging;
import Pojo.Book;
import Pojo.Manager;
import Pojo.User;
import Service.ManagerService;
import Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2018/1/4 0004.
 */

@Controller
public class MyController {


    @Autowired
    Pagging pagging;

    @Autowired
    UserService userService;

    @Autowired
    ManagerService managerService;

    //首页处理
    @RequestMapping(value = "/")
    public String FirstPage(HttpServletRequest request,HttpServletResponse response) throws Exception {


        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        List<Book>bookList=pagging.getDataBook(1);

        request.setAttribute("BookList",bookList);

        request.setAttribute("pageCount",1);

        return  "first";
    }


    @RequestMapping(value = "/previous")
    public String Previous(@RequestParam("pageCount") Integer pageCount,HttpServletRequest request){


        return "forward:/PageRequest?pageCount="+pageCount+"";


    }





    @RequestMapping(value = "/next")
    public String next(@RequestParam Integer pageCount,HttpServletRequest request){


        return "forward:/PageRequest?pageCount="+pageCount+"";

    }


    ///PageRequest


    @RequestMapping(value = "/PageRequest")
    public String PageRequest(@RequestParam("pageCount") Integer pageCount,HttpServletRequest request){


        if(pageCount==0){

            return "forward:/";
        }


      //  System.out.print("页面返回的页面参数是:==>"+pageCount);


        List<Book>bookList=pagging.getDataBook(pageCount);

        request.setAttribute("BookList", bookList);

        request.setAttribute("pageCount",pageCount);

        return "first";
    }







    //登录请求
   @RequestMapping(value ="/LoginAction",method = RequestMethod.POST)
    public String LoginRequest(User users,
                               HttpServletRequest request,
                               HttpSession session,
                               HttpServletResponse response,
                               @RequestParam Integer pageCount)
                               throws IOException {


       //先查询session中是否有登录的用户，有直接转跳到原理的页面
       if(session.getAttribute("users")!=null){

           return "forward:/PageRequest?pageCount="+pageCount+"";

       }

       //否则执行查询
        User user1=userService.Login(users);

        if(user1!=null){


            session.setAttribute("users", user1);

            //response.getWriter().print("<script>alert('登录成功！');</script>");

            response.getWriter().write("<script language='javascript'> alert('hello'); </script>;");


            return "forward:/PageRequest?pageCount="+pageCount+"";

        }else {




            PrintWriter out=response.getWriter();


            out.print("<script language='text/javascript'>alert('登录失败！');</script>");

            return "redirect:/";
        }




    }



    //支付页面
    @RequestMapping("/shopCar")
    public String ShopCar(@RequestParam Integer UserId ,HttpServletRequest request){

        //根据UserId获取用户购买的商品！
        if(UserId==null){


            return "redirect:/";
        }
        List<Book> bookList= userService.getOrderByUserId(UserId);

        request.setAttribute("orderlist",bookList);

        return "pay";
    }



    //注册页面
    @RequestMapping(value = "/Register",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public Integer Register(User user ,@RequestParam Integer pageCount,HttpServletRequest request,
                           HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");



        if(userService.Register(user)!=null && userService.Register(user)>0 ){

            return 1;

        }else {

            return 0;
        }



    }


    //管理员页面
    @RequestMapping(value = "/ManagerLoginAction")
    public String Manager(Manager manager ,HttpServletRequest request){

       Integer count= managerService.ValidateManager(manager);



        if(count!=null&&count>=1){


            //默认第一页

            return "manager";

        }else {

            return "forward:/";
        }


    }

    //人员管理
    @RequestMapping(value = "/UserManager")
    public String UserManager(HttpServletRequest request){


        request.setAttribute("UserList", managerService.getUserByPageNumber(1));


        return "UserManager";
    }

    //书本管理
    @RequestMapping(value = "/BookManager")
    public String BookManager(HttpServletRequest request,@RequestParam Integer PageNumber){


        if(PageNumber==null){

            PageNumber=0;

        }else if (PageNumber==1){

            PageNumber=0;

        }else {

            PageNumber=(PageNumber-1)*5;
        }

        List<Book>bookList=managerService.getBookByPageNumber(PageNumber);




        request.setAttribute("BookList",bookList);

        return "/BookManager";

    }




    //翻页获取书本数据
    @RequestMapping(value = "/GetDataByPageNumber" ,method = RequestMethod.GET)
    @ResponseBody
    public List<Book> getBookByPageNumber(@RequestParam Integer PageNumber){

        if(PageNumber==null){

            PageNumber=0;

        }else if (PageNumber==1){

            PageNumber=0;

        }else {

            PageNumber=(PageNumber-1)*5;
        }



        List<Book>bookList=managerService.getBookByPageNumber(PageNumber);



        return  bookList;


    }



    //获取书本根据Id
    @RequestMapping(value = "/GetBookById",method = RequestMethod.GET)
    @ResponseBody
    public Book getBookMessage(@RequestParam String BookId){

     return managerService.getBookById(new Integer(BookId));

    }


    //更新书本
    @RequestMapping(value = "/UpdateBook",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public Integer UpdateBook(Book book){

        Integer count=managerService.UpdateBook(book);
        if(count!=null&&count>0){

            System.out.println("更新书本信息结果:"+count);

            return count;

        }else {

            return 0;
        }

    }

    //根据书本Id删除书本
    @RequestMapping(value = "/DeleteBook",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    @ResponseBody
    public String DeleteBookById(@RequestParam String BookId){

        Integer count=managerService.DeleteBook(new Integer(BookId));
        if(count!=null&&count>=1){


            return "删除信息成功！";
        }else {

            return "删除信息失败！";
        }
    }

    //管理员管理用户信息
    @RequestMapping(value = "/ManagerGetUser",method = RequestMethod.GET)
    @ResponseBody
     public List<User> ManagerGetUser(@RequestParam Integer PageNumber){

         return managerService.getUserByPageNumber(PageNumber);
     }


    @ExceptionHandler(Exception.class)
    public String ErrorPage(Exception exception,HttpServletRequest request){


        request.setAttribute("error",exception);
        return "error";
    }



    //更新用户请求
    @RequestMapping(value = "/UpdateUser",method = RequestMethod.POST)
    @ResponseBody
    public Integer UpdateUser(User user,HttpServletRequest request,HttpServletResponse response)throws Exception{


        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        Integer count=userService.UpdateUser(user);
        if(count!=null&&count>0){

            return count;
        }
        return null;
    }

    //删除用户 Ajax请求
    @RequestMapping(value = "/RemoveUser")
    @ResponseBody
    public Integer DeleteUser(@RequestParam Integer UserId){

        return userService.DeleteUser(UserId);
    }



    //根据用户Id获取用户信息
    @RequestMapping(value = "/GetUserById")
    @ResponseBody
    public User GetUserById(@RequestParam String UserId){
        return userService.getUserById(new Integer(UserId));

    }


    //购物车请求
    @RequestMapping(value = "/Buy/{bookId}")
    public String BuyBooks(@PathVariable("bookId") String bookId,HttpSession session){

        Object userSession=session.getAttribute("users");
        if(userSession==null){
            System.out.println("用户不存在！！请登录");
            return "redirect:/";
        }

        User user=(User)session.getAttribute("users");
        HashMap<Object,Object> bookMap=new HashMap<Object, Object>();
        bookMap.put("bookId",new Integer(bookId));
        bookMap.put("userId",user.getId());
        userService.BuyBook(bookMap);

        //
        return "redirect:/";
    }




    @RequestMapping(value = "/Pay",method = RequestMethod.POST)
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public Integer Pay(@RequestParam Integer[] datas,HttpSession session) {


        System.out.println("前台返回的数据是:" + datas.length);
       try {
        /*更新用户的余额的函数*/
           User user = (User) session.getAttribute("users");
           Integer userId = user.getId();
           HashMap<Object, Object> paramMap = new HashMap<Object, Object>();
           paramMap.put("id", userId);
           paramMap.put("userMoney", datas[datas.length - 1]);

           userService.UpdateUserAccount(paramMap);
        /*结束*/



        /*批量书本更新数量*/
           ArrayList<Integer> bookIdList = new ArrayList<Integer>();
           if (datas.length == 2) {
               bookIdList.add(datas[0]);
           } else {

               for (int i = 0; i < datas.length - 2; i++) {
                   bookIdList.add(datas[i]);
               }
           }

           int pays = userService.Pay(bookIdList);
        /*结束批量书本更新数量*/


           //删除订单
           HashMap<Object, Object> paramMaps = new HashMap<Object, Object>();

           //如果用户只买一本书，执行下面的语句，否则批量执行删除订单操作
           if (datas.length == 2) {
               paramMaps.put("bookId", datas[0]);
               paramMaps.put("userId", userId);
               userService.deleteOrderByUserIdAndOrderId(paramMaps);

           } else {

               for (int i = 0; i < datas.length - 2; i++) {
                   paramMaps.put("bookId", datas[i]);
                   paramMaps.put("userId", userId);
                   userService.deleteOrderByUserIdAndOrderId(paramMaps);
                   paramMaps.clear();
               }
           }
       }catch (Exception e){

          System.out.println(e);


           return 0;

       }

           /*结束*/

     return 1;
    }

   /* //测试responsebody返回String

    @RequestMapping(value = "/TestResponseBody",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String TestResponsebody(HttpServletRequest request,HttpServletResponse response)throws  Exception{
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        return "测试成功";
    }*/



    @RequestMapping("/TestRequest")
    public  String TestRequest(HttpServletRequest request,HttpServletResponse response)throws  Exception{

        response.setHeader("content-type","text/html;charset=utf-8");
        PrintWriter out=response.getWriter();

        out.write("<script type='text/javascript'>alert('response返回的信息')</script>");
        out.write("response write方法返回的信息</br>");
        out.print("response print方法返回的信息");
        //request.getRequestDispatcher("/text.jsp").forward(request,response);

        return "test";
    }


}
