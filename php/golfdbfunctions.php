<?php

class GolfDb {
  // Keep a single database connect per class
  private $db = null;

  function __construct() {
    $this->db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
  }

  //$db = new PDO('mysql:host=127.0.0.1;port=8889;dbname=Golf;charset=utf8', 'root', 'root');
  public function addScore($score) {
    // The handicap is calculated based on the course rating and slope
    $golfcourse = $this->getGolfCourse($score->coursename);
    // This is the calculation to figure out the handicap for a single round
    $handicap = floatval(($score->netscore - $golfcourse->rating) * 113 / $golfcourse->slope);

    $stmt = $this->db->prepare("INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap) VALUES (:userName, :courseName, :datePlayed, :rawScore, :netScore, :handicap)");
    $stmt->bindParam(':userName', $score->username);
    $stmt->bindParam(':courseName', $score->coursename);
    $stmt->bindParam(':datePlayed', $score->dateplayed);
    $stmt->bindParam(':netScore', $score->netscore );
    $stmt->bindParam(':handicap', $handicap);
    $stmt->bindParam(':rawScore', $score->rawscore);
    $stmt->execute();

    // Now delete the oldest score if we have more that 20 scores
    $this->deleteOldestScore($score->username);
  }

  public function getGolfCourse($coursename) {
    $sth = $this->db->prepare('SELECT rating, slope FROM GolfCourse WHERE name = :name LIMIT 1');
    $sth->bindParam(':name', $coursename, PDO::PARAM_STR);
    $sth->execute();
    $golfcourse = new GolfCourse();
    $golfcourse->name = $coursename;
    if ($sth->rowCount() == 1) {
      $row = $sth->fetch();
      $golfcourse->rating = floatval($row['rating']);
      $golfcourse->slope = intval($row['slope']);
    }
    return $golfcourse;
  }

  public function deleteOldestScore($username) {
    // See how many scores we have for this user
    $sth = $this->db->prepare('SELECT COUNT(userName) as total FROM Score WHERE userName = :username');
    $sth->bindParam(':username', $username, PDO::PARAM_STR);
    $sth->execute();
    $row = $sth->fetch();
    $total = intval($row['total']);
    if ($total > 20) {
      // For handicapping - you only store the last 20 scores by date and use the
      // lowest 10 scores to calculate the handicap - so we have more than 20
      // delete the oldest one.
      $sth2 = $this->db->prepare('DELETE FROM Score WHERE userName = :username ORDER BY datePlayed ASC LIMIT 1');
      $sth2->bindParam(':username', $username, PDO::PARAM_STR);
      $sth2->execute();
    }
  }

  public function getUsers() {
    //console.log('in get users');
    $users = array();
    foreach($this->db->query('SELECT name, email FROM User;') as $row) {
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
    $sth = $this->db->prepare('SELECT email FROM User WHERE name = :name LIMIT 1');
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
    // To calucate the handicap we take the average of the lowest 10 scores
    // and multiply by 0.96
    $sth = $this->db->prepare('SELECT AVG(handicap) AS handicap FROM (SELECT handicap FROM Score WHERE userName = :userName ORDER BY handicap ASC LIMIT 10) AS tempScore');
    $sth->bindParam(':userName', $name, PDO::PARAM_STR);
    $sth->execute();
    if ($sth->rowCount() == 1) {
      $row = $sth->fetch();
      $handicap = $row['handicap'];
      return $handicap * 0.96;
    } else {
      return 0;
    }
  }
}
?>
