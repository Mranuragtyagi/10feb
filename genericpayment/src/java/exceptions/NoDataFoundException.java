package exceptions;

public class NoDataFoundException extends Exception {
    public NoDataFoundException() {
        super("No Data Found for the query.");
    }

    public NoDataFoundException(String msg) {
        super(msg);
    }
}
