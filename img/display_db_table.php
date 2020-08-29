<?php
$user = "root";
$password = "";
$database = "wordpress";
$table = "todo_list";

try {
  $db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);
  echo "<h2>TODO</h2><ol>";
  foreach($db->query("SELECT content FROM $table") as $row) {
    echo "<li>" . $row['content'] . "</li>";
  }
  echo "</ol>";
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

/*
docker exec -it ft_server bash

mariadb -u root -p
> CREATE TABLE wordpress.todo_list (item_id INT AUTO_INCREMENT,content VARCHAR(255),PRIMARY KEY(item_id));
> INSERT INTO wordpress.todo_list (content) VALUES ("My first important item");
> SELECT * FROM wordpress.todo_list;
> exit

Add to Dockerfile: COPY img/display_db_table.php /var/www/html/

*/