import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class createOrderNo {

	public static void main(String[] args) {
		
		DateFormat format = new SimpleDateFormat("yyMMdd");
		Date now = new Date();
		
		format.format(now);
		
		System.out.println(format.format(now));
		
		String orderNoUUID = UUID.randomUUID().toString().substring(0,7);
		System.out.println(orderNoUUID);
		

	}

}
