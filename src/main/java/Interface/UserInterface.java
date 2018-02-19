package Interface;

import Pojo.Book;
import Pojo.User;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2018/1/7 0007.
 */
public interface UserInterface {



     //登录
    public User Login(User user);

    //注册

    public Integer Register(User user);

    //验证是否存在
    public Integer VerifyUserExist(String userId);

    //根据用户的Id获取购买的商品
    public List<Book> QueryBookOrderById(Integer UserId);


    //用户信息更新

    public Integer UpdateUser(User user );

    //删除用户

    public Integer DeleteUser(Integer UserId);


    //根据用户Id获取用户信息

    public User getUserById(Integer UserId);


    //<!--根据用户Id获取订单消息-->
    public List<Book> getOrderByUserId(Integer userId);


   //用户买书
    public Integer BuyBook(HashMap<Object,Object> bookMap);


    //支付函数
    public int Pay(List<Integer> booklist);


    //更新用户余额
    public void UpdateUserAccount(HashMap<Object,Object> userMap);

    //删除订单
  /*  <!--删除购物车-->
    <delete id="deleteOrderByUserIdAndOrderId" parameterType="java.util.Map">*/

    public int deleteOrderByUserIdAndOrderId(HashMap<Object,Object> paramMap);


}
