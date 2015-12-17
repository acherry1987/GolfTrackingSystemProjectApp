<?php

class User {
  public $id = 0;
  public $firstName = "";
  public $lastName = "";
  public $email = "";
  public $handicap = 0;
}

class Score {
  public $id = 0;
  public $iduser = 0;
  public $idgolfcourse = 0;
  public $dateplayed = "";
  public $netscore = 0;
  public $handicap = 0;
  public $rawscore = 0;
}


?>
