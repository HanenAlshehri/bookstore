package store.user;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.Part;
import java.util.stream.Collectors;
public class Data {

	public static ArrayList<User> users = new ArrayList<User>(
            Arrays.asList(new User("admin","admin","admin","admin",true)));
	public static ArrayList<Book> books = new ArrayList<Book>();
	public static ArrayList<CheckOut> orders = new ArrayList<CheckOut>();
   
	public static User Mainuser; 
	public static boolean IsUserExist(String username) {
		return users.stream().anyMatch(p -> p.getUsername().equals(username));

	}
	public static boolean AddUser(User user) {
		setMainUser(user);
		return users.add(user);

	}
	public static void setMainUser(User user) {
		Mainuser=user;
	}
	public static User getMainUser() {
	return	Mainuser;
	}
	
	public static boolean Login(String username, String password) {
 
	 User user = users.stream().filter(carnet -> username.equals(carnet.getUsername())).findFirst().orElse(null);
	 if (user.getPassword().equals(password)) {
		 Mainuser=user;
		 return true;
	 }
	 else {
		 return false;
	 }
	}
	 public static void logOut() {
		 
		 Mainuser=null;
 
	}
	public static boolean AddBook(Book book) {
		 
		return books.add(book);

	}
	public static boolean updateBook(String title,Book book) {
		deleteBook(title);
		AddBook(book);
	 
return true;
	}
	
	public  static String getSubmittedFileName(Part part) {
	    for (String cd : part.getHeader("content-disposition").split(";")) {
	        if (cd.trim().startsWith("filename")) {
	            String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	            return fileName;//.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
	        }
	    }
	    return null;
	}
	
	public static boolean deleteBook(String title) {
		return books.removeIf(obj -> obj.getTitle().equals(title));
	}
	public static Book getBook(String title) {
		return books.stream().filter(carnet -> title.equals(carnet.getTitle())).findFirst().orElse(null);
	}
	public static ArrayList<Book> getFilter(double from, double to){
	return	Data.books.stream().filter(b -> b.getPrice() >= from && b.getPrice() <=to).collect(Collectors.toCollection(ArrayList<Book>::new)); 
	}
	
	public static boolean makeOrder(CheckOut order) {
		return orders.add(order);
	}
	public static boolean deleteOrder(int ordercode) {
		return orders.removeIf(obj -> obj.getOrderCode()==ordercode);
	}
	public static CheckOut getOrder(int ordercode) {
		return orders.stream().filter(carnet -> ordercode== carnet.getOrderCode()).findFirst().orElse(null);
	}
}
