package exceptions;

public class DeleteNotAllowedException extends Exception {
    public DeleteNotAllowedException() {
        super("Delete operation cannot be performed on the requested resource.");
    }

    public DeleteNotAllowedException(String msg) {
        super(msg);
    }
}
