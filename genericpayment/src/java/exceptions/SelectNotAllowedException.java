package exceptions;

public class SelectNotAllowedException extends Exception {
    public SelectNotAllowedException() {
        super("Select operation cannot be performed on the requested resource.");
    }

    public SelectNotAllowedException(String msg) {
        super(msg);
    }
}
