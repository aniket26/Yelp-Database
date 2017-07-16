/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package populate;

import java.io.*;
import static java.lang.Math.toIntExact;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author Aniiket
 */
public class Populate {

    /**
     * @param args the command line arguments
     */
    private static final String host = "localhost";
    private static final String dbName = "YelpDbJson";
    private static int port = 1521;
    private static final String oracle_URL = "jdbc:oracle:thin:@" + host + ":"
            + port + ":" + dbName;
    private static final String user_name = "SYSTEM";
    private static final String password = "tiger";
    static Connection connection = null;
//    public static final String file_business = "C:\\MS\\Semester 3\\"
//            + "DBA\\Assignment\\3\\YelpDataset\\YelpDataset-CptS451\\yelp_"
//            + "business.json";
//    public static final String file_user = "C:\\MS\\Semester 3\\"
//            + "DBA\\Assignment\\3\\YelpDataset\\YelpDataset-CptS451\\yelp_user"
//            + ".json";
//    public static final String file_checkin = "C:\\MS\\Semester 3\\"
//            + "DBA\\Assignment\\3\\YelpDataset\\YelpDataset-CptS451\\yelp_"
//            + "checkin.json";
//    public static final String file_review = "C:\\MS\\Semester 3\\"
//            + "DBA\\Assignment\\3\\YelpDataset\\YelpDataset-CptS451\\yelp_"
//            + "review.json
    public static String file_business = "";
    public static String file_user = "";
    public static String file_checkin = "";
    public static String file_review = "";

