package Pojo;

/**
 * Created by Administrator on 2018/1/6 0006.
 */
public class User {

    private Integer Id;
    private String Name;
    private String Password;
    private Integer Money;

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public Integer getMoney() {
        return Money;
    }

    public void setMoney(Integer money) {
        Money = money;
    }

    public User() {

    }
}
