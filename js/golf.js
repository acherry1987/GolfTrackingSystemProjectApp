
function loadUsers() {
  jQuery.ajax({ type: "POST", url: '/php/golfdb.php', dataType: 'json',
     data: {functionname: 'getUsers', arguments: [1]},
     success: function (obj, textstatus) {
          if( !('error' in obj) ) {
            for (var i = 0; i < obj.users.length; i++) {
                 $user = obj.users[i];
                 console.log(JSON.stringify(obj));
                 //console.log(obj.users[i].email);
                 $userText = "id: " + $user.id
                         + ", first: " + $user.firstName
                         + ", last: " + $user.lastName
                         + ", email: " + $user.email
                         + ", handicap: " + $user.handicap;
                 $("#users").append("<p>" + $userText + "</p>");
            }
          }
          else {
              console.log(obj.error);
          }
     }
  });
}

function testAddScore() {
  addScore(1, 1, "2015-08-20", 0, 90, 20.5);
}
function addScore($iduser, $idgolfcourse, $dateplayed, $rawscore, $netscore, $handicap) {
  // (1, 1, "2015-08-20", 0, 90, 20.5)
  jQuery.ajax({ type: "POST", url: '/php/golfdb.php', dataType: 'json',
     data: {functionname: 'addScore', arguments: [$iduser, $idgolfcourse, $dateplayed, $rawscore, $netscore, $handicap]},
     success: function (obj, textstatus) {
        console.log(textstatus);
     }
  });
}

function getUser() {
  $id = $("#UserId").val();
  jQuery.ajax({ type: "POST", url: '/php/golfdb.php', dataType: 'json',
     data: {functionname: 'getUser', arguments: [$id]},
     success: function (obj, textstatus) {
          if( !('error' in obj) ) {
              console.log(JSON.stringify(obj));
              $user = "id: " + obj.result.id
                      + ", first: " + obj.result.firstName
                      + ", last: " + obj.result.lastName
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
