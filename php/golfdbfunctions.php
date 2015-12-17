<?php
//include 'classes.php';

class GolfDb {
  //$db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
  public function addScore($score) {
    $db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
    $stmt = $db->prepare("INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES (:idUser, :idGolfCourse, :datePlayed, :rawScore, :netScore, :handicap)");
    $stmt->bindParam(':idUser', $score->iduser);
    $stmt->bindParam(':idGolfCourse', $score->idgolfcourse);
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
    foreach($db->query('SELECT id, email, firstName, lastName FROM User;') as $row) {
      //console.log("Found a user");
      $user = new User();
      $user->id = $row['id'];
      $user->email = $row['email'];
      $user->firstName = $row['firstName'];
      $user->lastName = $row['lastName'];
      $user->handicap = $this->getHandicap($user->id);
      $users[] = $user;
    }
    return $users;
  }

  public function getUser($id) {
    //openlog("golf", LOG_PID | LOG_PERROR, LOG_LOCAL0);
    //syslog(LOG_WARNING, "getUser: $id");
    // Get the User with id = $id from the database
    $db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
    $sth = $db->prepare('SELECT id, email, firstName, lastName FROM User WHERE id = :id LIMIT 1');
    $sth->bindParam(':id', $id, PDO::PARAM_INT);
    $sth->execute();
    $user = new User();
    if ($sth->rowCount() == 1) {
      $row = $sth->fetch();
      $user->id = $row['id'];
      $user->email = $row['email'];
      $user->firstName = $row['firstName'];
      $user->lastName = $row['lastName'];
      $user->handicap = $this->getHandicap($id);
    }
    return $user;
  }

  public function getHandicap($id) {
    $db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
    $sth = $db->prepare('SELECT AVG(handicap) AS handicap FROM (SELECT handicap FROM Score WHERE idUser = :id ORDER BY handicap ASC LIMIT 10) AS tempScore');
    $sth->bindParam(':id', $id, PDO::PARAM_INT);
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
