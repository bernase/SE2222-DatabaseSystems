/**
 *
 * @author tonto
 */

/*
SE2222 - Database Systems - Labwork 2 (Nov 19, 2021)
18070001027 Melek Berna ŞERIT
*/
        
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.lang.reflect.Array;

public class Main {

    public static void main(String[] args) throws SQLException {
        // CREATE A CONNECTION STRING AND PROVIDE USERNAME & PASSWORD
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost", "root", "melek123");

        /*
        ResultSet set = s.executeQuery("SELECT * FROM week8_lab.agriculture");
        getResult(set);
        */
        
        // Question1 --- Find and print how many records there are within the table.
        Statement s = con.createStatement();
        ResultSet set2 = s.executeQuery("SELECT count(RecordID) AS NumberOfRecors FROM week8_lab.agriculture");
        getResult(set2);
        
        // Question2 --- Find and display how many tonnes of each item Turkey is 
        // produced in total within 6-year span(2014-2019).
        ResultSet set3 = s.executeQuery("SELECT SUM(TonnesOfProduction) AS NumberOfTonnesOfApples_TR FROM week8_lab.agriculture WHERE Country = 'Turkey' AND (Year BETWEEN 2014 AND 2019) AND Item = 'Apples' ");
        getResult(set3);
        ResultSet set4 = s.executeQuery("SELECT SUM(TonnesOfProduction) AS NumberOfTonnesOfApricots_TR FROM week8_lab.agriculture WHERE Country = 'Turkey' AND (Year BETWEEN 2014 AND 2019) AND Item = 'Apricots' ");
        getResult(set4);
        ResultSet set5 = s.executeQuery("SELECT SUM(TonnesOfProduction) AS NumberOfTonnesOfCherries_TR FROM week8_lab.agriculture WHERE Country = 'Turkey' AND (Year BETWEEN 2014 AND 2019) AND Item = 'Cherries' ");
        getResult(set5);
        ResultSet set6 = s.executeQuery("SELECT SUM(TonnesOfProduction) AS NumberOfTonnesOfChestnut_TR FROM week8_lab.agriculture WHERE Country = 'Turkey' AND (Year BETWEEN 2014 AND 2019) AND Item = 'Chestnut' ");
        getResult(set6);
        
        // Question3 --- Find and display top 5 countries by production of Apples with 
        // their names and tonnes of production within 6-year span (2014-2019).
        ResultSet set7 = s.executeQuery("SELECT Country, TonnesOfProduction FROM week8_lab.agriculture WHERE Item = 'Apples' AND (Year BETWEEN 2014 AND 2019) ORDER BY TonnesOfProduction DESC LIMIT 5 ");
        getResult(set7);
        
        // Question4 --- Find total production of Blueberries throughout the Europe in year 2014 
        // and compare it to year 2018. Find out which year had more production.
        ResultSet set8 = s.executeQuery("SELECT SUM(TonnesOfProduction) AS NumberOfTonnesOfBlueberries_14 FROM week8_lab.agriculture WHERE Country IN('Albania', 'Austria', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria', 'Croatia', 'Czechia', 'Denmark', 'Estonia', 'Finland', 'France', 'Germany', 'Greece', 'Hungary', 'Ireland', 'Italy', 'Latvia', 'Lithuania', 'Luxembourg', 'Malta', 'Montenegro', 'Netherlands', 'North Macedonia', 'Norway', 'Poland', 'Portugal', 'Republic of Moldova', 'Romania', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 'Switzerland', 'Ukraine', 'United Kingdom of Great Britain and Northern Ireland') AND Year = 2014 AND Item = 'Blueberries' ");
        //int value1 = Integer.parseInt(set8.getObject(1).toString()); //2014
        //int value1 = ((Number) set8.getObject(1)).intValue();
        set8.next();
        int value1 = set8.getInt(1);
        
        ResultSet set9 = s.executeQuery("SELECT SUM(TonnesOfProduction) AS NumberOfTonnesOfBlueberries_14 FROM week8_lab.agriculture WHERE Country IN('Albania', 'Austria', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria', 'Croatia', 'Czechia', 'Denmark', 'Estonia', 'Finland', 'France', 'Germany', 'Greece', 'Hungary', 'Ireland', 'Italy', 'Latvia', 'Lithuania', 'Luxembourg', 'Malta', 'Montenegro', 'Netherlands', 'North Macedonia', 'Norway', 'Poland', 'Portugal', 'Republic of Moldova', 'Romania', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 'Switzerland', 'Ukraine', 'United Kingdom of Great Britain and Northern Ireland') AND Year = 2018 AND Item = 'Blueberries' ");
        set9.next();
        int value2 = set9.getInt(1);
        
        if(value1 > value2){
            System.out.println("Year 2014 had more production than year 2018");
        }else System.out.println("Year 2018 had more production than year 2014");
            
        
        // Question5 --- Add US Total production for Apples in years 2014,2015,2016 to the table provided below.
        
        PreparedStatement st2 = con.
                prepareStatement("INSERT INTO week8_lab.agriculture VALUES(?,?,?,?,?)");
        st2.setString(1, "1183");
        st2.setString(2, "US");
        st2.setString(3, "Apples");
        st2.setString(4, "2014");
        st2.setString(5, "5358740");
        int nrofRowsAffected = st2.executeUpdate();
        if(nrofRowsAffected>=0){
            System.out.println("Query executed successfully with "+nrofRowsAffected+" Rows affected");
        }
        PreparedStatement st3 = con.
                prepareStatement("INSERT INTO week8_lab.agriculture VALUES(?,?,?,?,?)");
        st3.setString(1, "1184");
        st3.setString(2, "US");
        st3.setString(3, "Apples");
        st3.setString(4, "2015");
        st3.setString(5, "4556790");
        int nrofRowsAffected3 = st3.executeUpdate();
        if(nrofRowsAffected3>=0){
            System.out.println("Query executed successfully with "+nrofRowsAffected3+" Rows affected");
        }
        PreparedStatement st4 = con.
                prepareStatement("INSERT INTO week8_lab.agriculture VALUES(?,?,?,?,?)");
        st4.setString(1, "1185");
        st4.setString(2, "US");
        st4.setString(3, "Apples");
        st4.setString(4, "2016");
        st4.setString(5, "5214040");
        int nrofRowsAffected4 = st4.executeUpdate();
        if(nrofRowsAffected4>=0){
            System.out.println("Query executed successfully with "+nrofRowsAffected4+" Rows affected");
        }
        
        
        // Question6 --- Add US Total production for Pineapples in years 2014,2015,2016 to the table provided below. 
        PreparedStatement st5 = con.
                prepareStatement("INSERT INTO week8_lab.agriculture VALUES(?,?,?,?,?)");
        st5.setString(1, "1186");
        st5.setString(2, "US");
        st5.setString(3, "Pineapples");
        st5.setString(4, "2014");
        st5.setString(5, "175000");
        int nrofRowsAffected5 = st5.executeUpdate();
        if(nrofRowsAffected5>=0){
            System.out.println("Query executed successfully with "+nrofRowsAffected5+" Rows affected");
        }
        PreparedStatement st6 = con.
                prepareStatement("INSERT INTO week8_lab.agriculture VALUES(?,?,?,?,?)");
        st6.setString(1, "1187");
        st6.setString(2, "US");
        st6.setString(3, "Pineapples");
        st6.setString(4, "2015");
        st6.setString(5, "162429");
        int nrofRowsAffected6 = st6.executeUpdate();
        if(nrofRowsAffected6>=0){
            System.out.println("Query executed successfully with "+nrofRowsAffected6+" Rows affected");
        }
        PreparedStatement st7= con.
                prepareStatement("INSERT INTO week8_lab.agriculture VALUES(?,?,?,?,?)");
        st7.setString(1, "1188");
        st7.setString(2, "US");
        st7.setString(3, "Pineapples");
        st7.setString(4, "2016");
        st7.setString(5, "151837");
        int nrofRowsAffected7 = st7.executeUpdate();
        if(nrofRowsAffected7>=0){
            System.out.println("Query executed successfully with "+nrofRowsAffected7+" Rows affected");
        }
        
        // Question7 --- Update Agriculture table to set production amount for Figs decrease by 25% 
        // for every country that has a production amount other than 0 (TonnesOfProduction>0).
        
        // Question8 --- Update Agriculture table to set grape production in every country to 0 
        // in the year 2015 if the Production amount is less than 100000 tonnes.
        
        // Question9 ---  Delete all the records from the Agriculture table where the Production amount equals to 0
        
        // Question10 ---  Delete all the records from the Agriculture table that belongs to the USA.
      
       
        
    }
    
