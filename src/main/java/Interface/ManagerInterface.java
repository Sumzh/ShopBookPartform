package Interface;

import Pojo.Book;
import Pojo.Manager;
import Pojo.User;

import java.util.List;

/**
 * Created by Administrator on 2018/1/7 0007.
 */
public interface  ManagerInterface {


    //验证管理员
    public Integer ValidateManager(Manager manager);

    //管理员更新书本
    public Integer UpdateBook(Book book);


    //管理员删除书本
    public Integer DeleteBook(Integer BookId);


    public List<User> getUserByPageNumber(Integer PageNumber);

    //管理书本,翻页获取书本
    public List<Book> getBookByPageNumber(Integer PageNumber);

    public Book getBookById(Integer  BookId);




}
