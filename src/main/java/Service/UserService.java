package Service;

import InterfaceImp.UserInterfaceImp;
import Pojo.Book;
import Pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2018/1/8 0008.
 */
@Service
public class UserService {



    @Autowired
    UserInterfaceImp userInterfaceImp;

    public User Login(User user) {

       User user1= userInterfaceImp.Login(user);

        return  user1;
    }


    public Integer Register(User user) throws Exception {

        return userInterfaceImp.Register(user);

    }
    //更新用户
    public Integer UpdateUser(User user ){

        return  userInterfaceImp.UpdateUser(user);
    }

    //删除用户
    public Integer DeleteUser(Integer UserId){

        return userInterfaceImp.DeleteUser(UserId);
    }

    //根据用户Id查询用户信息

    public User getUserById(Integer UserId){

        return userInterfaceImp.getUserById(UserId);

    }

    //下订单操作
    public Integer  BuyBook(HashMap<Object,Object> bookMap){

        return  userInterfaceImp.BuyBook(bookMap);

    }

    //查询订单
    public List<Book> getOrderByUserId(Integer userId){
        return  userInterfaceImp.getOrderByUserId(userId);
    }


    //支付订单
    public int Pay(List<Integer> booklist) {

       return  userInterfaceImp.Pay(booklist);
    }

    /*更新用户余额函数*/
    public void UpdateUserAccount(HashMap<Object,Object> userMap) {


        userInterfaceImp.UpdateUserAccount(userMap);
    }

    //删除订单
    public int deleteOrderByUserIdAndOrderId(HashMap<Object,Object> paramMap){

        return userInterfaceImp.deleteOrderByUserIdAndOrderId(paramMap);
    }

    }
