import org.junit.jupiter.api.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatTest {
    @Test
    void stringToDate() {
        String periodStart = "20/02/03";
        SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");

        Date periodDate = null;
        Date today = new Date();
        try {
            periodDate = sdf.parse(periodStart);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        System.out.println(periodDate);
        System.out.println("today.getTime() > periodDate.getTime() = " + (today.getTime() > periodDate.getTime()));

        String periodEnd = "22/03/04";
        Date periodEndDate = null;
        try {
            periodEndDate = sdf.parse(periodEnd);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        System.out.println("today.getTime() > periodEndDate.getTime() = " + (today.getTime() > periodEndDate.getTime()));
    }
}
