<?php
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
