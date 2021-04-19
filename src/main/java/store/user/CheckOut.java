package store.user;

import java.text.SimpleDateFormat;
import  java.util.Date;

public class CheckOut {
	public static int OrderID = 0;
	
	private int OrderCode;
	private String firstName;
	private String lastName;
	private String Address;
	private String Phone;
	private String Email;
	private String bookName;
	private String cardNumber;
	private double Price;
	private Date date;
	public CheckOut(String cN,String fN, String ln, String Ad, String Ph, String em, String bN,double pr,Date dt) {
		OrderID+=1;
		this.OrderCode=OrderID;
		this.cardNumber=cN;
		this.firstName=fN;
		this.lastName=ln;
		this.Address=Ad;
		this.Phone=Ph;
		this.Email=em;
		this.bookName=bN;
		this.Price=pr;
		this.date=dt;
	}
 
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String Address) {
		this.Address = Address;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String Phone) {
		this.Phone = Phone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String Email) {
		this.Email = Email;
	}
	public String getbookName() {
		return bookName;
	}
	public void setbookName(String bookName) {
		this.bookName = bookName;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double Price) {
		this.Price = Price;
	}
	public String getDate() {
	 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss");
		return formatter.format(date);
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getOrderCode() {
		return OrderCode;
	}
	public String getcardNumber() {
		return cardNumber;
	}
	public void setcardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
}
