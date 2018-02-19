package SqlSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2018/1/7 0007.
 */

@Component
public class MySqlSession {

    public static SqlSession sqlSession;

    @Autowired
    SqlSessionFactory sqlSessionFactory;

    public MySqlSession(){

    }

    public SqlSession getSqlSession(){

        sqlSession= sqlSessionFactory.openSession();

        return sqlSession;
    }

}
