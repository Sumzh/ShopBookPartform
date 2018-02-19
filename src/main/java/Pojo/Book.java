package Pojo;

/**
 * Created by Administrator on 2018/1/6 0006.
 */
public class Book {


    private Integer BookId;
    private String BookName;
    private Integer Account;
    private Integer BookPrice;

    public Book(Integer bookId, Integer account, Integer bookPrice) {
        BookId = bookId;

        Account = account;
        BookPrice = bookPrice;
    }

    public Integer getBookId() {
        return BookId;
    }

    public void setBookId(Integer bookId) {
        BookId = bookId;
    }

    public Integer getBookPrice() {
        return BookPrice;
    }

    public void setBookPrice(Integer bookPrice) {
        BookPrice = bookPrice;
    }

    public String getBookName() {
        return BookName;
    }

    public void setBookName(String bookName) {
        BookName = bookName;
    }

    public Integer getAccount() {
        return Account;
    }

    public void setAccount(Integer account) {
        Account = account;
    }

    public Book() {

    }
}
