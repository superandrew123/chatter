/*
* Plugin that Counts Down to Post expired Date and Time
*/
(function (e) {             // passing the event object
    //  create a subclass of jQuery and a companion 
    // init helper class, derive your helper class from 
    // your actual jQuery subclass, and ensure your 
    // subclass’s constructor actually returns an 
    // instance of your init class.
    e.fn.countdown = function (t, n) {      // fn = jQuery.prototype
        // By subclassing jQuery, and working strictly with instances of your subclass, you hide all your plugins from anyone who’s directly instantiating the plain jQuery class.
        // fn contains all of the jQuery object methods on the event function of the countdown class and we want to write
        // our own method for each instance
    function i() {
        //  Assign the callback upon initialization, format the countdown %w weeks %d days %H hours %M minutes %S seconds where each directive value is displayed within his own DOM element
        eventDate = Date.parse(r.date) / 1e3;
        currentDate = Math.floor(e.now() / 1e3);
        seconds = eventDate - currentDate;
        days = Math.floor(seconds / 86400);
        seconds -= days * 60 * 60 * 24;
        hours = Math.floor(seconds / 3600);
        seconds -= hours * 60 * 60;
        minutes = Math.floor(seconds / 60);
        seconds -= minutes * 60;
        days == 1 ? thisEl.find(".timeRefDays").text("day") : thisEl.find(".timeRefDays").text("days");
        hours == 1 ? thisEl.find(".timeRefHours").text("hour") : thisEl.find(".timeRefHours").text("hours");
        minutes == 1 ? thisEl.find(".timeRefMinutes").text("minute") : thisEl.find(".timeRefMinutes").text("minutes");
        seconds == 1 ? thisEl.find(".timeRefSeconds").text("second") : thisEl.find(".timeRefSeconds").text("seconds");
        if (r["format"] == "on") {
            days = String(days).length >= 2 ? days : "0" + days;
            hours = String(hours).length >= 2 ? hours : "0" + hours;
            minutes = String(minutes).length >= 2 ? minutes : "0" + minutes;
            seconds = String(seconds).length >= 2 ? seconds : "0" + seconds
        }
        if (!isNaN(eventDate)) {
            thisEl.find(".days").text(days);
            thisEl.find(".hours").text(hours);
            thisEl.find(".minutes").text(minutes);
            thisEl.find(".seconds").text(seconds)
        } else {
            alert("Invalid date. Example: 30 Tuesday 2013 15:50:00");
            clearInterval(interval)
        }
    }
    var thisEl = e(this);
    var r = {
        date: null,
        format: null
    };
    // Merge the contents of the event object onto the jQuery prototype to provide new jQuery instance methods.   
    //The jQuery.fn.extend() method extends the jQuery prototype ($.fn) object to provide new methods that can be chained to the jQuery() function.

// Inside the myPlugin function(e.fn.countdown), this refers to 
// the jQuery object the function was called from. And depending on the 
// type of plugin, jQuery objects can be returned so the results can be 
// chained. Settings can be handled with jQuery.extend.
    t && e.extend(r, t);  
    i();  //  call function i with the new extended event jQuery instance 
    interval = setInterval(i, 1e3)  //  set interval to 1e3 = 1000 = 1 second 
    }
    })(jQuery);
// Use an Immediately Invoked Function Expression with (jQuery)

// You can continue to use the standard $ by wrapping your 
// code in an immediately invoked function expression; this is also 
// a standard pattern for jQuery plugin authoring, where the 
// author cannot know whether another library will have taken 
// over the $. 

    $(document).ready(function () {  //  To defer executing the e function it uses an anonymous functino as a wrappper.  The anonymous function calls function e after the document is loaded.
    function e() {
        //  this code can be useful if you don't have the exiration date stored in the database:
        // var e = new Date;  //create a date object with the current date and time
        // e.setDate(e.getDate() + 60);
        // dd = e.getDate();
        // mm = e.getMonth() + 1;
        // y = e.getFullYear();
        // futureFormattedDate = mm + "/" + dd + "/" + y;
        // return futureFormattedDate
    }

    $(".countdown").each(function(){    //loop through all divs with countdown as class
        $(this).countdown({
            date: $(this).children('.expiredate').attr("value"),  //the expire date from the database
            format: "on"
        });
    })
});