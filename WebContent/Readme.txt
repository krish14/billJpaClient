 Stock module
-------------------
manufacturer_details
measurement_table
product_qnt
basedata_medicine
batch_details
date_details

Billing module
-------------------
bill_details
purchase_details
rate_details
tax_setup_details
doctor_details

User module
-------------------
user_authentication
user_authorization
user_role_action_mapper


=====================================================

mysql> show tables;
+----------------------+
| Tables_in_bill       |
+----------------------+
| basedata_medicine    |
| batch_details        |
| bill_details         |
| date_details         |
| doctor_details       |
| manufacturer_details |
| measurement_table    |
| product_qnt          |
| purchase_details     |
| rate_details         |
| tax_setup_details    |
+----------------------+
17 rows in set (0.00 sec)

mysql> desc basedata_medicine;
+------------------------+-------------+------+-----+-------------------+----------------+
| Field                  | Type        | Null | Key | Default           | Extra          |
+------------------------+-------------+------+-----+-------------------+----------------+
| product_id             | int(10)     | NO   | PRI | NULL              | auto_increment |
| product_name           | varchar(50) | NO   |     | NULL              |                |
| product_type           | varchar(50) | NO   |     | NULL              |                |
| product_group          | varchar(50) | NO   |     | NULL              |                |
| product_measurement_id | int(10)     | NO   |     | NULL              |                |
| product_measurement    | int(10)     | NO   |     | NULL              |                |
| product_units          | varchar(50) | NO   |     | NULL              |                |
| manufacturer_id        | int(5)      | NO   |     | NULL              |                |
| date                   | timestamp   | NO   |     | CURRENT_TIMESTAMP |                |
+------------------------+-------------+------+-----+-------------------+----------------+
9 rows in set (0.20 sec)

mysql> desc batch_details;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| product_batch | varchar(50)  | NO   | PRI | NULL    |       |
| product_id    | int(10)      | YES  |     | NULL    |       |
| product_name  | varchar(100) | NO   |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
3 rows in set (0.77 sec)

mysql> desc bill_details;
+---------------+--------------+------+-----+-------------------+----------------+
| Field         | Type         | Null | Key | Default           | Extra          |
+---------------+--------------+------+-----+-------------------+----------------+
| bill_id       | int(100)     | NO   | PRI | NULL              | auto_increment |
| bill_date     | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
| customer_name | varchar(100) | NO   |     | NULL              |                |
| doctor_id     | int(5)       | NO   |     | NULL              |                |
+---------------+--------------+------+-----+-------------------+----------------+

mysql> desc date_details;
+-----------------+-------------+------+-----+-------------------+----------------+
| Field           | Type        | Null | Key | Default           | Extra          |
+-----------------+-------------+------+-----+-------------------+----------------+
| product_date_id | int(10)     | NO   | PRI | NULL              | auto_increment |
| product_batch   | varchar(50) | NO   |     | NULL              |                |
| product_id      | int(11)     | NO   |     | NULL              |                |
| mfg_date        | date        | NO   |     | NULL              |                |
| exp_date        | date        | NO   |     | NULL              |                |
| purchase_date   | timestamp   | NO   |     | CURRENT_TIMESTAMP |                |
+-----------------+-------------+------+-----+-------------------+----------------+
6 rows in set (0.01 sec)

mysql> desc doctor_details;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| doctor_id     | int(5)      | NO   |     | NULL    |       |
| doctor_name   | varchar(50) | NO   |     | NULL    |       |
| hospital_name | varchar(50) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
3 rows in set (0.05 sec)

mysql> desc manufacturer_details;
+-------------------------+--------------+------+-----+---------+----------------+
| Field                   | Type         | Null | Key | Default | Extra          |
+-------------------------+--------------+------+-----+---------+----------------+
| manufacturer_id         | int(5)       | NO   | PRI | NULL    | auto_increment |
| manufacturer_name       | varchar(500) | NO   |     | NULL    |                |
| manufacturer_short_name | varchar(5)   | NO   |     | NULL    |                |
+-------------------------+--------------+------+-----+---------+----------------+
3 rows in set (0.13 sec)

mysql> desc measurement_table;
+------------------------+-------------+------+-----+---------+----------------+
| Field                  | Type        | Null | Key | Default | Extra          |
+------------------------+-------------+------+-----+---------+----------------+
| product_measurement_id | int(10)     | NO   | PRI | NULL    | auto_increment |
| product_measurement    | int(10)     | NO   |     | NULL    |                |
| product_unit           | varchar(50) | NO   |     | NULL    |                |
+------------------------+-------------+------+-----+---------+----------------+
3 rows in set (0.14 sec)

