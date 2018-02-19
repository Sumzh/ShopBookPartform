package Pojo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/1/7 0007.
 */
public class Order {


    private Integer OrderBookId;
    private Integer UserId;

    public Integer getOrderBookId() {
        return OrderBookId;
    }

    public void setOrderBookId(Integer orderBookId) {
        OrderBookId = orderBookId;
    }

    public Integer getUserId() {
        return UserId;
    }

    public void setUserId(Integer userId) {
        UserId = userId;
    }

    private List<Book> OrderBookList=new ArrayList<Book>();






    public List<Book> getOrderBookList() {
        return OrderBookList;
    }

    public void setOrderBookList(List<Book> orderBookList) {
        OrderBookList = orderBookList;
    }

    public Order() {

    }
}
