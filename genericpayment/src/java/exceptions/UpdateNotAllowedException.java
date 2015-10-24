package exceptions;

public class UpdateNotAllowedException extends Exception {
    public UpdateNotAllowedException() {
        super("Update operation cannot be performed on the requested resource.");
    }

    public UpdateNotAllowedException(String msg) {
        super(msg);
    }
}
