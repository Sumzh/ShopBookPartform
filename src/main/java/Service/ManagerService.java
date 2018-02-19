package Service;

import InterfaceImp.ManagerInterfaceImp;
import Pojo.Book;
import Pojo.Manager;
import Pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/1/13 0013.
 */

@Service
public class ManagerService {

    @Resource
    ManagerInterfaceImp managerInterfaceImp;

    //验证是否这个用户存在
    public Integer ValidateManager(Manager manager) {

        if(managerInterfaceImp.ValidateManager(manager)!=null){


            return managerInterfaceImp.ValidateManager(manager);
        }else {

            return null;
        }
    }


    //管理员管理用户，随着分页显示用户
    public List<User> getUserByPageNumber(Integer PageNumber){

        return managerInterfaceImp.getUserByPageNumber(PageNumber);
    }



    //分页获取书本信息
    public List<Book> getBookByPageNumber(Integer PageNumber){

        return  managerInterfaceImp.getBookByPageNumber(PageNumber);
    }


    //根据书本Id获取书本
    public Book getBookById(Integer BookId){

        return managerInterfaceImp.getBookById(BookId);
    }


    //更新书本信息
    public Integer UpdateBook(Book book) {

        return managerInterfaceImp.UpdateBook(book);

    }
    //删除书本根据Id
    public Integer DeleteBook(Integer BookId) {

        return  managerInterfaceImp.DeleteBook(BookId);

    }
}
