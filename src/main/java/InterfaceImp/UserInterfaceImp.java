package InterfaceImp;

import Interface.UserInterface;
import Pojo.Book;
import Pojo.Order;
import Pojo.User;
import SqlSession.MySqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2018/1/8 0008.
 */
@Repository
public class UserInterfaceImp implements UserInterface {


    @Autowired
    MySqlSession mySqlSession;

    @Override
    public User Login(User user) {


        HashMap<String,String> userMap=new HashMap<String, String>();

        userMap.put("Id",user.getId().toString());
        userMap.put("password",user.getPassword());

        List<User> userList=mySqlSession.getSqlSession().selectList("Pojo.User.getUserMessage", userMap);

        if(userList!=null){

            return  userList.get(0);

        }else{

            return null;
        }

    }



    //注册
    @Override
    public Integer Register(User user) {

        if (VerifyUserExist(user.getId().toString()) != null && VerifyUserExist(user.getId().toString()) == 0) {


            //执行注册
            return (Integer) mySqlSession.getSqlSession().insert("Pojo.User.AddUser", user);


        }

           return  null;
    };


    //验证是否存在
    @Override
    public Integer VerifyUserExist(String  userId){

       return(Integer)mySqlSession.getSqlSession().selectOne("Pojo.User.VerifyUserExist", userId);

    };


    //根据用户Id查询购买的商品
    @Override
    public List<Book> QueryBookOrderById(Integer UserId){


        return  null;
    };


    //用户信息更新
    @Override
    public Integer UpdateUser(User user ){


        Integer count=mySqlSession.getSqlSession().update("Pojo.User.updateUserById",user);
        if(count!=null&&count>0){


            return count;
        }else {

            return null;
        }
    }



    //删除用户
    @Override
    public Integer DeleteUser(Integer UserId){

        Integer count=mySqlSession.getSqlSession().update("Pojo.User.deleteUser",UserId);
        if(count>=1){

            return count;
        }

        return  null;
    };



    @Override
    public User getUserById(Integer UserId){

        User users=mySqlSession.getSqlSession().selectOne("Pojo.User.getUserById",UserId);

        if(users!=null){

            return users;

        }
        return null;
    }

    //买书操作
    @Override
    public Integer BuyBook(HashMap<Object,Object> bookMap) {

       int count= mySqlSession.getSqlSession().insert("Pojo.Order.InserOrder",bookMap);

        if(count>0){
            return new Integer(count);
        }
        return null;
    }

    /*支付函数*/
    @Override
    public int Pay(List<Integer> booklist) {
        String sql="Pojo.Book.UpdateBookCount";

        String sql2="Pojo.Book.UpdateBookCount2";

        if(booklist.size()==1){
          return  mySqlSession.getSqlSession().update("Pojo.Book.UpdateBookCount2",booklist.get(0));
        }else {
          return   mySqlSession.getSqlSession().update("Pojo.Book.UpdateBookCount", booklist);
        }
    }

    /*更新用户余额函数*/
    public void UpdateUserAccount(HashMap<Object,Object> userMap){

        mySqlSession.getSqlSession().update("Pojo.User.UpdateUserCount",userMap);
    }

    //删除订单
    public int deleteOrderByUserIdAndOrderId(HashMap<Object,Object> paramMap){

        return  mySqlSession.getSqlSession().update("Pojo.Order.deleteOrderByUserIdAndOrderId",paramMap);

    }

    /*获取用户的订单信息*/
    public List<Book> getOrderByUserId(Integer userId){

      Order order =(Order)mySqlSession.getSqlSession().selectOne("Pojo.Order.getOrderList",userId);
      List bookList=order.getOrderBookList();
       if(bookList!=null&&bookList.size()>0){
           return bookList;
       }
        return null;
    }
}
