<?php

ini_set( 'display_errors', 1 );
ini_set( 'display_startup_errors', 1 );


include 'classes.php';
include 'golfdbfunctions.php';

    header('Content-Type: application/json');
    $golfdb = new GolfDb();
    $aResult = array();

    if( !isset($_POST['functionname']) ) { $aResult['error'] = 'No function name!'; }

    if( !isset($_POST['arguments']) ) { $aResult['error'] = 'No function arguments!'; }

    if( !isset($aResult['error']) ) {

        switch($_POST['functionname']) {
            case 'getUser':
               if( !is_array($_POST['arguments']) || (count($_POST['arguments']) < 1) ) {
                   $aResult['error'] = 'Error in arguments!';
               } else {
                   $id = intval($_POST['arguments'][0]);
                   $golfdb = new GolfDb();
                   $aResult['result'] = $golfdb->getUser($id);
               }
               break;
             case 'addScore':
              if( !is_array($_POST['arguments']) || (count($_POST['arguments']) < 6) ) {
                $aResult['error'] = 'Error in arguments!';
              } else {
                $score = new Score();
                $score->iduser = intval($_POST['arguments'][0]);
                $score->idgolfcourse = intval($_POST['arguments'][1]);
                $score->dateplayed = strval($_POST['arguments'][2]);
                $score->rawscore = intval($_POST['arguments'][3]);
                $score->netscore = intval($_POST['arguments'][4]);
                $score->handicap = floatval($_POST['arguments'][5]);
                $golfdb = new GolfDb();
                $golfdb->addScore($score);
              }
                break;
            case 'getUsers':
               $aResult['users'] = $golfdb->getUsers();
               break;
            default:
               $aResult['error'] = 'Not found function '.$_POST['functionname'].'!';
               break;
        }

    }

    echo json_encode($aResult);
?>
