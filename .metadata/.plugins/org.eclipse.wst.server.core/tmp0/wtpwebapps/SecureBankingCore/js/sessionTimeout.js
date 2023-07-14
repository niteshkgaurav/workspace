var sessServerAliveTime = 3 * 60 * 2;
var sessionTimeout = 3 * 60000;
var sessLastActivity;
var idleTimer, remainingTimer;
var isTimout = false;
var sess_intervalID, idleIntervalID;
var isIdleTimerOn = false;
localStorage.setItem('sessionSlide', 'isStarted');

function sessPingServer() {
    if (!isTimout) {
         return true;
    }
}

function sessServerAlive() {
    sess_intervalID = setInterval('sessPingServer()', sessServerAliveTime);
}

function initSessionMonitor() {
    sessServerAlive();
    startIdleTime();
}



$(window).scroll(function (e) {
    localStorage.setItem('sessionSlide', 'isStarted');
    startIdleTime();
});

$(window).click(function (e) {
    localStorage.setItem('sessionSlide', 'isStarted');
    startIdleTime();
});

function startIdleTime() {
    stopIdleTime();
    localStorage.setItem("sessIdleTimeCounter", $.now());
    idleIntervalID = setInterval('checkIdleTimeout()', 1000);
    isIdleTimerOn = false;
}


function sessionExpiredClicked(evt) {
    window.location = "/securebanking";
}


function stopIdleTime() {
    clearInterval(idleIntervalID);
    clearInterval(remainingTimer);
}

function checkIdleTimeout() {
    var idleTime = (parseInt(localStorage.getItem('sessIdleTimeCounter')) + (sessionTimeout)); 
    if ($.now() > idleTime + 60000) {
        $("#session-expired-modal").modal('show');  
        clearInterval(sess_intervalID);
        clearInterval(idleIntervalID);

        $('.modal-backdrop').css("z-index", parseInt($('.modal-backdrop').css('z-index')) + 100);
        $("#session-expired-modal").css('z-index', 2000);
        $('#btnExpiredOk').css('background-color', '#428bca');
        $('#btnExpiredOk').css('color', '#fff');
        isTimout = true;
    }
}


$('#session-expired-modal').on('shown.bs.modal', function () {
    $(this).before($('.modal-backdrop'));
    $(this).css("z-index", parseInt($('.modal-backdrop').css('z-index')) + 1);
});

$("#session-expired-modal").on("hidden.bs.modal", function () {
    window.location = "/securebanking/";
});

function sessLogOut() {
	window.location = "/securebanking/AdminUI/login/logout";
}
