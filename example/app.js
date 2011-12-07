// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
window.open();

var but = Ti.UI.createButton({title: 'switch tv out', left: 10, top:20, height: 30, width:'90%'});
window.add(but);
var sw = false;
but.addEventListener('click', function(){
        if (sw) {
                tvout.stop();
                sw = false;
        } else {
                tvout.start();
                sw = true;
        }
});

// TODO: write your module tests here
var tvout = require('com.tvout');
Ti.API.info("module is => " + tvout);

