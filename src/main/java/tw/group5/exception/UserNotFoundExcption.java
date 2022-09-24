package tw.group5.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class UserNotFoundExcption extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	
	public UserNotFoundExcption() {	
	}

	public UserNotFoundExcption(String message) {
		super(message);
		
	}

	
}
