package exceptions;

public class DataAlreadyExistsException extends Exception {
    public DataAlreadyExistsException() {
        super("The Entry already exists in the table.");
    }

    public DataAlreadyExistsException(String msg) {
        super(msg);
    }
}
