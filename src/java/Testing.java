
import java.util.Random;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.text.ParseException;

public class Testing {

    public static void main(String[] args) {

        //generateOrderlist();
        //generateDate();
        //generateCoupon();
        generateReloadList();

    }

    private static void generateOrderlist() {

        int x = 1;
        for (int i = 1; i < 241; i++) {
            for (int j = 1; j < 7; j++) {
                Random rand = new Random();
                int counter = rand.nextInt((30 - 1) + 1) + 1;
                int price = rand.nextInt((9 - 4) + 1) + 4;

                System.out.println("INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) VALUES (" + counter + ", " + i + ", 1, " + price + ", " + x + ");");
                x++;
                if (j == 6) {
                    System.out.println("\n");
                }
            }
        }
    }

    private static void generateDate() {
        String oldDate = "2018-04-20";
        String newDate = "";
        System.out.println(oldDate);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        int dayOfWeek = 0;

        for (int i = 0; i < 360; i++) {

            try {
                c.setTime(sdf.parse(oldDate));  //setTime
                dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
                //System.out.println(dayOfWeek);

            } catch (ParseException e) {
                e.printStackTrace();
            }

            //Incrementing the date by 1 day
            c.add(Calendar.DAY_OF_MONTH, 1);
            newDate = sdf.format(c.getTime());

            if (dayOfWeek != 7) {
                System.out.println(newDate);
            } else {
                System.out.println("\n");
            }

            //Incrementing the date by 1 day
            c.add(Calendar.DAY_OF_MONTH, 1);
            oldDate = newDate; // Continue Next Loop
        }
    }

    private static void generateCoupon() {

        for (int i = 1; i < 21; i++) {
            for (int k = 1; k < 13; k++) {
                for (int j = 1; j < 7; j++) {
                    System.out.println("INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, \"STATUS\") VALUES ('', 'Lunch', 'Redeemed');");
                    if (j == 6) {
                        System.out.println("\n");
                    }
                }
                if (k == 12) {
                    System.out.println("------------------------------------------------" + i + "-----------------------------------------------------\n");
                }
            }
        }
    }

    private static void generateReloadList() {

        for (int i = 1; i < 21; i++) {
            for (int j = 1; j < 13; j++) {
                
                int amountArr[] = { 5 , 10 , 15, 30, 50, 100, 500};
                Random rand = new Random();
                int amount = rand.nextInt((6 - 0) + 1) + 0;
                int custID = rand.nextInt((20 - 1) + 1) + 1;
                int staffID = rand.nextInt((5 - 1) + 1) + 1;

                System.out.println("INSERT INTO NBUSER.RELOAD (\"DATE\", \"TIME\", AMOUNT, CUST_ID, STAFF_ID) VALUES ('2019-03-21', '20:55:11', " + amountArr[amount] + ", " + custID + ", "+ staffID + ");");

                if (j == 12) {
                    System.out.println("------------------------------------------------" + i + "-----------------------------------------------------\n");
                }
            }
        }
    }

}