    private static void getResult(ResultSet set) throws SQLException {

        // first need to get number of columns in the result.
        int numberOfRows = set.getMetaData().getColumnCount();

        // get the name of each column within the result.
        ArrayList<String> columnNames = new ArrayList<>();
        for (int i = 1; i <= numberOfRows; i++) {
            columnNames.add(set.getMetaData().getColumnName(i));
        }
        // get the entire results table into an an arraylist of String arrays.
        List<List<String>> records = new ArrayList<>();
        while (set.next()) {
            List<String> record = new ArrayList<>();
            for (String columnName : columnNames) {
                String nextVal = set.getString(columnName);
                record.add(nextVal);
            }
            records.add(record);
        }
//        for (int i = 0; i < columnNames.size(); i++) {
//            System.out.println(columnNames.get(i));
//        }
        // print out the results
        printResults(columnNames, records);
    }

    private static void printResults(ArrayList<String> columnNames, List<List<String>> records) {
        // print out the column names first
        String x = "";
        for (int i = 0; i < columnNames.size(); i++) {
            x += "%-40s";
        }
        x += "%n";
        System.out.format(x, columnNames.toArray());
        // then the entire data list by list.
        for (int i = 0; i < records.size(); i++) {
            x = "";
            for (int j = 0; j < records.get(i).size(); j++) {
                x += "%-40s";
            }
            x += "%n";
            System.out.format(x, records.get(i).toArray());
        }
    }
    
}


