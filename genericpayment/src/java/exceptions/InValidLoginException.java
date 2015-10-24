package exceptions;

public class InValidLoginException extends Exception {
    public InValidLoginException() {
        super("Either the Username or the Password is Invalid");
    }

    public InValidLoginException(String msg) {
        super(msg);
    }
}
