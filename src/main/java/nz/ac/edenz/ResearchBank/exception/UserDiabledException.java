
package nz.ac.edenz.ResearchBank.exception;


public class UserDiabledException extends Exception{

    public UserDiabledException() {
    }

    public UserDiabledException(String errorDesc) {
        super(errorDesc);
    }
    
    
}