    public static void main(String[] args) throws SQLException,
            ParseException {
        if (args.length >= 4) {
            file_business = args[0];
            file_review = args[1];
            file_checkin = args[2];
            file_user = args[3];

        }
        // TODO code application logic here
        Scanner sc = new Scanner(System.in);
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnfe) {
            System.out.println("Classes not found: " + cnfe);
        }
        try {
            connection = DriverManager.getConnection(oracle_URL, user_name,
                    password);
        } catch (SQLException sqle) {
            System.out.println("Connection error! Please check the username "
                    + "or password or the oracle URL that is passed" + sqle);
        }
        Statement statement;
        Boolean goAhead = check(connection);
        if (goAhead) {
            try {
                statement = connection.createStatement();
//                businessTable(connection);
//                check_in_informationTable(connection);
                yelp_userTable(connection);
                reviewTable(connection);
                friends_of_userTable(connection);
                business_sub_categoryTable(connection);
                business_Table(connection);
                connection.close();
            } catch (IOException | SQLException e) {
                System.out.println("Check functions working with the database "
                        + e);
            }
        } else {
            System.out.println("Debug your connection variable to check for "
                    + "the error!");
        }
    }

    public static Boolean check(Connection C) {
        if (C != null) {
            return true;
        } else {
            return false;
        }
    }

    public static void check_in_informationTable(Connection connection)
            throws SQLException, IOException, ParseException, FileNotFoundException {
        PreparedStatement preparedStatement = null;
        try {
            BufferedReader br = new BufferedReader(new FileReader(
                    file_checkin));
            String line = null;
            String listItem;
            String[] tokens;
            long from_hour, day, checkin_count;
            int from_hour2, checkin_count2, day2;
            while (true) {
                preparedStatement = connection.prepareStatement("Insert "
                        + "into check_in_information values(?,?,?,?)");
                JSONObject jsonObject = (JSONObject) new JSONParser().
                        parse(br.readLine());
                String business_id = (String) jsonObject.get("business_id");

                preparedStatement.setString(1, business_id);
                JSONObject check_in = (JSONObject) jsonObject.
                        get("checkin_info");
                Set<String> set = check_in.keySet();
                ArrayList<String> list = new ArrayList<String>(set);
                for (int i = 0; i < list.size(); i++) {

                    listItem = list.get(i);
                    tokens = listItem.split("-");
                    from_hour = Long.valueOf(tokens[0]);
                    from_hour2 = toIntExact(from_hour);

                    day = Long.valueOf(tokens[1]);
                    day2 = toIntExact(day);

                    checkin_count = (long) check_in.get(listItem);
                    checkin_count2 = toIntExact(checkin_count);

                    preparedStatement.setInt(2, day2);
                    preparedStatement.setInt(3, from_hour2);
                    preparedStatement.setInt(4, checkin_count2);
                    preparedStatement.executeUpdate();

//                                System.out.println(business_id+"+"+from_hour);
                }
                preparedStatement.close();

//                preparedStatement.setString(1, business_id);
//                
//                preparedStatement.executeUpdate();
//                preparedStatement.close();
            }
        } catch (NullPointerException ex) {
           System.out.println("Check in Information inserted");
        }
    }

    /*jsonParser   = new JSONParser();
		JSONObject jsonObject   = (JSONObject) jsonParser.parse(line);
		JSONObject structure = (JSONObject) jsonObject.get("checkin_info");
		Set<String> set = structure.keySet();
		ArrayList<String> list  = new ArrayList<String>(set);
		PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO CHECK_IN VALUES(?,?,?,?)");
		String business_id = (String) jsonObject.get("business_id");
		preparedStatement.setString(1, business_id);
		
		for(int i = 0 ; i < list.size() ; i++){
				String listItem = list.get(i);
				String[] tokens = listItem.split("-"); 
				long from_hour = Long.valueOf(tokens[0]);
				int from_hour2=toIntExact(from_hour);
				
				long day=Long.valueOf(tokens[1]);
				int day2=toIntExact(day);
				
				long checkin_count = (long)structure.get(listItem);
				int checkin_count2=toIntExact(checkin_count);
				
				preparedStatement.setInt(2, day2);
				preparedStatement.setInt(3, from_hour2);
				preparedStatement.setInt(4, checkin_count2);
				preparedStatement.executeUpdate();
				
		}
		preparedStatement.close();*/

    public static void businessTable(Connection connection)
            throws SQLException, IOException, ParseException {
        PreparedStatement preparedStatement = null;
        try {
            BufferedReader br = new BufferedReader(new FileReader(file_business));
            while (true) {
                preparedStatement = connection.prepareStatement("Insert into "
                        + "business  values (?,?,?,?,?,?,?,?,?,?,?)");
                JSONObject jsonObject = (JSONObject) new JSONParser().parse(br.
                        readLine());

                String business_id = (String) jsonObject.get("business_id");
                String business_name = (String) jsonObject.get("name");
                String business_type = (String) jsonObject.get("type");

                Double no_of_stars = (Double) jsonObject.get("stars");
                Long review_count = (Long) jsonObject.get("review_count");
                Boolean business_open = (Boolean) jsonObject.get("open");

                String address = (String) jsonObject.get("full_address");
                Double latitude = (Double) jsonObject.get("latitude");
                Double longitude = (Double) jsonObject.get("longitude");

                String city = (String) jsonObject.get("city");
                String state = (String) jsonObject.get("state");

                preparedStatement.setString(1, business_id);
                preparedStatement.setString(2, business_name);
                preparedStatement.setString(3, business_type);

                preparedStatement.setDouble(4, no_of_stars);
                preparedStatement.setDouble(5, review_count);
                preparedStatement.setBoolean(6, business_open);

                preparedStatement.setString(7, address);
                preparedStatement.setDouble(8, latitude);
                preparedStatement.setDouble(9, longitude);

                preparedStatement.setString(10, city);
                preparedStatement.setString(11, state);

                preparedStatement.executeUpdate();
                preparedStatement.close();
            }
        } catch (NullPointerException e) {
            System.out.println("Business Table inserted!");
        }
    }

    public static void yelp_userTable(Connection connection)
            throws ParseException, FileNotFoundException, IOException,
            SQLException {
        PreparedStatement preparedStatement = null;
        try {
            BufferedReader br = new BufferedReader(new FileReader(file_user));
            while (true) {
                preparedStatement = connection.prepareStatement("Insert into "
                        + "yelp_user values (?,?,?,?,?,?,?,?,?,?,?)");
                JSONObject jsonObject = (JSONObject) new JSONParser().parse(br.
                        readLine());

                String user_id = (String) jsonObject.get("user_id");
                String user_name = (String) jsonObject.get("name");
                String yelping_since = (String) jsonObject.get("yelping_since");
                Integer yelping_since_year = Integer.parseInt(yelping_since.
                        substring(0, 4));
                Integer yelping_since_month = Integer.parseInt(yelping_since.
                        substring(5, 7));

                String user_type = (String) jsonObject.get("type");

                Long cool = (Long) ((JSONObject) (Object) jsonObject.
                        get("votes")).get("cool");
                Long funny = (Long) ((JSONObject) (Object) jsonObject.
                        get("votes")).get("funny");
                Long useful = (Long) ((JSONObject) (Object) jsonObject.
                        get("votes")).get("useful");

                Long fans = (Long) jsonObject.get("fans");
                Double average_stars = (Double) jsonObject.get("average_stars");
                Long review_count = (Long) jsonObject.get("review_count");

                preparedStatement.setString(1, user_id);
                preparedStatement.setString(2, user_name);
                preparedStatement.setInt(3, yelping_since_year);
                preparedStatement.setInt(4, yelping_since_month);
                preparedStatement.setString(5, user_type);
                preparedStatement.setLong(6, cool);
                preparedStatement.setLong(7, funny);
                preparedStatement.setLong(8, useful);
                preparedStatement.setLong(9, fans);
                preparedStatement.setDouble(10, average_stars);
                preparedStatement.setLong(11, review_count);

                preparedStatement.executeUpdate();
                preparedStatement.close();
            }
        } catch (NullPointerException e) {
            System.out.println("Yelp_User inserted!");
        }
    }

    public static void reviewTable(Connection connection)
            throws ParseException, FileNotFoundException,
            IOException, SQLException {
        PreparedStatement preparedStatement = null;
        try {
            BufferedReader br = new BufferedReader(new FileReader(file_review));
            while (true) {
                preparedStatement = connection.prepareStatement("Insert "
                        + "into review values (?,?,?,?,?,?,?,?,?,?)");
                JSONObject jsonObject = (JSONObject) (Object) (new JSONParser().
                        parse(br.readLine()));
                Long votes_useful = (Long) ((JSONObject) (Object) jsonObject.
                        get("votes")).get("useful");
                Long votes_funny = (Long) ((JSONObject) (Object) jsonObject.
                        get("votes")).get("funny");
                Long votes_cool = (Long) ((JSONObject) (Object) jsonObject.
                        get("votes")).get("cool");
                String user_id = (String) jsonObject.get("user_id");
                String review_id = (String) jsonObject.get("review_id");
                String business_id = (String) jsonObject.get("business_id");
                Long stars = (Long) jsonObject.get("stars");
                Date date_of_review = Date.valueOf((String) jsonObject.
                        get("date"));
                String text = (String) jsonObject.get("text");
                String review_type = (String) jsonObject.get("type");
                preparedStatement.setLong(1, votes_useful);
                preparedStatement.setLong(2, votes_funny);
                preparedStatement.setLong(3, votes_cool);
                preparedStatement.setString(4, user_id);
                preparedStatement.setString(5, review_id);
                preparedStatement.setString(6, business_id);
                preparedStatement.setLong(7, stars);
                preparedStatement.setDate(8, date_of_review);
                preparedStatement.setString(9, text);
                preparedStatement.setString(10, review_type);
                preparedStatement.executeUpdate();
                preparedStatement.close();
            }
        } catch (NullPointerException e) {
            System.out.println("Table review inserted!");
        }
    }

    public static void friends_of_userTable(Connection connection)
            throws SQLException, IOException, ParseException {
        PreparedStatement preparedStatement = null;
        try {
            BufferedReader br = new BufferedReader(new FileReader(file_user));
            while (true) {
                preparedStatement = connection.prepareStatement("Insert "
                        + "into friends_of_user values (?,?)");
                JSONObject jsonObject = null;
                try {
                    jsonObject = (JSONObject) (Object) (new JSONParser().
                            parse(br.readLine()));
                } catch (ParseException ex) {
                    Logger.getLogger(Populate.class.getName()).log(Level.SEVERE,
                            null, ex);
                }

                JSONArray friends = (JSONArray) jsonObject.get("friends");

                String user_id = (String) jsonObject.get("user_id");
                int no_of_friends = friends.size();

                preparedStatement.setString(1, user_id);
                preparedStatement.setInt(2, no_of_friends);
                preparedStatement.executeUpdate();
                preparedStatement.close();
            }
        } catch (NullPointerException e) {
            System.out.println("Friends table updated!");
        }
    }

    public static void business_sub_categoryTable(Connection connection)
            throws SQLException, FileNotFoundException, IOException {
        PreparedStatement preparedStatement = null;
        try {
            BufferedReader br = new BufferedReader(new FileReader(file_business));
            while (true) {
                JSONObject jsonObject = null;
                try {
                    jsonObject = (JSONObject) (Object) (new JSONParser().
                            parse(br.readLine()));
                } catch (ParseException ex) {
                    Logger.getLogger(Populate.class.getName()).log(Level.SEVERE,
                            null, ex);
                }

                JSONArray categories = (JSONArray) jsonObject.get("categories");
                String[] all = new String[10000];
                String business_id;
                for (int i = 0; i < categories.size(); i++) {
                    business_id = (String) jsonObject.get("business_id");
                    all[i] = (String) categories.get(i);
                    check_categories(all[i], business_id, preparedStatement);

                }
            }
        } catch (NullPointerException e) {
            System.out.println("Business subcategory inserted!");
        }

    }

    public static void check_categories(String category,
            String business_id, PreparedStatement preparedStatement)
            throws SQLException {
        if ((category.equalsIgnoreCase("Active Life"))
                | (category.equalsIgnoreCase("Arts & Entertainment"))
                | (category.equalsIgnoreCase("Automotive"))
                | (category.equalsIgnoreCase("Car Rental"))
                | (category.equalsIgnoreCase("Cafes"))
                | (category.equalsIgnoreCase("Beauty & Spas"))
                | (category.equalsIgnoreCase("Convenience Stores"))
                | (category.equalsIgnoreCase("Dentists"))
                | (category.equalsIgnoreCase("Doctors"))
                | (category.equalsIgnoreCase("Drugstores"))
                | (category.equalsIgnoreCase("Department Stores"))
                | (category.equalsIgnoreCase("Education"))
                | (category.equalsIgnoreCase("Event Planning & Services"))
                | (category.equalsIgnoreCase("Flowers & Gifts"))
                | (category.equalsIgnoreCase("Food"))
                | (category.equalsIgnoreCase("Health & Medical"))
                | (category.equalsIgnoreCase("Home & Garden"))
                | (category.equalsIgnoreCase("Hospitals"))
                | (category.equalsIgnoreCase("Home Services"))
                | (category.equalsIgnoreCase("Hotels & Travel"))
                | (category.equalsIgnoreCase("Hardware Stores"))
                | (category.equalsIgnoreCase("Grocery"))
                | (category.equalsIgnoreCase("Medical Centers"))
                | (category.equalsIgnoreCase("Nurseries & Gardening"))
                | (category.equalsIgnoreCase("Nightlife"))
                | (category.equalsIgnoreCase("Restaurants"))
                | (category.equalsIgnoreCase("Shopping"))
                | (category.equalsIgnoreCase("Transportation"))) {
            preparedStatement = connection.prepareStatement("Insert "
                    + "into business_category values (?,?)");
            preparedStatement.setString(1, business_id);
            preparedStatement.setString(2, category);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } else {
            preparedStatement = connection.prepareStatement("Insert "
                    + "into business_sub_category values (?,?)");
            preparedStatement.setString(1, business_id);
            preparedStatement.setString(2, category);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }
    }

    public static void business_Table(Connection connection) throws FileNotFoundException, SQLException, IOException {
        PreparedStatement preparedStatement = null;
        try {
            BufferedReader br = new BufferedReader(new FileReader(file_business));
            while (true) {
                JSONObject jsonObject = null;
                try {
                    jsonObject = (JSONObject) (Object) (new JSONParser().
                            parse(br.readLine()));
                } catch (ParseException ex) {
                    Logger.getLogger(Populate.class.getName()).log(Level.SEVERE,
                            null, ex);
                }

                JSONArray categories = (JSONArray) jsonObject.get("categories");
                String[] all = new String[10000];
                String business_id;
                for (int i = 0; i < categories.size(); i++) {
                    business_id = (String) jsonObject.get("business_id");
                    all[i] = (String) categories.get(i);
                    check_categories(all[i], business_id, preparedStatement);

                }
            }
        } catch (NullPointerException e) {
            System.out.println("Business Cateogry updated!");
        }

    }
}
