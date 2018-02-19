package InterfaceImp;

import Interface.ManagerInterface;
import Pojo.Book;
import Pojo.Manager;
import Pojo.User;
import SqlSession.MySqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/1/13 0013.
 */
@Repository
public class ManagerInterfaceImp implements ManagerInterface {



    @Autowired
    MySqlSession mySqlSession;

    @Override
    public Integer ValidateManager(Manager manager) {

        Integer count=mySqlSession.getSqlSession().selectOne("Pojo.Manager.ValidateManager", manager);


        if(count!=null){


            return count;
        }else {
            return null;

        }
    }


    @Override
    public List<User> getUserByPageNumber(Integer PageNumber){

        if(PageNumber==1){

            PageNumber=0;
        }else {

            PageNumber=(PageNumber-1)*5;

        }

        List<User> userList=mySqlSession.getSqlSession().selectList("Pojo.User.ManagerGetUser",PageNumber);



        if(userList!=null&&userList.size()>0){

            return userList;

        }


        return  null;
    }

    //书本管理

    @Override
    public List<Book> getBookByPageNumber(Integer PageNumber){

        List<Book> userList=mySqlSession.getSqlSession().selectList("Pojo.Book.getMessageManager",PageNumber);

        if(userList!=null&&userList.size()>0){

            return userList;

        }
        return  null;

    }



    public Book getBookById(Integer BookId){

        Book book=mySqlSession.getSqlSession().selectOne("Pojo.Book.getBookMessageById",BookId);

        if (book!=null){


            return book;

        }else{

            return null;
        }



    };

    @Override
    public Integer UpdateBook(Book book) {


        Integer count= mySqlSession.getSqlSession().update("Pojo.Book.updateBook",book);

        return count;


    }

    @Override
    public Integer DeleteBook(Integer BookId) {



        Integer count= mySqlSession.getSqlSession().update("Pojo.Book.deleteBookById",BookId);

        return count;


    }
}
