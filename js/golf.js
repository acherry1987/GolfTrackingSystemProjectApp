
function testAddScore() {
  addScore('Andrew Cherry', 'Grey Silo', "2015-08-20", 0, 90, 20.5);
}
function addScore($username, $coursename, $dateplayed, $rawscore, $netscore, $handicap) {
  // (1, 1, "2015-08-20", 0, 90, 20.5)
  jQuery.ajax({ type: "POST", url: '/php/golfdb.php', dataType: 'json',
     data: {functionname: 'addScore', arguments: [$username, $coursename, $dateplayed, $rawscore, $netscore, $handicap]},
     success: function (obj, textstatus) {
        console.log(textstatus);
     }
  });
}

function getUser() {
  $username = $("#UserName").val();
  jQuery.ajax({ type: "POST", url: '/php/golfdb.php', dataType: 'json',
     data: {functionname: 'getUser', arguments: [$username]},
     success: function (obj, textstatus) {
          if( !('error' in obj) ) {
              console.log(JSON.stringify(obj));
              $user = "name: " + obj.result.name
                      + ", email: " + obj.result.email
                      + ", handicap: " + obj.result.handicap;
              $("#user").append("<p>" + $user + "</p>");
          }
          else {
              console.log(obj.error);
          }
     }
  });
};
