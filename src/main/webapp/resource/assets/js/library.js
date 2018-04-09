 function  getPath(){

                     var pathName = document.location.pathname;
                     var index = pathName.substr(1).indexOf("/");
                    var result = pathName.substr(0,index+1);
                    return result;

                 }
var LIBS = {
	// Chart libraries
	plot: [
		getPath()+"/resource/libs/misc/flot/jquery.flot.min.js",
		getPath()+"/resource/libs/misc/flot/jquery.flot.pie.min.js",
		getPath()+"/resource/libs/misc/flot/jquery.flot.stack.min.js",
		getPath()+"/resource/libs/misc/flot/jquery.flot.resize.min.js",
		getPath()+"/resource/libs/misc/flot/jquery.flot.curvedLines.js",
		getPath()+"/resource/libs/misc/flot/jquery.flot.tooltip.min.js",
		getPath()+"/resource/libs/misc/flot/jquery.flot.categories.min.js"
	],
	chart: [
		'/resource/libs/misc/echarts/build/dist/echarts-all.js',
		'/resource/libs/misc/echarts/build/dist/theme.js',
		'/resource/libs/misc/echarts/build/dist/jquery.echarts.js'
	],
	circleProgress: [
		getPath()+"/resource/libs/bower/jquery-circle-progress/dist/circle-progress.js"
	],
	sparkline: [
		getPath()+"/resource/libs/misc/jquery.sparkline.min.js"
	],
	maxlength: [
		getPath()+"/resource/libs/bower/bootstrap-maxlength/src/bootstrap-maxlength.js"
	],
	tagsinput: [
		getPath()+"/resource/libs/bower/bootstrap-tagsinput/dist/bootstrap-tagsinput.css",
		getPath()+"/resource/libs/bower/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js",
	],
	TouchSpin: [
		getPath()+"/resource/libs/bower/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css",
		getPath()+"/resource/libs/bower/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"
	],
	selectpicker: [
		getPath()+"/resource/libs/bower/bootstrap-select/dist/css/bootstrap-select.min.css",
		getPath()+"/resource/libs/bower/bootstrap-select/dist/js/bootstrap-select.min.js"
	],
	filestyle: [
		getPath()+"/resource/libs/bower/bootstrap-filestyle/src/bootstrap-filestyle.min.js"
	],
	timepicker: [
		getPath()+"/resource/libs/bower/bootstrap-timepicker/js/bootstrap-timepicker.js"
	],
	datetimepicker: [
		getPath()+"/resource/libs/bower/moment/moment.js",
		getPath()+"/resource/libs/bower/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css",
		getPath()+"/resource/libs/bower/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"
	],
	select2: [
		getPath()+"/resource/libs/bower/select2/dist/css/select2.min.css",
		getPath()+"/resource/libs/bower/select2/dist/js/select2.full.min.js"
	],
	vectorMap: [
		getPath()+"/resource/libs/misc/jvectormap/jquery-jvectormap.css",
		getPath()+"/resource/libs/misc/jvectormap/jquery-jvectormap.min.js",
		getPath()+"/resource/libs/misc/jvectormap/maps/jquery-jvectormap-us-mill.js",
		getPath()+"/resource/libs/misc/jvectormap/maps/jquery-jvectormap-world-mill.js",
		getPath()+"/resource/libs/misc/jvectormap/maps/jquery-jvectormap-africa-mill.js"
	],
	summernote: [
		getPath()+"/resource/libs/bower/summernote/dist/summernote.css",
		getPath()+"/resource/libs/bower/summernote/dist/summernote.min.js"
	],
	DataTable: [
		getPath()+"/resource/libs/misc/datatables/datatables.min.css",
		getPath()+"/resource/libs/misc/datatables/datatables.min.js"
	],
	fullCalendar: [
		getPath()+"/resource/libs/bower/moment/moment.js",
		getPath()+"/resource/libs/bower/fullcalendar/dist/fullcalendar.min.css",
		getPath()+"/resource/libs/bower/fullcalendar/dist/fullcalendar.min.js"
	],
	dropzone: [
		getPath()+"/resource/libs/bower/dropzone/dist/min/dropzone.min.css",
		getPath()+"/resource/libs/bower/dropzone/dist/min/dropzone.min.js"
	],
	counterUp: [
		getPath()+"/resource/libs/bower/waypoints/lib/jquery.waypoints.min.js",
		getPath()+"/resource/libs/bower/counterup/jquery.counterup.min.js"
	],
	others: [
		getPath()+"/resource/libs/bower/switchery/dist/switchery.min.css",
		getPath()+"/resource/libs/bower/switchery/dist/switchery.min.js",
		getPath()+"/resource/libs/bower/lightbox2/dist/css/lightbox.min.css",
		getPath()+"/resource/libs/bower/lightbox2/dist/js/lightbox.min.js"
	]
};