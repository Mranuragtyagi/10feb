package exceptions;

public class InsertNotAllowedException extends Exception {
    public InsertNotAllowedException() {
        super("Insert operation cannot be performed on the requested resource.");
    }

    public InsertNotAllowedException(String msg) {
        super(msg);
    }
}
