<?php
//include 'classes.php';

class GolfDb {
  //$db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
  public function addScore($score) {
    $db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
    $stmt = $db->prepare("INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap) VALUES (:userName, :courseName, :datePlayed, :rawScore, :netScore, :handicap)");
    $stmt->bindParam(':userName', $score->username);
    $stmt->bindParam(':courseName', $score->coursename);
    $stmt->bindParam(':datePlayed', $score->dateplayed);
    $stmt->bindParam(':netScore', $score->netscore );
    $stmt->bindParam(':handicap', $score->handicap);
    $stmt->bindParam(':rawScore', $score->rawscore);

    $stmt->execute();

  }

  public function getUsers() {
    //console.log('in get users');
    $users = array();
    $db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
    foreach($db->query('SELECT name, email FROM User;') as $row) {
      //console.log("Found a user");
      $user = new User();
      $user->name = $row['name'];
      $user->email = $row['email'];
      $user->handicap = $this->getHandicap($user->name);
      $users[] = $user;
    }
    return $users;
  }

  public function getUser($name) {
    //openlog("golf", LOG_PID | LOG_PERROR, LOG_LOCAL0);
    //syslog(LOG_WARNING, "getUser: $id");
    // Get the User with id = $id from the database
    $db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
    $sth = $db->prepare('SELECT email FROM User WHERE name = :name LIMIT 1');
    $sth->bindParam(':name', $name, PDO::PARAM_STR);
    $sth->execute();
    $user = new User();
    if ($sth->rowCount() == 1) {
      $row = $sth->fetch();
      $user->name = $name;
      $user->email = $row['email'];
      $user->handicap = $this->getHandicap($user->name);
    }
    return $user;
  }

  public function getHandicap($name) {
    $db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
    $sth = $db->prepare('SELECT AVG(handicap) AS handicap FROM (SELECT handicap FROM Score WHERE userName = :userName ORDER BY handicap ASC LIMIT 10) AS tempScore');
    $sth->bindParam(':userName', $name, PDO::PARAM_STR);
    $sth->execute();
    if ($sth->rowCount() == 1) {
      $row = $sth->fetch();
      $handicap = $row['handicap'];
      return $handicap;
    } else {
      return 0;
    }
  }
}
?>