mysql> desc product_qnt;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| product_qnt_id | int(50)     | NO   | PRI | NULL    |       |
| product_batch  | varchar(50) | NO   |     | NULL    |       |
| product_id     | int(10)     | NO   |     | NULL    |       |
| product_qnt    | int(10)     | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+

mysql> desc purchase_details;
+-------------------+--------------+------+-----+-------------------+----------------+
| Field             | Type         | Null | Key | Default           | Extra          |
+-------------------+--------------+------+-----+-------------------+----------------+
| purchase_id       | int(10)      | NO   | PRI | NULL              | auto_increment |
| bill_id           | int(100)     | NO   |     | NULL              |                |
| product_id        | int(10)      | NO   |     | NULL              |                |
| product_name      | varchar(100) | NO   |     | NULL              |                |
| product_quantatiy | int(10)      | NO   |     | NULL              |                |
| product_batch     | varchar(50)  | NO   | PRI | NULL              |                |
| shop_name         | varchar(100) | NO   |     | BALA MEDICAL      |                |
| date              | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
| product_rate_id   | int(10)      | NO   |     | NULL              |                |
| product_date_id   | int(10)      | NO   |     | NULL              |                |
+-------------------+--------------+------+-----+-------------------+----------------+
10 rows in set (0.13 sec)

mysql> desc rate_details;
+-------------------------+--------------+------+-----+-------------------+----------------+
| Field                   | Type         | Null | Key | Default           | Extra          |
+-------------------------+--------------+------+-----+-------------------+----------------+
| product_rate_id         | int(10)      | NO   | PRI | NULL              | auto_increment |
| product_batch           | varchar(50)  | NO   |     | NULL              |                |
| product_id              | int(10)      | NO   |     | NULL              |                |
| product_name            | varchar(100) | NO   |     | NULL              |                |
| cost_individual_rate    | int(10)      | NO   |     | NULL              |                |
| selling_individual_rate | int(10)      | NO   |     | NULL              |                |
| ratedetails             | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
+-------------------------+--------------+------+-----+-------------------+----------------+
7 rows in set (0.14 sec)

mysql> desc tax_setup_details;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| tax_id         | int(11)     | NO   | PRI | NULL    | auto_increment |
| tax_name       | varchar(50) | NO   |     | NULL    |                |
| tax_desc       | text        | NO   |     | NULL    |                |
| tax_percentage | tinyint(5)  | NO   |     | NULL    |                |
| tax_flag       | tinyint(1)  | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
5 rows in set (0.13 sec)

=====================================================

http://stackoverflow.com/questions/5718888/jquery-ajax-post-file-field

Try this...

<script type="text/javascript">
      $("#form_oferta").submit(function(event) 
      {
           var myData = $( form ).serialize(); 
           $.ajax({
                type: "POST", 
                contentType:attr( "enctype", "multipart/form-data" ),
                url: " URL Goes Here ",  
                data: myData,  
                success: function( data )  
                {
                     alert( data );
                }
           });
           return false;  
      });
</script>

Here the contentType is specified as multipart/form-data as we do in the form tag, this will work to upload simple file On server side you just need to write simple file upload code to handle this request with echoing message you want to show to user as a response.




There are several differences between HashMap and Hashtable in Java:

    Hashtable is synchronized, whereas HashMap is not. This makes HashMap better for non-threaded applications, as unsynchronized Objects typically perform better than synchronized ones.

    Hashtable does not allow null keys or values. HashMap allows one null key and any number of null values.

    One of HashMap's subclasses is LinkedHashMap, so in the event that you'd want predictable iteration order (which is insertion order by default), you could easily swap out the HashMap for a LinkedHashMap. This wouldn't be as easy if you were using Hashtable.

Since synchronization is not an issue for you, I'd recommend HashMap. If synchronization becomes an issue, you may also look at ConcurrentHashMap.

http://stackoverflow.com/questions/10899384/uploading-both-data-and-files-in-one-form-using-ajax
http://stackoverflow.com/questions/10110805/jquery-post-json-object-to-a-server

http://stackoverflow.com/questions/17498426/upload-file-form-data-spring-mvc-jquery?rq=1

http://java67.blogspot.in/2014/05/3-examples-to-loop-map-in-java-foreach.html

http://www.javaworld.com/article/2077819/java-se/understanding-jpa-part-2-relationships-the-jpa-way.html

