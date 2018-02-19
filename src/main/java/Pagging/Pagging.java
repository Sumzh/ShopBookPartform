package Pagging;

import Pojo.Book;
import SqlSession.MySqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/1/7 0007.
 */

@Component
public class Pagging {


    @Autowired
    MySqlSession mySqlSession;


     public  Integer DataAcount;
     public  Integer PageSize;
     public List<Book> DataBook=new ArrayList<Book>();

     public Pagging(){



     }


    public List<Book> getDataBook(Integer pageSizes){


        //初始化一共有多少条数据

        if(DataBook.size()==0){

            DataBook=mySqlSession.getSqlSession().selectList("Pojo.Book.getMessagePagging");

        }

        List<Book> temporaryBookData=null;
        temporaryBookData = new ArrayList<Book>();

        for(int i=0;i<(pageSizes*9);i++){



        if(pageSizes==1){

                temporaryBookData.add(DataBook.get(i));

         }else {

                for(int i2=((pageSizes*9)-1)-9;i2<(pageSizes*9)-1;i2++){


                    temporaryBookData.add(DataBook.get(i2));
                }


            }
        }

        return temporaryBookData;
    }



}
