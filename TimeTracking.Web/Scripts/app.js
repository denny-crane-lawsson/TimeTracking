
$(document).ready(function () {
    initial();
});

function initial() {
    $('#description').val('');
    $("#datepicker").datepicker().datepicker("setDate", new Date());
    $('#start').timepicker({
        'timeFormat': 'H:i',
        'scrollDefault': 'now',
        'step': 15
    });
    $('#stop').timepicker({
        'timeFormat': 'H:i',
        'scrollDefault': 'now',
        'step': 15
    });

    // Load Users
    var jqxhr = $.get("/api/users", function (data) {
        $('#user').empty();
        $('#user').append($("<option/>", {
            value: '',
            text: 'Select User'
        }));

        $.each(data, function (index, obj) {
            $('#user').append($("<option/>", {
                value: obj.UserID,
                text: obj.Name
            }));
        });
    })
      .fail(function (jqXHR, status, errorThrown) {
          //alert("error");
      });

    // Load Projects
    var jqxhr = $.get("/api/projects", function (data) {
        $('#project').empty();
        $('#project').append($("<option/>", {
            value: '',
            text: 'Select Project'
        }));

        $.each(data, function (index, obj) {
            $('#project').append($("<option/>", {
                value: obj.ProjectID,
                text: obj.Name
            }));
        });
    })
      .fail(function (jqXHR, status, errorThrown) {
          //alert("error");
      });
}

function save() {
    alert("Implement code to post new time to server.");
}

function reset() {
    alert("Implement code to delete time to server.");
}