package Test;

import SqlSession.MySqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;

/**
 * Created by Administrator on 2018/1/7 0007.
 */
public class Main {


    public static void  main(String []args){



        ApplicationContext context=new ClassPathXmlApplicationContext("classpath:ApplicationContext.xml");
        MySqlSession mySqlSession= (MySqlSession) context.getBean("mySqlSession");

     /*   HashMap<String,String> userMap=new HashMap<String, String>();

        userMap.put("name","jack");
        userMap.put("password","123456");

        //Integer money, Integer id, String password, String name


        User user=new User(200,null,"123456","jemy");
*/
       // List<User> userList=null;

      //  int excute= 0;
        try {
       //     excute = mySqlSession.getSqlSession().insert("Pojo.User.AddUser",user);

       //     Integer ExistCount=mySqlSession.getSqlSession().selectOne("Pojo.User.VerifyUserExist","1050");

         //   System.out.println(ExistCount);



          //  Integer count=mySqlSession.getSqlSession().selectOne("Pojo.Manager.ValidateManager", manager);
          //  List<User> userList=mySqlSession.getSqlSession().selectList("Pojo.User.ManagerGetUser",0);

         /*   User user=new User();
            user.setPassword("12345");
            user.setName("jack");
            user.setId(1003);
            user.setMoney(500);
            mySqlSession.getSqlSession().update("Pojo.User.updateUserById",user);
*/
           // System.out.println(userList.size());

       //  Order order=(Order)mySqlSession.getSqlSession().selectOne("Pojo.Order.getOrderList", 1001);



            ArrayList<Integer> bookIdlist=new ArrayList<Integer>();
            bookIdlist.add(101);
            bookIdlist.add(102);

            mySqlSession.getSqlSession().update("Pojo.Book.UpdateBookCount",bookIdlist);


        //  System.out.println(order.getOrderBookList().size());



        } catch (Exception e) {

            System.out.println("插入错误");

            e.printStackTrace();
        }










    }
}
