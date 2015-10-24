package exceptions;

public class UnknownException extends Exception {
    public UnknownException() {
        super("An Unknown Error has occurred. Please try after some time.");
    }

    public UnknownException(String msg) {
        super(msg);
    }
}
