package store.user;

public class User {

	private String firstName;
	private String lastName;
	private String username;
	private String password;
	private boolean isAdmin;
	
	public User(String fN, String ln, String un, String Ps) {
		this.firstName=fN;
		this.lastName=ln;
		this.username=un;
		this.password=Ps;
	}
	public User(String fN, String ln, String un, String Ps,boolean isAdmin) {
		this.firstName=fN;
		this.lastName=ln;
		this.username=un;
		this.password=Ps;
		this.isAdmin=isAdmin;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
}
